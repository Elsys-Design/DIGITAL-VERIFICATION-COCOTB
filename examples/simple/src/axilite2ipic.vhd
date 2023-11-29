---------------------------------------------------------------------------------------------------
-- CLASSIFICATION    : 
---------------------------------------------------------------------------------------------------
--
--                   Copyright(C), CNES
--
---------------------------------------------------------------------------------------------------
-- File Name         : $filename$
-- Author            : $Author$
-- Project           : $Project_name$
-- Creation Date     : $Date$
-- Current Issue     : $Rev$
-- Safety Level Req. : none
---------------------------------------------------------------------------------------------------
-- Description       : 
--                   : 
---------------------------------------------------------------------------------------------------
-- Revision History
---------------------------------------------------------------------------------------------------
-- Date              : 
-- Modified By       : 

-- Issue Modified    : 
-- Modification      : 
---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------
-- Libraries
---------------------------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------------------
-- Entity
-------------------------------------------------------------------------------------------------
entity axilite2ipic is
    generic(
        G_ADD_MASK              : std_logic_vector(31 downto 0) := x"000000FF"
    );
    port(
        -- system interface
        -----------------------------------------------------------------------
        --! \brief Reset.
        --!
        --! The reset is synchronous and active high.
        i_rst                   : in  std_logic;
        --! \brief Clock.
        --!
        --! The module does not use any other clock inputs nor does it
        --! generate additional clocks internally.
        i_clk                   : in  std_logic;

        -- AXI4 Lite Interface
        -----------------------------------------------------------------------
        --! Write Address Channel
        axil_awaddr             : in  std_logic_vector(31 downto 0);
        axil_awvalid            : in  std_logic;
        axil_awready            : out std_logic;
        --! Write Data Channel  
        axil_wdata              : in  std_logic_vector(31 downto 0);
        axil_wstrb              : in  std_logic_vector( 3 downto 0);
        axil_wvalid             : in  std_logic;
        axil_wready             : out std_logic;
        --! Write Response Channel
        axil_bready             : in  std_logic;
        axil_bresp              : out std_logic_vector( 1 downto 0);
        axil_bvalid             : out std_logic;
        --! Read Address Channel
        axil_araddr             : in  std_logic_vector(31 downto 0);
        axil_arvalid            : in  std_logic;
        axil_arready            : out std_logic;
        --! Read Data Channel   
        axil_rready             : in  std_logic;
        axil_rdata              : out std_logic_vector(31 downto 0);
        axil_rresp              : out std_logic_vector( 1 downto 0);
        axil_rvalid             : out std_logic;

        -- IPIC bus
        -----------------------------------------------------------------------
        IPIC_Ack                : in  std_logic;
        IPIC_Error              : in  std_logic;
        IPIC_Data_Rd            : in  std_logic_vector(31 downto 0);
        IPIC_Req                : out std_logic;
        IPIC_Addr               : out std_logic_vector(31 downto 0);
        IPIC_Data_Wr            : out std_logic_vector(31 downto 0);
        IPIC_RnW                : out std_logic
    );
end axilite2ipic;


----------------------------------------------------------------------------------------------------
-- Architecture
----------------------------------------------------------------------------------------------------

architecture rtl of axilite2ipic is
    -- Constants
    ----------------------
--Slave Response AXI4
constant CST_OKAY        : std_logic_vector(1 downto 0):= "00";
constant CST_SLVERR      : std_logic_vector(1 downto 0):= "10";

    -- Types
    ----------------------
type t_Def_State_Arbiter is (IDLE, ACK);
type t_Def_State_Read is (IDLE, WT_ACK_IP, WT_RD_MASTER);
type t_Def_State_Write is (IDLE, WT_ACK_IP, RSP_TO_MASTER, WT_WR_MASTER);
    
    -- Signals
    ----------------------
-- P_ARBITER
signal s_Rsd_Bus        : std_logic;
signal state_Arbiter    : t_Def_State_Arbiter;
    
-- P_READ
signal s_Req_Arb_Rd     : std_logic;
signal s_Addr_Rd        : std_logic_vector(31 downto 0);
signal state_Read_AXI4  : t_Def_State_Read;

-- P_WRITE
signal s_Req_Arb_Wr      : std_logic;
signal s_Addr_Wr         : std_logic_vector(31 downto 0);
signal state_Write_AXI4  : t_Def_State_Write;
    
begin
    

    ---------------------------------------------------------------------------
    -- Enable acces to IPIC bus to Read and Write Process
    ---------------------------------------------------------------------------
    P_ARBITER : process(i_clk)
    begin
    if (rising_edge(i_clk)) then
        if i_rst = '1' then
            s_Rsd_Bus       <= '0';
            IPIC_Req        <= '0';
            IPIC_Addr       <= (others => '0');
            IPIC_RnW        <= '1';
            state_Arbiter   <= IDLE;
        else
        -- by default

            case state_Arbiter is
                ------------------
                -- IDLE
                ------------------
                when IDLE =>
                    -- request valid from P_READ_AXI4 (read has an higher priority)
                    if (s_Req_Arb_Rd = '1' AND s_Rsd_Bus = '0')then
                        IPIC_Addr        <= s_Addr_Rd AND G_ADD_MASK;
                        IPIC_RnW         <= '1';
                        s_Rsd_Bus        <= '1';
                        IPIC_Req         <= '1';
                        state_Arbiter    <= ACK;
                    -- request valid from P_WRITE_AXI4
                    elsif (s_Req_Arb_Wr = '1' AND s_Rsd_Bus = '0')then
                        IPIC_Addr        <= s_Addr_Wr AND G_ADD_MASK;
                        IPIC_RnW         <= '0';
                        s_Rsd_Bus        <= '1';
                        IPIC_Req         <= '1';
                        state_Arbiter    <= ACK;
                    end if;
                
                ------------------
                -- ACK
                ------------------
                when ACK =>
                    -- wait Acknowledge from IP
                    IPIC_Req <= '0';
                    if (IPIC_Ack = '1') then
                        s_Rsd_Bus        <= '0';
                        --IPIC_Req        <= '0';
                        state_Arbiter    <= IDLE;
                    end if;
                    
                when others =>
            end case;
        end if;
    end if;
    end process;
    
    ---------------------------------------------------------------------------
    -- manage the read channels and request arbiter to access the IPIC
    ---------------------------------------------------------------------------
    P_READ : process(i_clk)
    begin 
    if (rising_edge(i_clk)) then
        if i_rst = '1' then
            axil_arready          <= '0';
            axil_rdata            <= (others => '0');
            axil_rresp            <= (others => '0');
            axil_rvalid           <= '0';
            s_Req_Arb_Rd     <= '0';
            s_Addr_Rd        <= (others => '0');
            state_Read_AXI4  <= IDLE;
        else

            case state_Read_AXI4 is
                ------------------
                -- IDLE
                ------------------
                when IDLE =>
                    axil_arready <= '1';
                    -- wait read address valid from AXI4 bus
                    if (axil_arvalid = '1')then
                        s_Req_Arb_Rd    <= '1';
                        s_Addr_Rd       <= axil_araddr;
                        axil_arready    <= '0';
                        state_Read_AXI4 <= WT_ACK_IP;
                    end if;
                    
                ------------------
                -- WAIT ACK IP
                ------------------
                when WT_ACK_IP =>
                    -- wait data from IP
                    if (IPIC_Ack = '1')then
                        s_Req_Arb_Rd    <= '0';
                        -- read finish without error
                        if (IPIC_Error = '0')then
                            axil_rdata        <= IPIC_Data_Rd;
                            axil_rresp        <= CST_OKAY;
                            axil_rvalid       <= '1';
                        -- detect an error from DECODER module
                        else
                            axil_rdata        <= IPIC_Data_Rd;
                            axil_rresp        <= CST_SLVERR;
                            axil_rvalid       <= '1';
                        end if;
                        state_Read_AXI4 <= WT_RD_MASTER;
                    end if;

                ------------------
                -- WAIT READ MASTER
                ------------------
                when WT_RD_MASTER =>
                    -- wait master to read
                    if (axil_rready = '1')then
                        axil_rvalid          <= '0';
                        axil_arready         <= '1';
                        state_Read_AXI4 <= IDLE;
                    end if;
                
                
                when others =>
                
            end case;
        end if;
    end if;
    end process;

    ---------------------------------------------------------------------------
    -- manage the write channels and request arbiter to access the IPIC
    ---------------------------------------------------------------------------
    P_WRITE : process(i_clk)

    begin
    if (rising_edge(i_clk)) then
        if i_rst = '1' then
            axil_bvalid      <= '0';
            axil_bresp       <= "00";
            axil_awready     <= '0';
            axil_wready      <= '0';
            IPIC_Data_Wr     <= (others => '0');
            s_Addr_Wr        <= (others => '0');
            s_Req_Arb_Wr     <= '0';
            state_Write_AXI4 <= IDLE;    
        else

            case state_Write_AXI4 is
                ------------------
                -- IDLE
                ------------------
                when IDLE =>
                    axil_awready           <= '0';
                    axil_wready            <= '0';
                    -- wait write address valid from AXI4 bus
                    if (axil_awvalid = '1' and axil_wvalid = '1')then
                        IPIC_Data_Wr  <= axil_wdata;
                        s_Addr_Wr     <= axil_awaddr;
                        axil_wready        <= '0';
                        s_Req_Arb_Wr  <= '1';
                        --Awready            <= '0';
                        --Wready            <= '1';
                        state_Write_AXI4<= WT_ACK_IP;
                    end if;

                ------------------
                -- WAIT WRITE IP
                ------------------
                when WT_ACK_IP =>
                    -- wait acknowledge from IP
                    if (IPIC_Ack = '1')then
                        s_Req_Arb_Wr    <= '0';
                        axil_awready         <= '1';
                        axil_wready          <= '1';
                        state_Write_AXI4 <= RSP_TO_MASTER;
                    end if;

                ---------------------
                -- RESPONSE TO MASTER
                ---------------------
                when RSP_TO_MASTER =>
                        axil_awready          <= '0';
                        axil_wready           <= '0';
                        -- write finish without error
                        if (IPIC_Error = '0')then
                            axil_bresp        <= CST_OKAY;
                            axil_bvalid       <= '1';
                        -- detect an error from DECODER module
                        else
                            axil_bresp        <= CST_SLVERR;
                            axil_bvalid       <= '1';
                        end if;
                        state_Write_AXI4 <= WT_WR_MASTER;

                ------------------
                -- WAIT WRITE MASTER
                ------------------
                when WT_WR_MASTER =>
                    -- wait master to accept response
                    if (axil_bready = '1')then
                        axil_bvalid           <= '0';
                        state_Write_AXI4 <= IDLE;
                    end if;

                when others =>

            end case;
        end if;
    end if;
    end process;

end rtl;