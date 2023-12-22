----------------------------------------------------------------------------------
-- Company: Elsys Design
-- Engineer: Nicolas Belland

-- Demultiplexeur OBI avec translations d'addresses et slave select interne
-- en fonction de la table de translation
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library obi_utils;
use obi_utils.obi_pkg.all;
library ic_lib;
use ic_lib.ic_pkg.all;


entity obi_addr_translator is
    generic (
        ADDR_WIDTH      : positive := 32;
        DATA_WIDTH      : positive := 32;
        SLAVE_COUNT     : positive := 4;
        TRANSLATION_TABLE_LENGTH : positive := 2
    );
    port (
        clk			: in  std_logic;
        reset_n 	: in  std_logic;
        
        translation_table   : in translation_table_t(0 to TRANSLATION_TABLE_LENGTH-1);
        
        -- OBI slave port (connect to master)
        m_req       : in  std_logic;
        m_gnt       : out std_logic;
        m_addr      : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        m_we        : in  std_logic;
        m_be        : in  std_logic_vector(DATA_WIDTH/8-1 downto 0);
        m_wdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);

        m_rvalid    : out std_logic;
        m_rready    : in  std_logic;
        m_rdata     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        m_err       : out std_logic;

        -- OBI master ports (connect to slaves)
        s_req      : out std_logic_vector(0 to SLAVE_COUNT-1);
        s_gnt      : in  std_logic_vector(0 to SLAVE_COUNT-1);
        s_addr     : out obi_array_t(0 to SLAVE_COUNT-1)(ADDR_WIDTH-1 downto 0);
        s_we       : out std_logic_vector(0 to SLAVE_COUNT-1);
        s_be       : out obi_array_t (0 to SLAVE_COUNT-1)(DATA_WIDTH/8-1 downto 0);
        s_wdata    : out obi_array_t(0 to SLAVE_COUNT-1)(DATA_WIDTH-1 downto 0);

        s_rvalid   : in  std_logic_vector(0 to SLAVE_COUNT-1);
        s_rready   : out std_logic_vector(0 to SLAVE_COUNT-1);
        s_rdata    : in  obi_array_t(0 to SLAVE_COUNT-1)(DATA_WIDTH-1 downto 0);
        s_err      : in  std_logic_vector(0 to SLAVE_COUNT-1)
    );
end entity;

architecture rtl of obi_addr_translator is
    
    signal req_reg    : std_logic;
    signal addr_reg   : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal slave_select : unsigned(2 downto 0);
--    signal m_req_reg    : std_logic;

    signal error_gnt    : std_logic;
    signal error_rvalid : std_logic;

    type state_t is (AddrCmp, SendReq, SendErr);
    signal state    : state_t := AddrCmp;
    
    type error_state_t is (ErrAddrState, ErrRespState);
    signal error_state  : error_state_t;
begin

gen_a : for i in 0 to SLAVE_COUNT-1 generate
    s_req(i) <= m_req when i = slave_select and state = SendReq else '0';
    
    s_addr(i) <= addr_reg;

    s_we(i) <= m_we;
    s_be(i) <= m_be;
    s_wdata(i) <= m_wdata;
    s_rready(i) <= m_rready;
end generate;

m_gnt <= s_gnt(to_integer(slave_select)) when state = SendReq 
    else error_gnt when state = SendErr
    else '0';
m_rvalid <= s_rvalid(to_integer(slave_select)) when state = SendReq 
    else error_rvalid when state = SendErr
    else '0';
    
m_rdata <= s_rdata(to_integer(slave_select));

m_err <= s_err(to_integer(slave_select)) when state = SendReq
    else '1' when state = SendErr
    else '0'; 

process (clk, reset_n)
variable legal_address : std_logic;
--variable slave_select : unsigned(2 downto 0);
begin
    if reset_n = '0' then
        state <= AddrCmp;
        slave_select <= "000";
    elsif rising_edge(clk) then
        case state is

            when AddrCmp =>
                if m_req = '1' then
                    for i in translation_table'range loop
                        if translation_table(i).enable = '1' then
                            -- verifier que l'addresse est dans la plage d'addresse de la ième table
                            if (unsigned(m_addr) >= translation_table(i).vaddr) and (unsigned(m_addr) < translation_table(i).vaddr + translation_table(i).size) then
                                addr_reg <= std_logic_vector(unsigned(m_addr) - translation_table(i).vaddr + translation_table(i).paddr);
                                slave_select <= translation_table(i).slave;
                                legal_address := '1';
                            end if;
                        end if;
                    end loop;
                    if legal_address = '0' then
                        state <= SendErr;
                        error_state <= ErrAddrState;
                        error_gnt <= '1';
                        error_rvalid <= '0';
                    else
                        state <= SendReq;
                    end if;
                end if;

            when SendReq => --on attend un rising edge sur rvalid et rready pour finir la transaction
                if s_rvalid(to_integer(slave_select)) = '1' and m_rready = '1' then
                    state <= AddrCmp;
                    legal_address := '0';
                end if;
            
            when SendErr => -- en cas d'erreur, on transmet pas la request, on simule s'implement une réponse avec err=1
                if error_state = ErrAddrState and m_req = '1' then
                    error_gnt <= '0';
                    error_rvalid <= '1';
                    error_state <= ErrRespState;
                elsif m_rready = '1' and error_state = ErrRespState then
                    state <= AddrCmp;
                    legal_address := '0';
                end if;
        end case;
    end if;
end process;

end architecture;
