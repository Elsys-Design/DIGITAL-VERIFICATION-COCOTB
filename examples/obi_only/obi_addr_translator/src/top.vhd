library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

library obi_utils;
use obi_utils.obi_pkg.all;

library ic_lib;
use ic_lib.ic_pkg.all;

entity top is 
  generic (
    ADDR_WIDTH      : positive := 32;
    DATA_WIDTH      : positive := 32;
    SLAVE_COUNT     : positive := 2;
    TRANSLATION_TABLE_LENGTH : positive := 2
  );
  port (
    clk			: in  std_logic;
    reset_n 	: in  std_logic;
    
    -- OBI slave port (connect to master)
    m_req       : in  std_logic;
    m_gnt       : out std_logic;
    m_addr      : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    m_we        : in  std_logic;
    m_be        : in  std_logic_vector(DATA_WIDTH/8-1 downto 0);
    m_wdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    m_atop      : in  std_logic_vector(5 downto 0);

    m_rvalid    : out std_logic;
    m_rready    : in  std_logic;
    m_rdata     : out std_logic_vector(DATA_WIDTH-1 downto 0);
    m_err       : out std_logic;

    -- OBI master ports (connect to slaves)
    -- s_req      : out std_logic_vector(0 to SLAVE_COUNT-1);
    -- s_gnt      : in  std_logic_vector(0 to SLAVE_COUNT-1);
    -- s_addr     : out obi_array_t(0 to SLAVE_COUNT-1)(ADDR_WIDTH-1 downto 0);
    -- s_we       : out std_logic_vector(0 to SLAVE_COUNT-1);
    -- s_be       : out obi_array_t (0 to SLAVE_COUNT-1)(DATA_WIDTH/8-1 downto 0);
    -- s_wdata    : out obi_array_t(0 to SLAVE_COUNT-1)(DATA_WIDTH-1 downto 0);

    -- s_rvalid   : in  std_logic_vector(0 to SLAVE_COUNT-1);
    -- s_rready   : out std_logic_vector(0 to SLAVE_COUNT-1);
    -- s_rdata    : in  obi_array_t(0 to SLAVE_COUNT-1)(DATA_WIDTH-1 downto 0);
    -- s_err      : in  std_logic_vector(0 to SLAVE_COUNT-1)

    s0_req      : out std_logic;
    s0_gnt      : in  std_logic;
    s0_addr     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    s0_we       : out std_logic;
    s0_be       : out std_logic_vector(DATA_WIDTH/8-1 downto 0);
    s0_wdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
    s0_atop     : out  std_logic_vector(5 downto 0);

    s0_rvalid   : in  std_logic;
    s0_rready   : out std_logic;
    s0_rdata    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    s0_err      : in  std_logic;

    s1_req      : out std_logic;
    s1_gnt      : in  std_logic;
    s1_addr     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    s1_we       : out std_logic;
    s1_be       : out std_logic_vector(DATA_WIDTH/8-1 downto 0);
    s1_wdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
    s1_atop     : out  std_logic_vector(5 downto 0);

    s1_rvalid   : in  std_logic;
    s1_rready   : out std_logic;
    s1_rdata    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    s1_err      : in  std_logic
  );
end entity;     
    
   
architecture rtl of top is

  signal my_translation_table : translation_table_t(0 to TRANSLATION_TABLE_LENGTH-1);
  
begin

my_translation_table(0).enable  <= '1';
my_translation_table(0).vaddr   <= X"00000000";
my_translation_table(0).paddr   <= X"00000000";
my_translation_table(0).size    <= X"00001000";
my_translation_table(0).slave   <= "000";

my_translation_table(1).enable  <= '1';
my_translation_table(1).vaddr   <= X"00001000";
my_translation_table(1).paddr   <= X"00000000";
my_translation_table(1).size    <= X"00001000";
my_translation_table(1).slave   <= "001";

addr_translator: entity obi_utils.obi_addr_translator
    generic map (
        SLAVE_COUNT => SLAVE_COUNT,
        TRANSLATION_TABLE_LENGTH => TRANSLATION_TABLE_LENGTH
    )
    port map(
        clk     => clk,
        reset_n => reset_n,
        
        m_req   => m_req,
        m_gnt   => m_gnt,
        m_addr  => m_addr,
        m_we    => m_we,
        m_be    => m_be,
        m_wdata => m_wdata,
				m_atop  => m_atop,
        m_rvalid=> m_rvalid,
        m_rready=> m_rready,
        m_rdata => m_rdata,
        m_err   => m_err,
        
        s_req(0)    => s0_req,
        s_req(1)    => s1_req,

        s_gnt(0)    => s0_gnt,
        s_gnt(1)    => s1_gnt,

        s_addr(0)   => s0_addr,
        s_addr(1)   => s1_addr,

        s_we(0)     => s0_we,
        s_we(1)     => s1_we,

        s_be(0)     => s0_be,
        s_be(1)     => s1_be,

        s_wdata(0)  => s0_wdata,
        s_wdata(1)  => s1_wdata,

				s_atop(0)   => s0_atop,
				s_atop(1)   => s1_atop,

        s_rvalid(0) => s0_rvalid,
        s_rvalid(1) => s1_rvalid,

        s_rready(0) => s0_rready,
        s_rready(1) => s1_rready,

        s_rdata(0)  => s0_rdata,
        s_rdata(1)  => s1_rdata,

        s_err(0)    => s0_err,
        s_err(1)    => s1_err,


        translation_table => my_translation_table
    );

end rtl;
