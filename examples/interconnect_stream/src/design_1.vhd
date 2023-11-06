--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Oct 26 10:26:07 2023
--Host        : D-C620HZ2 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_F63VTB is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_F63VTB;

architecture STRUCTURE of m00_couplers_imp_F63VTB is
  signal m00_couplers_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_m00_couplers_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXIS_tdata(7 downto 0) <= m00_couplers_to_m00_couplers_TDATA(7 downto 0);
  M_AXIS_tdest(0) <= m00_couplers_to_m00_couplers_TDEST(0);
  M_AXIS_tvalid(0) <= m00_couplers_to_m00_couplers_TVALID(0);
  S_AXIS_tready(0) <= m00_couplers_to_m00_couplers_TREADY(0);
  m00_couplers_to_m00_couplers_TDATA(7 downto 0) <= S_AXIS_tdata(7 downto 0);
  m00_couplers_to_m00_couplers_TDEST(0) <= S_AXIS_tdest(0);
  m00_couplers_to_m00_couplers_TREADY(0) <= M_AXIS_tready(0);
  m00_couplers_to_m00_couplers_TVALID(0) <= S_AXIS_tvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1OHHHDA is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m01_couplers_imp_1OHHHDA;

architecture STRUCTURE of m01_couplers_imp_1OHHHDA is
  signal m01_couplers_to_m01_couplers_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXIS_tdata(7 downto 0) <= m01_couplers_to_m01_couplers_TDATA(7 downto 0);
  M_AXIS_tdest(0) <= m01_couplers_to_m01_couplers_TDEST(0);
  M_AXIS_tvalid(0) <= m01_couplers_to_m01_couplers_TVALID(0);
  S_AXIS_tready(0) <= m01_couplers_to_m01_couplers_TREADY(0);
  m01_couplers_to_m01_couplers_TDATA(7 downto 0) <= S_AXIS_tdata(7 downto 0);
  m01_couplers_to_m01_couplers_TDEST(0) <= S_AXIS_tdest(0);
  m01_couplers_to_m01_couplers_TREADY(0) <= M_AXIS_tready(0);
  m01_couplers_to_m01_couplers_TVALID(0) <= S_AXIS_tvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1LLE45P is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_1LLE45P;

architecture STRUCTURE of s00_couplers_imp_1LLE45P is
  signal s00_couplers_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXIS_tdata(7 downto 0) <= s00_couplers_to_s00_couplers_TDATA(7 downto 0);
  M_AXIS_tdest(0) <= s00_couplers_to_s00_couplers_TDEST(0);
  M_AXIS_tvalid(0) <= s00_couplers_to_s00_couplers_TVALID(0);
  S_AXIS_tready(0) <= s00_couplers_to_s00_couplers_TREADY(0);
  s00_couplers_to_s00_couplers_TDATA(7 downto 0) <= S_AXIS_tdata(7 downto 0);
  s00_couplers_to_s00_couplers_TDEST(0) <= S_AXIS_tdest(0);
  s00_couplers_to_s00_couplers_TREADY(0) <= M_AXIS_tready(0);
  s00_couplers_to_s00_couplers_TVALID(0) <= S_AXIS_tvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axis_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_AXIS_ACLK : in STD_LOGIC;
    M00_AXIS_ARESETN : in STD_LOGIC;
    M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXIS_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXIS_ACLK : in STD_LOGIC;
    M01_AXIS_ARESETN : in STD_LOGIC;
    M01_AXIS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXIS_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_ARESETN : in STD_LOGIC;
    S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXIS_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end design_1_axis_interconnect_0_0;

architecture STRUCTURE of design_1_axis_interconnect_0_0 is
  component design_1_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xbar_0;
  signal axis_interconnect_0_ACLK_net : STD_LOGIC;
  signal axis_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_to_s00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_to_s00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axis_interconnect_0_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axis_interconnect_0_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axis_interconnect_0_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axis_interconnect_0_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axis_interconnect_0_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_axis_interconnect_0_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axis_interconnect_0_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axis_interconnect_0_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_TDEST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_xbar_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M00_AXIS_tdata(7 downto 0) <= m00_couplers_to_axis_interconnect_0_TDATA(7 downto 0);
  M00_AXIS_tdest(0) <= m00_couplers_to_axis_interconnect_0_TDEST(0);
  M00_AXIS_tvalid(0) <= m00_couplers_to_axis_interconnect_0_TVALID(0);
  M01_AXIS_tdata(7 downto 0) <= m01_couplers_to_axis_interconnect_0_TDATA(7 downto 0);
  M01_AXIS_tdest(0) <= m01_couplers_to_axis_interconnect_0_TDEST(0);
  M01_AXIS_tvalid(0) <= m01_couplers_to_axis_interconnect_0_TVALID(0);
  S00_AXIS_tready(0) <= axis_interconnect_0_to_s00_couplers_TREADY(0);
  axis_interconnect_0_ACLK_net <= ACLK;
  axis_interconnect_0_ARESETN_net <= ARESETN;
  axis_interconnect_0_to_s00_couplers_TDATA(7 downto 0) <= S00_AXIS_tdata(7 downto 0);
  axis_interconnect_0_to_s00_couplers_TDEST(0) <= S00_AXIS_tdest(0);
  axis_interconnect_0_to_s00_couplers_TVALID(0) <= S00_AXIS_tvalid(0);
  m00_couplers_to_axis_interconnect_0_TREADY(0) <= M00_AXIS_tready(0);
  m01_couplers_to_axis_interconnect_0_TREADY(0) <= M01_AXIS_tready(0);
m00_couplers: entity work.m00_couplers_imp_F63VTB
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(7 downto 0) => m00_couplers_to_axis_interconnect_0_TDATA(7 downto 0),
      M_AXIS_tdest(0) => m00_couplers_to_axis_interconnect_0_TDEST(0),
      M_AXIS_tready(0) => m00_couplers_to_axis_interconnect_0_TREADY(0),
      M_AXIS_tvalid(0) => m00_couplers_to_axis_interconnect_0_TVALID(0),
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(7 downto 0) => xbar_to_m00_couplers_TDATA(7 downto 0),
      S_AXIS_tdest(0) => xbar_to_m00_couplers_TDEST(0),
      S_AXIS_tready(0) => xbar_to_m00_couplers_TREADY(0),
      S_AXIS_tvalid(0) => xbar_to_m00_couplers_TVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1OHHHDA
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(7 downto 0) => m01_couplers_to_axis_interconnect_0_TDATA(7 downto 0),
      M_AXIS_tdest(0) => m01_couplers_to_axis_interconnect_0_TDEST(0),
      M_AXIS_tready(0) => m01_couplers_to_axis_interconnect_0_TREADY(0),
      M_AXIS_tvalid(0) => m01_couplers_to_axis_interconnect_0_TVALID(0),
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(7 downto 0) => xbar_to_m01_couplers_TDATA(15 downto 8),
      S_AXIS_tdest(0) => xbar_to_m01_couplers_TDEST(1),
      S_AXIS_tready(0) => xbar_to_m01_couplers_TREADY(0),
      S_AXIS_tvalid(0) => xbar_to_m01_couplers_TVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_1LLE45P
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(7 downto 0) => s00_couplers_to_xbar_TDATA(7 downto 0),
      M_AXIS_tdest(0) => s00_couplers_to_xbar_TDEST(0),
      M_AXIS_tready(0) => s00_couplers_to_xbar_TREADY(0),
      M_AXIS_tvalid(0) => s00_couplers_to_xbar_TVALID(0),
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(7 downto 0) => axis_interconnect_0_to_s00_couplers_TDATA(7 downto 0),
      S_AXIS_tdest(0) => axis_interconnect_0_to_s00_couplers_TDEST(0),
      S_AXIS_tready(0) => axis_interconnect_0_to_s00_couplers_TREADY(0),
      S_AXIS_tvalid(0) => axis_interconnect_0_to_s00_couplers_TVALID(0)
    );
xbar: component design_1_xbar_0
     port map (
      aclk => axis_interconnect_0_ACLK_net,
      aresetn => axis_interconnect_0_ARESETN_net,
      m_axis_tdata(15 downto 8) => xbar_to_m01_couplers_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => xbar_to_m00_couplers_TDATA(7 downto 0),
      m_axis_tdest(1) => xbar_to_m01_couplers_TDEST(1),
      m_axis_tdest(0) => xbar_to_m00_couplers_TDEST(0),
      m_axis_tready(1) => xbar_to_m01_couplers_TREADY(0),
      m_axis_tready(0) => xbar_to_m00_couplers_TREADY(0),
      m_axis_tvalid(1) => xbar_to_m01_couplers_TVALID(1),
      m_axis_tvalid(0) => xbar_to_m00_couplers_TVALID(0),
      s_axis_tdata(7 downto 0) => s00_couplers_to_xbar_TDATA(7 downto 0),
      s_axis_tdest(0) => s00_couplers_to_xbar_TDEST(0),
      s_axis_tready(0) => s00_couplers_to_xbar_TREADY(0),
      s_axis_tvalid(0) => s00_couplers_to_xbar_TVALID(0),
      s_decode_err(0) => NLW_xbar_s_decode_err_UNCONNECTED(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    axis_in_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_in_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_in_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_in_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_out0_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out0_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out0_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out1_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_out1_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out1_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_out1_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=4,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_rst_ACLK_0_10M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_ACLK_0_10M_0;
  signal ACLK_0_1 : STD_LOGIC;
  signal S00_AXIS_0_1_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S00_AXIS_0_1_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXIS_0_1_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXIS_0_1_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_interconnect_0_M00_AXIS_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M00_AXIS_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_interconnect_0_M01_AXIS_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M01_AXIS_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_interconnect_0_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ext_reset_in_0_1 : STD_LOGIC;
  signal rst_ACLK_0_10M_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ACLK_0_10M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ACLK_0_10M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ACLK_0_10M_peripheral_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ACLK_0_10M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF axis_in:axis_out0:axis_out1, CLK_DOMAIN design_1_ACLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RST.ARESETN RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of axis_in_tdata : signal is "xilinx.com:interface:axis:1.0 axis_in TDATA";
  attribute X_INTERFACE_PARAMETER of axis_in_tdata : signal is "XIL_INTERFACENAME axis_in, CLK_DOMAIN design_1_ACLK_0, FREQ_HZ 10000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of axis_in_tdest : signal is "xilinx.com:interface:axis:1.0 axis_in TDEST";
  attribute X_INTERFACE_INFO of axis_in_tready : signal is "xilinx.com:interface:axis:1.0 axis_in TREADY";
  attribute X_INTERFACE_INFO of axis_in_tvalid : signal is "xilinx.com:interface:axis:1.0 axis_in TVALID";
  attribute X_INTERFACE_INFO of axis_out0_tdata : signal is "xilinx.com:interface:axis:1.0 axis_out0 TDATA";
  attribute X_INTERFACE_PARAMETER of axis_out0_tdata : signal is "XIL_INTERFACENAME axis_out0, CLK_DOMAIN design_1_ACLK_0, FREQ_HZ 10000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of axis_out0_tdest : signal is "xilinx.com:interface:axis:1.0 axis_out0 TDEST";
  attribute X_INTERFACE_INFO of axis_out0_tready : signal is "xilinx.com:interface:axis:1.0 axis_out0 TREADY";
  attribute X_INTERFACE_INFO of axis_out0_tvalid : signal is "xilinx.com:interface:axis:1.0 axis_out0 TVALID";
  attribute X_INTERFACE_INFO of axis_out1_tdata : signal is "xilinx.com:interface:axis:1.0 axis_out1 TDATA";
  attribute X_INTERFACE_PARAMETER of axis_out1_tdata : signal is "XIL_INTERFACENAME axis_out1, CLK_DOMAIN design_1_ACLK_0, FREQ_HZ 10000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 1, TDEST_WIDTH 1, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of axis_out1_tdest : signal is "xilinx.com:interface:axis:1.0 axis_out1 TDEST";
  attribute X_INTERFACE_INFO of axis_out1_tready : signal is "xilinx.com:interface:axis:1.0 axis_out1 TREADY";
  attribute X_INTERFACE_INFO of axis_out1_tvalid : signal is "xilinx.com:interface:axis:1.0 axis_out1 TVALID";
begin
  ACLK_0_1 <= aclk;
  S00_AXIS_0_1_TDATA(7 downto 0) <= axis_in_tdata(7 downto 0);
  S00_AXIS_0_1_TDEST(0) <= axis_in_tdest(0);
  S00_AXIS_0_1_TVALID(0) <= axis_in_tvalid(0);
  axis_in_tready(0) <= S00_AXIS_0_1_TREADY(0);
  axis_interconnect_0_M00_AXIS_TREADY(0) <= axis_out0_tready(0);
  axis_interconnect_0_M01_AXIS_TREADY(0) <= axis_out1_tready(0);
  axis_out0_tdata(7 downto 0) <= axis_interconnect_0_M00_AXIS_TDATA(7 downto 0);
  axis_out0_tdest(0) <= axis_interconnect_0_M00_AXIS_TDEST(0);
  axis_out0_tvalid(0) <= axis_interconnect_0_M00_AXIS_TVALID(0);
  axis_out1_tdata(7 downto 0) <= axis_interconnect_0_M01_AXIS_TDATA(7 downto 0);
  axis_out1_tdest(0) <= axis_interconnect_0_M01_AXIS_TDEST(0);
  axis_out1_tvalid(0) <= axis_interconnect_0_M01_AXIS_TVALID(0);
  ext_reset_in_0_1 <= aresetn;
axis_interconnect_0: entity work.design_1_axis_interconnect_0_0
     port map (
      ACLK => ACLK_0_1,
      ARESETN => rst_ACLK_0_10M_interconnect_aresetn(0),
      M00_AXIS_ACLK => ACLK_0_1,
      M00_AXIS_ARESETN => rst_ACLK_0_10M_interconnect_aresetn(0),
      M00_AXIS_tdata(7 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(7 downto 0),
      M00_AXIS_tdest(0) => axis_interconnect_0_M00_AXIS_TDEST(0),
      M00_AXIS_tready(0) => axis_interconnect_0_M00_AXIS_TREADY(0),
      M00_AXIS_tvalid(0) => axis_interconnect_0_M00_AXIS_TVALID(0),
      M01_AXIS_ACLK => ACLK_0_1,
      M01_AXIS_ARESETN => rst_ACLK_0_10M_interconnect_aresetn(0),
      M01_AXIS_tdata(7 downto 0) => axis_interconnect_0_M01_AXIS_TDATA(7 downto 0),
      M01_AXIS_tdest(0) => axis_interconnect_0_M01_AXIS_TDEST(0),
      M01_AXIS_tready(0) => axis_interconnect_0_M01_AXIS_TREADY(0),
      M01_AXIS_tvalid(0) => axis_interconnect_0_M01_AXIS_TVALID(0),
      S00_AXIS_ACLK => ACLK_0_1,
      S00_AXIS_ARESETN => rst_ACLK_0_10M_interconnect_aresetn(0),
      S00_AXIS_tdata(7 downto 0) => S00_AXIS_0_1_TDATA(7 downto 0),
      S00_AXIS_tdest(0) => S00_AXIS_0_1_TDEST(0),
      S00_AXIS_tready(0) => S00_AXIS_0_1_TREADY(0),
      S00_AXIS_tvalid(0) => S00_AXIS_0_1_TVALID(0)
    );
rst_ACLK_0_10M: component design_1_rst_ACLK_0_10M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ACLK_0_10M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => ext_reset_in_0_1,
      interconnect_aresetn(0) => rst_ACLK_0_10M_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ACLK_0_10M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => NLW_rst_ACLK_0_10M_peripheral_aresetn_UNCONNECTED(0),
      peripheral_reset(0) => NLW_rst_ACLK_0_10M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => ACLK_0_1
    );
end STRUCTURE;
