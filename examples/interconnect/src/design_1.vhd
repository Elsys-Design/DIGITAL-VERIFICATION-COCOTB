--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Mon Nov  6 14:36:07 2023
--Host        : D-C620HZ2 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_P3KODA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_P3KODA;

architecture STRUCTURE of m00_couplers_imp_P3KODA is
  component design_1_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(3 downto 0) <= m00_couplers_to_auto_pc_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m00_couplers_to_auto_pc_RID(3 downto 0);
  S_AXI_rlast <= m00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_pc_WREADY;
  auto_pc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_auto_pc_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_auto_pc_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_m00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_m00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => m00_couplers_to_auto_pc_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => m00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m00_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => m00_couplers_to_auto_pc_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => m00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m00_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(3 downto 0) => m00_couplers_to_auto_pc_BID(3 downto 0),
      s_axi_bready => m00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(3 downto 0) => m00_couplers_to_auto_pc_RID(3 downto 0),
      s_axi_rlast => m00_couplers_to_auto_pc_RLAST,
      s_axi_rready => m00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m00_couplers_to_auto_pc_WLAST,
      s_axi_wready => m00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1E9HINZ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1E9HINZ;

architecture STRUCTURE of m01_couplers_imp_1E9HINZ is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_RLAST : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WLAST : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= m01_couplers_to_m01_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m01_couplers_to_m01_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(3 downto 0) <= m01_couplers_to_m01_couplers_ARID(3 downto 0);
  M_AXI_arlen(7 downto 0) <= m01_couplers_to_m01_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= m01_couplers_to_m01_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= m01_couplers_to_m01_couplers_ARQOS(3 downto 0);
  M_AXI_arregion(3 downto 0) <= m01_couplers_to_m01_couplers_ARREGION(3 downto 0);
  M_AXI_arsize(2 downto 0) <= m01_couplers_to_m01_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= m01_couplers_to_m01_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m01_couplers_to_m01_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(3 downto 0) <= m01_couplers_to_m01_couplers_AWID(3 downto 0);
  M_AXI_awlen(7 downto 0) <= m01_couplers_to_m01_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= m01_couplers_to_m01_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= m01_couplers_to_m01_couplers_AWQOS(3 downto 0);
  M_AXI_awregion(3 downto 0) <= m01_couplers_to_m01_couplers_AWREGION(3 downto 0);
  M_AXI_awsize(2 downto 0) <= m01_couplers_to_m01_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= m01_couplers_to_m01_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bid(3 downto 0) <= m01_couplers_to_m01_couplers_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m01_couplers_to_m01_couplers_RID(3 downto 0);
  S_AXI_rlast <= m01_couplers_to_m01_couplers_RLAST;
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m01_couplers_to_m01_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m01_couplers_to_m01_couplers_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m01_couplers_to_m01_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m01_couplers_to_m01_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m01_couplers_to_m01_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m01_couplers_to_m01_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m01_couplers_to_m01_couplers_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m01_couplers_to_m01_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m01_couplers_to_m01_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m01_couplers_to_m01_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BID(3 downto 0) <= M_AXI_bid(3 downto 0);
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RID(3 downto 0) <= M_AXI_rid(3 downto 0);
  m01_couplers_to_m01_couplers_RLAST <= M_AXI_rlast;
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WLAST <= S_AXI_wlast;
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_QJ8X5P is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_QJ8X5P;

architecture STRUCTURE of m02_couplers_imp_QJ8X5P is
  component design_1_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m02_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m02_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_WVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m02_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m02_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m02_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m02_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m02_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= auto_pc_to_m02_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m02_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m02_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(3 downto 0) <= m02_couplers_to_auto_pc_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m02_couplers_to_auto_pc_RID(3 downto 0);
  S_AXI_rlast <= m02_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m02_couplers_to_auto_pc_WREADY;
  auto_pc_to_m02_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m02_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m02_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m02_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m02_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m02_couplers_to_auto_pc_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m02_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m02_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m02_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m02_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m02_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m02_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m02_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m02_couplers_to_auto_pc_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m02_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m02_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m02_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m02_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m02_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m02_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m02_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m02_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m02_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m02_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m02_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m02_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m02_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m02_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m02_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m02_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m02_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m02_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m02_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m02_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m02_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => NLW_auto_pc_m_axi_wstrb_UNCONNECTED(3 downto 0),
      m_axi_wvalid => auto_pc_to_m02_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m02_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m02_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m02_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => m02_couplers_to_auto_pc_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => m02_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m02_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m02_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m02_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m02_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m02_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m02_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m02_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m02_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m02_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m02_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => m02_couplers_to_auto_pc_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => m02_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m02_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m02_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m02_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m02_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m02_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m02_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m02_couplers_to_auto_pc_AWVALID,
      s_axi_bid(3 downto 0) => m02_couplers_to_auto_pc_BID(3 downto 0),
      s_axi_bready => m02_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m02_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m02_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m02_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(3 downto 0) => m02_couplers_to_auto_pc_RID(3 downto 0),
      s_axi_rlast => m02_couplers_to_auto_pc_RLAST,
      s_axi_rready => m02_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m02_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m02_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m02_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m02_couplers_to_auto_pc_WLAST,
      s_axi_wready => m02_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m02_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m02_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1D3I8FW is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1D3I8FW;

architecture STRUCTURE of m03_couplers_imp_1D3I8FW is
  component design_1_auto_pc_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_2;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m03_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m03_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m03_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m03_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m03_couplers_WVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m03_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m03_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m03_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m03_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m03_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m03_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m03_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m03_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m03_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m03_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(3 downto 0) <= m03_couplers_to_auto_pc_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m03_couplers_to_auto_pc_RID(3 downto 0);
  S_AXI_rlast <= m03_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m03_couplers_to_auto_pc_WREADY;
  auto_pc_to_m03_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m03_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m03_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m03_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m03_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m03_couplers_to_auto_pc_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m03_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m03_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m03_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m03_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m03_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m03_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m03_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m03_couplers_to_auto_pc_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m03_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m03_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m03_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m03_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m03_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m03_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m03_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m03_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m03_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_2
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m03_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m03_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_m03_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m03_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m03_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m03_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_m03_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m03_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m03_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m03_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m03_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m03_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m03_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m03_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m03_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m03_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m03_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m03_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m03_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => m03_couplers_to_auto_pc_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => m03_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m03_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m03_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m03_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m03_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m03_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m03_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m03_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m03_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m03_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m03_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => m03_couplers_to_auto_pc_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => m03_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m03_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m03_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m03_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m03_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m03_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m03_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m03_couplers_to_auto_pc_AWVALID,
      s_axi_bid(3 downto 0) => m03_couplers_to_auto_pc_BID(3 downto 0),
      s_axi_bready => m03_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m03_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m03_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m03_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(3 downto 0) => m03_couplers_to_auto_pc_RID(3 downto 0),
      s_axi_rlast => m03_couplers_to_auto_pc_RLAST,
      s_axi_rready => m03_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m03_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m03_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m03_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m03_couplers_to_auto_pc_WLAST,
      s_axi_wready => m03_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m03_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m03_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_MPPXSO is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_MPPXSO;

architecture STRUCTURE of m04_couplers_imp_MPPXSO is
  component design_1_auto_pc_3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_3;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m04_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m04_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m04_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m04_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m04_couplers_WVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m04_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m04_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m04_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m04_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m04_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m04_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m04_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m04_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m04_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m04_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(3 downto 0) <= m04_couplers_to_auto_pc_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m04_couplers_to_auto_pc_RID(3 downto 0);
  S_AXI_rlast <= m04_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m04_couplers_to_auto_pc_WREADY;
  auto_pc_to_m04_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m04_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m04_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m04_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m04_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m04_couplers_to_auto_pc_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m04_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m04_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m04_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m04_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m04_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m04_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m04_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m04_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m04_couplers_to_auto_pc_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m04_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m04_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m04_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m04_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m04_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m04_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m04_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m04_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m04_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m04_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_3
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m04_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m04_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_m04_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m04_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m04_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m04_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_m04_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m04_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m04_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m04_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m04_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m04_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m04_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m04_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m04_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m04_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m04_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m04_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m04_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => m04_couplers_to_auto_pc_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => m04_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m04_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m04_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m04_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m04_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m04_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m04_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m04_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m04_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m04_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m04_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => m04_couplers_to_auto_pc_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => m04_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m04_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m04_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m04_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m04_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m04_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m04_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m04_couplers_to_auto_pc_AWVALID,
      s_axi_bid(3 downto 0) => m04_couplers_to_auto_pc_BID(3 downto 0),
      s_axi_bready => m04_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m04_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m04_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m04_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(3 downto 0) => m04_couplers_to_auto_pc_RID(3 downto 0),
      s_axi_rlast => m04_couplers_to_auto_pc_RLAST,
      s_axi_rready => m04_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m04_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m04_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m04_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m04_couplers_to_auto_pc_WLAST,
      s_axi_wready => m04_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m04_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m04_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1GVH48P is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m05_couplers_imp_1GVH48P;

architecture STRUCTURE of m05_couplers_imp_1GVH48P is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_m05_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_m05_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= m05_couplers_to_m05_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m05_couplers_to_m05_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(3 downto 0) <= m05_couplers_to_m05_couplers_ARID(3 downto 0);
  M_AXI_arlen(7 downto 0) <= m05_couplers_to_m05_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= m05_couplers_to_m05_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= m05_couplers_to_m05_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= m05_couplers_to_m05_couplers_ARQOS(3 downto 0);
  M_AXI_arregion(3 downto 0) <= m05_couplers_to_m05_couplers_ARREGION(3 downto 0);
  M_AXI_arsize(2 downto 0) <= m05_couplers_to_m05_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid(0) <= m05_couplers_to_m05_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= m05_couplers_to_m05_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m05_couplers_to_m05_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(3 downto 0) <= m05_couplers_to_m05_couplers_AWID(3 downto 0);
  M_AXI_awlen(7 downto 0) <= m05_couplers_to_m05_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= m05_couplers_to_m05_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= m05_couplers_to_m05_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= m05_couplers_to_m05_couplers_AWQOS(3 downto 0);
  M_AXI_awregion(3 downto 0) <= m05_couplers_to_m05_couplers_AWREGION(3 downto 0);
  M_AXI_awsize(2 downto 0) <= m05_couplers_to_m05_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid(0) <= m05_couplers_to_m05_couplers_AWVALID(0);
  M_AXI_bready(0) <= m05_couplers_to_m05_couplers_BREADY(0);
  M_AXI_rready(0) <= m05_couplers_to_m05_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wlast(0) <= m05_couplers_to_m05_couplers_WLAST(0);
  M_AXI_wstrb(3 downto 0) <= m05_couplers_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m05_couplers_to_m05_couplers_WVALID(0);
  S_AXI_arready(0) <= m05_couplers_to_m05_couplers_ARREADY(0);
  S_AXI_awready(0) <= m05_couplers_to_m05_couplers_AWREADY(0);
  S_AXI_bid(3 downto 0) <= m05_couplers_to_m05_couplers_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m05_couplers_to_m05_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= m05_couplers_to_m05_couplers_RID(3 downto 0);
  S_AXI_rlast(0) <= m05_couplers_to_m05_couplers_RLAST(0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m05_couplers_to_m05_couplers_RVALID(0);
  S_AXI_wready(0) <= m05_couplers_to_m05_couplers_WREADY(0);
  m05_couplers_to_m05_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_m05_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m05_couplers_to_m05_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m05_couplers_to_m05_couplers_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  m05_couplers_to_m05_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m05_couplers_to_m05_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  m05_couplers_to_m05_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m05_couplers_to_m05_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m05_couplers_to_m05_couplers_ARREADY(0) <= M_AXI_arready(0);
  m05_couplers_to_m05_couplers_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m05_couplers_to_m05_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m05_couplers_to_m05_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m05_couplers_to_m05_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_m05_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m05_couplers_to_m05_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m05_couplers_to_m05_couplers_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  m05_couplers_to_m05_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m05_couplers_to_m05_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  m05_couplers_to_m05_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m05_couplers_to_m05_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m05_couplers_to_m05_couplers_AWREADY(0) <= M_AXI_awready(0);
  m05_couplers_to_m05_couplers_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m05_couplers_to_m05_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m05_couplers_to_m05_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m05_couplers_to_m05_couplers_BID(3 downto 0) <= M_AXI_bid(3 downto 0);
  m05_couplers_to_m05_couplers_BREADY(0) <= S_AXI_bready(0);
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RID(3 downto 0) <= M_AXI_rid(3 downto 0);
  m05_couplers_to_m05_couplers_RLAST(0) <= M_AXI_rlast(0);
  m05_couplers_to_m05_couplers_RREADY(0) <= S_AXI_rready(0);
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WLAST(0) <= S_AXI_wlast(0);
  m05_couplers_to_m05_couplers_WREADY(0) <= M_AXI_wready(0);
  m05_couplers_to_m05_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_m05_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_19B3V30 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_19B3V30;

architecture STRUCTURE of s00_couplers_imp_19B3V30 is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= s00_couplers_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= s00_couplers_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(3 downto 0) <= s00_couplers_to_s00_couplers_ARID(3 downto 0);
  M_AXI_arlen(7 downto 0) <= s00_couplers_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= s00_couplers_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= s00_couplers_to_s00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= s00_couplers_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= s00_couplers_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= s00_couplers_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(3 downto 0) <= s00_couplers_to_s00_couplers_AWID(3 downto 0);
  M_AXI_awlen(7 downto 0) <= s00_couplers_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= s00_couplers_to_s00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= s00_couplers_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= s00_couplers_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s00_couplers_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wlast(0) <= s00_couplers_to_s00_couplers_WLAST(0);
  M_AXI_wstrb(3 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bid(3 downto 0) <= s00_couplers_to_s00_couplers_BID(3 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_couplers_RDATA(31 downto 0);
  S_AXI_rid(3 downto 0) <= s00_couplers_to_s00_couplers_RID(3 downto 0);
  S_AXI_rlast(0) <= s00_couplers_to_s00_couplers_RLAST(0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_s00_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_s00_couplers_ARID(3 downto 0) <= S_AXI_arid(3 downto 0);
  s00_couplers_to_s00_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_s00_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_s00_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_s00_couplers_AWID(3 downto 0) <= S_AXI_awid(3 downto 0);
  s00_couplers_to_s00_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_s00_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BID(3 downto 0) <= M_AXI_bid(3 downto 0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_couplers_to_s00_couplers_RID(3 downto 0) <= M_AXI_rid(3 downto 0);
  s00_couplers_to_s00_couplers_RLAST(0) <= M_AXI_rlast(0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_s00_couplers_WLAST(0) <= S_AXI_wlast(0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_L45D6L is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s01_couplers_imp_L45D6L;

architecture STRUCTURE of s01_couplers_imp_L45D6L is
  component design_1_auto_pc_4 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_4;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s01_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s01_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_s01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s01_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s01_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s01_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_s01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s01_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s01_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s01_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s01_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s01_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s01_couplers_RLAST : STD_LOGIC;
  signal auto_pc_to_s01_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s01_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s01_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_s01_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s01_couplers_WVALID : STD_LOGIC;
  signal s01_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s01_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s01_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s01_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s01_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s01_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s01_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s01_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s01_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s01_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_auto_pc_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s01_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_pc_to_s01_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_pc_to_s01_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_pc_to_s01_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_pc_to_s01_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s01_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_pc_to_s01_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_pc_to_s01_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s01_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_s01_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_s01_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_pc_to_s01_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_pc_to_s01_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s01_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_s01_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_s01_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s01_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s01_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s01_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= auto_pc_to_s01_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s01_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s01_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= s01_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s01_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s01_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s01_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s01_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s01_couplers_to_auto_pc_WREADY;
  auto_pc_to_s01_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s01_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s01_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s01_couplers_RLAST <= M_AXI_rlast;
  auto_pc_to_s01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s01_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s01_couplers_WREADY <= M_AXI_wready;
  s01_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s01_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s01_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s01_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s01_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s01_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s01_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s01_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s01_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s01_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s01_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_4
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s01_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_pc_to_s01_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_pc_to_s01_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_pc_to_s01_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_pc_to_s01_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s01_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_pc_to_s01_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_pc_to_s01_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_pc_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_pc_to_s01_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_pc_to_s01_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s01_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_s01_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_s01_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_pc_to_s01_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_pc_to_s01_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s01_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_s01_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_s01_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_pc_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_pc_to_s01_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_s01_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s01_couplers_RDATA(31 downto 0),
      m_axi_rlast => auto_pc_to_s01_couplers_RLAST,
      m_axi_rready => auto_pc_to_s01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s01_couplers_WDATA(31 downto 0),
      m_axi_wlast => auto_pc_to_s01_couplers_WLAST,
      m_axi_wready => auto_pc_to_s01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s01_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s01_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s01_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s01_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arready => s01_couplers_to_auto_pc_ARREADY,
      s_axi_arvalid => s01_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s01_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s01_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awready => s01_couplers_to_auto_pc_AWREADY,
      s_axi_awvalid => s01_couplers_to_auto_pc_AWVALID,
      s_axi_bready => s01_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s01_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s01_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s01_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rready => s01_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s01_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s01_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s01_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wready => s01_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s01_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s01_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s02_couplers_imp_1A8C1WF is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC
  );
end s02_couplers_imp_1A8C1WF;

architecture STRUCTURE of s02_couplers_imp_1A8C1WF is
  signal s02_couplers_to_s02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_s02_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_s02_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_s02_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_s02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_s02_couplers_ARREADY : STD_LOGIC;
  signal s02_couplers_to_s02_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_s02_couplers_ARVALID : STD_LOGIC;
  signal s02_couplers_to_s02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_s02_couplers_RLAST : STD_LOGIC;
  signal s02_couplers_to_s02_couplers_RREADY : STD_LOGIC;
  signal s02_couplers_to_s02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_s02_couplers_RVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= s02_couplers_to_s02_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= s02_couplers_to_s02_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= s02_couplers_to_s02_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= s02_couplers_to_s02_couplers_ARLEN(7 downto 0);
  M_AXI_arprot(2 downto 0) <= s02_couplers_to_s02_couplers_ARPROT(2 downto 0);
  M_AXI_arsize(2 downto 0) <= s02_couplers_to_s02_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= s02_couplers_to_s02_couplers_ARVALID;
  M_AXI_rready <= s02_couplers_to_s02_couplers_RREADY;
  S_AXI_arready <= s02_couplers_to_s02_couplers_ARREADY;
  S_AXI_rdata(31 downto 0) <= s02_couplers_to_s02_couplers_RDATA(31 downto 0);
  S_AXI_rlast <= s02_couplers_to_s02_couplers_RLAST;
  S_AXI_rresp(1 downto 0) <= s02_couplers_to_s02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= s02_couplers_to_s02_couplers_RVALID;
  s02_couplers_to_s02_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s02_couplers_to_s02_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s02_couplers_to_s02_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s02_couplers_to_s02_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s02_couplers_to_s02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s02_couplers_to_s02_couplers_ARREADY <= M_AXI_arready;
  s02_couplers_to_s02_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s02_couplers_to_s02_couplers_ARVALID <= S_AXI_arvalid;
  s02_couplers_to_s02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s02_couplers_to_s02_couplers_RLAST <= M_AXI_rlast;
  s02_couplers_to_s02_couplers_RREADY <= S_AXI_rready;
  s02_couplers_to_s02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s02_couplers_to_s02_couplers_RVALID <= M_AXI_rvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s03_couplers_imp_KH77GE is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s03_couplers_imp_KH77GE;

architecture STRUCTURE of s03_couplers_imp_KH77GE is
  signal s03_couplers_to_s03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_s03_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_s03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_s03_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s03_couplers_to_s03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_s03_couplers_AWREADY : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_s03_couplers_AWVALID : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_BREADY : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_s03_couplers_BVALID : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_s03_couplers_WLAST : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_WREADY : STD_LOGIC;
  signal s03_couplers_to_s03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_s03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_awaddr(31 downto 0) <= s03_couplers_to_s03_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= s03_couplers_to_s03_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= s03_couplers_to_s03_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= s03_couplers_to_s03_couplers_AWLEN(7 downto 0);
  M_AXI_awprot(2 downto 0) <= s03_couplers_to_s03_couplers_AWPROT(2 downto 0);
  M_AXI_awsize(2 downto 0) <= s03_couplers_to_s03_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= s03_couplers_to_s03_couplers_AWVALID;
  M_AXI_bready <= s03_couplers_to_s03_couplers_BREADY;
  M_AXI_wdata(31 downto 0) <= s03_couplers_to_s03_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= s03_couplers_to_s03_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= s03_couplers_to_s03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= s03_couplers_to_s03_couplers_WVALID;
  S_AXI_awready <= s03_couplers_to_s03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= s03_couplers_to_s03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= s03_couplers_to_s03_couplers_BVALID;
  S_AXI_wready <= s03_couplers_to_s03_couplers_WREADY;
  s03_couplers_to_s03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s03_couplers_to_s03_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s03_couplers_to_s03_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s03_couplers_to_s03_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s03_couplers_to_s03_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s03_couplers_to_s03_couplers_AWREADY <= M_AXI_awready;
  s03_couplers_to_s03_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s03_couplers_to_s03_couplers_AWVALID <= S_AXI_awvalid;
  s03_couplers_to_s03_couplers_BREADY <= S_AXI_bready;
  s03_couplers_to_s03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s03_couplers_to_s03_couplers_BVALID <= M_AXI_bvalid;
  s03_couplers_to_s03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s03_couplers_to_s03_couplers_WLAST <= S_AXI_wlast;
  s03_couplers_to_s03_couplers_WREADY <= M_AXI_wready;
  s03_couplers_to_s03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s03_couplers_to_s03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_rlast : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wlast : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M05_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M05_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_ACLK : in STD_LOGIC;
    S01_ARESETN : in STD_LOGIC;
    S01_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arready : out STD_LOGIC;
    S01_AXI_arvalid : in STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_rready : in STD_LOGIC;
    S01_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_rvalid : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_wvalid : in STD_LOGIC;
    S02_ACLK : in STD_LOGIC;
    S02_ARESETN : in STD_LOGIC;
    S02_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arready : out STD_LOGIC;
    S02_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arvalid : in STD_LOGIC;
    S02_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_rlast : out STD_LOGIC;
    S02_AXI_rready : in STD_LOGIC;
    S02_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_rvalid : out STD_LOGIC;
    S03_ACLK : in STD_LOGIC;
    S03_ARESETN : in STD_LOGIC;
    S03_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S03_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awready : out STD_LOGIC;
    S03_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awvalid : in STD_LOGIC;
    S03_AXI_bready : in STD_LOGIC;
    S03_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_bvalid : out STD_LOGIC;
    S03_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_wlast : in STD_LOGIC;
    S03_AXI_wready : out STD_LOGIC;
    S03_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_wvalid : in STD_LOGIC
  );
end design_1_axi_interconnect_0_0;

architecture STRUCTURE of design_1_axi_interconnect_0_0 is
  component design_1_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component design_1_xbar_0;
  signal axi_interconnect_ACLK_net : STD_LOGIC;
  signal axi_interconnect_ARESETN_net : STD_LOGIC;
  signal axi_interconnect_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s01_couplers_ARREADY : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_ARVALID : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s01_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s01_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s01_couplers_RREADY : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s01_couplers_RVALID : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s01_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s01_couplers_WVALID : STD_LOGIC;
  signal axi_interconnect_to_s02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARREADY : STD_LOGIC;
  signal axi_interconnect_to_s02_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s02_couplers_ARVALID : STD_LOGIC;
  signal axi_interconnect_to_s02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s02_couplers_RLAST : STD_LOGIC;
  signal axi_interconnect_to_s02_couplers_RREADY : STD_LOGIC;
  signal axi_interconnect_to_s02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s02_couplers_RVALID : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_to_s03_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_to_s03_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_to_s03_couplers_WLAST : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_to_s03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_to_s03_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_ARREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_ARVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_AWREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_AWVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_BREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_BVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_RREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_RVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_WREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_WVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axi_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_ARVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axi_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_AWVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_BREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_BVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_RLAST : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_RREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_RVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_WLAST : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_WREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_WVALID : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_axi_interconnect_ARREADY : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_ARVALID : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_axi_interconnect_AWREADY : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_AWVALID : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_BREADY : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_axi_interconnect_BVALID : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_axi_interconnect_RREADY : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_axi_interconnect_RVALID : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_axi_interconnect_WREADY : STD_LOGIC;
  signal m02_couplers_to_axi_interconnect_WVALID : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_axi_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_axi_interconnect_ARREADY : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_ARVALID : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_axi_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_axi_interconnect_AWREADY : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_AWVALID : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_BREADY : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_axi_interconnect_BVALID : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_axi_interconnect_RREADY : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_axi_interconnect_RVALID : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_axi_interconnect_WREADY : STD_LOGIC;
  signal m03_couplers_to_axi_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_axi_interconnect_WVALID : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_axi_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_axi_interconnect_ARREADY : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_ARVALID : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_axi_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_axi_interconnect_AWREADY : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_AWVALID : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_BREADY : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_axi_interconnect_BVALID : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_axi_interconnect_RREADY : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_axi_interconnect_RVALID : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_axi_interconnect_WREADY : STD_LOGIC;
  signal m04_couplers_to_axi_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_axi_interconnect_WVALID : STD_LOGIC;
  signal m05_couplers_to_axi_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_axi_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_axi_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_axi_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_axi_interconnect_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_axi_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_axi_interconnect_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_axi_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_axi_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s01_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal s01_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s01_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s01_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s02_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s02_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal s02_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s02_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal s02_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s03_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s03_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s03_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s03_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s03_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s03_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal s03_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s03_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s03_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal s03_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s03_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARID : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWID : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m01_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARBURST : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal xbar_to_m02_couplers_ARCACHE : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARLEN : STD_LOGIC_VECTOR ( 23 downto 16 );
  signal xbar_to_m02_couplers_ARLOCK : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARQOS : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARREGION : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARSIZE : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWBURST : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal xbar_to_m02_couplers_AWCACHE : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWLEN : STD_LOGIC_VECTOR ( 23 downto 16 );
  signal xbar_to_m02_couplers_AWLOCK : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWQOS : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWREGION : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWSIZE : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m02_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARBURST : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal xbar_to_m03_couplers_ARCACHE : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARLEN : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal xbar_to_m03_couplers_ARLOCK : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARQOS : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARREGION : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARSIZE : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWBURST : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal xbar_to_m03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWLEN : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal xbar_to_m03_couplers_AWLOCK : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWQOS : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWREGION : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m03_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WLAST : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARBURST : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal xbar_to_m04_couplers_ARCACHE : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARID : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARLEN : STD_LOGIC_VECTOR ( 39 downto 32 );
  signal xbar_to_m04_couplers_ARLOCK : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARQOS : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARREGION : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARSIZE : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWBURST : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal xbar_to_m04_couplers_AWCACHE : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWID : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWLEN : STD_LOGIC_VECTOR ( 39 downto 32 );
  signal xbar_to_m04_couplers_AWLOCK : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWQOS : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWREGION : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWSIZE : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m04_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WLAST : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARBURST : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal xbar_to_m05_couplers_ARCACHE : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARID : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARLEN : STD_LOGIC_VECTOR ( 47 downto 40 );
  signal xbar_to_m05_couplers_ARLOCK : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARQOS : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_ARREGION : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARSIZE : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWBURST : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal xbar_to_m05_couplers_AWCACHE : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWID : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWLEN : STD_LOGIC_VECTOR ( 47 downto 40 );
  signal xbar_to_m05_couplers_AWLOCK : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWQOS : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_AWREGION : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWSIZE : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m05_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WLAST : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal NLW_xbar_s_axi_arready_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_xbar_s_axi_awready_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_xbar_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal NLW_xbar_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal NLW_xbar_s_axi_bvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_xbar_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal NLW_xbar_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal NLW_xbar_s_axi_rlast_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_xbar_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal NLW_xbar_s_axi_rvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_xbar_s_axi_wready_UNCONNECTED : STD_LOGIC_VECTOR ( 2 to 2 );
begin
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_axi_interconnect_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_axi_interconnect_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_axi_interconnect_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_axi_interconnect_AWVALID;
  M00_AXI_bready <= m00_couplers_to_axi_interconnect_BREADY;
  M00_AXI_rready <= m00_couplers_to_axi_interconnect_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_axi_interconnect_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_axi_interconnect_WVALID;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M01_AXI_arburst(1 downto 0) <= m01_couplers_to_axi_interconnect_ARBURST(1 downto 0);
  M01_AXI_arcache(3 downto 0) <= m01_couplers_to_axi_interconnect_ARCACHE(3 downto 0);
  M01_AXI_arid(3 downto 0) <= m01_couplers_to_axi_interconnect_ARID(3 downto 0);
  M01_AXI_arlen(7 downto 0) <= m01_couplers_to_axi_interconnect_ARLEN(7 downto 0);
  M01_AXI_arlock(0) <= m01_couplers_to_axi_interconnect_ARLOCK(0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_axi_interconnect_ARPROT(2 downto 0);
  M01_AXI_arqos(3 downto 0) <= m01_couplers_to_axi_interconnect_ARQOS(3 downto 0);
  M01_AXI_arregion(3 downto 0) <= m01_couplers_to_axi_interconnect_ARREGION(3 downto 0);
  M01_AXI_arsize(2 downto 0) <= m01_couplers_to_axi_interconnect_ARSIZE(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_axi_interconnect_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M01_AXI_awburst(1 downto 0) <= m01_couplers_to_axi_interconnect_AWBURST(1 downto 0);
  M01_AXI_awcache(3 downto 0) <= m01_couplers_to_axi_interconnect_AWCACHE(3 downto 0);
  M01_AXI_awid(3 downto 0) <= m01_couplers_to_axi_interconnect_AWID(3 downto 0);
  M01_AXI_awlen(7 downto 0) <= m01_couplers_to_axi_interconnect_AWLEN(7 downto 0);
  M01_AXI_awlock(0) <= m01_couplers_to_axi_interconnect_AWLOCK(0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_axi_interconnect_AWPROT(2 downto 0);
  M01_AXI_awqos(3 downto 0) <= m01_couplers_to_axi_interconnect_AWQOS(3 downto 0);
  M01_AXI_awregion(3 downto 0) <= m01_couplers_to_axi_interconnect_AWREGION(3 downto 0);
  M01_AXI_awsize(2 downto 0) <= m01_couplers_to_axi_interconnect_AWSIZE(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_axi_interconnect_AWVALID;
  M01_AXI_bready <= m01_couplers_to_axi_interconnect_BREADY;
  M01_AXI_rready <= m01_couplers_to_axi_interconnect_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M01_AXI_wlast <= m01_couplers_to_axi_interconnect_WLAST;
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_axi_interconnect_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_axi_interconnect_WVALID;
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_axi_interconnect_ARVALID;
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_axi_interconnect_AWVALID;
  M02_AXI_bready <= m02_couplers_to_axi_interconnect_BREADY;
  M02_AXI_rready <= m02_couplers_to_axi_interconnect_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_axi_interconnect_WVALID;
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M03_AXI_arprot(2 downto 0) <= m03_couplers_to_axi_interconnect_ARPROT(2 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_axi_interconnect_ARVALID;
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M03_AXI_awprot(2 downto 0) <= m03_couplers_to_axi_interconnect_AWPROT(2 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_axi_interconnect_AWVALID;
  M03_AXI_bready <= m03_couplers_to_axi_interconnect_BREADY;
  M03_AXI_rready <= m03_couplers_to_axi_interconnect_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_axi_interconnect_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_axi_interconnect_WVALID;
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M04_AXI_arprot(2 downto 0) <= m04_couplers_to_axi_interconnect_ARPROT(2 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_axi_interconnect_ARVALID;
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M04_AXI_awprot(2 downto 0) <= m04_couplers_to_axi_interconnect_AWPROT(2 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_axi_interconnect_AWVALID;
  M04_AXI_bready <= m04_couplers_to_axi_interconnect_BREADY;
  M04_AXI_rready <= m04_couplers_to_axi_interconnect_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_axi_interconnect_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_axi_interconnect_WVALID;
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_axi_interconnect_ARADDR(31 downto 0);
  M05_AXI_arburst(1 downto 0) <= m05_couplers_to_axi_interconnect_ARBURST(1 downto 0);
  M05_AXI_arcache(3 downto 0) <= m05_couplers_to_axi_interconnect_ARCACHE(3 downto 0);
  M05_AXI_arid(3 downto 0) <= m05_couplers_to_axi_interconnect_ARID(3 downto 0);
  M05_AXI_arlen(7 downto 0) <= m05_couplers_to_axi_interconnect_ARLEN(7 downto 0);
  M05_AXI_arlock(0) <= m05_couplers_to_axi_interconnect_ARLOCK(0);
  M05_AXI_arprot(2 downto 0) <= m05_couplers_to_axi_interconnect_ARPROT(2 downto 0);
  M05_AXI_arqos(3 downto 0) <= m05_couplers_to_axi_interconnect_ARQOS(3 downto 0);
  M05_AXI_arregion(3 downto 0) <= m05_couplers_to_axi_interconnect_ARREGION(3 downto 0);
  M05_AXI_arsize(2 downto 0) <= m05_couplers_to_axi_interconnect_ARSIZE(2 downto 0);
  M05_AXI_arvalid(0) <= m05_couplers_to_axi_interconnect_ARVALID(0);
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_axi_interconnect_AWADDR(31 downto 0);
  M05_AXI_awburst(1 downto 0) <= m05_couplers_to_axi_interconnect_AWBURST(1 downto 0);
  M05_AXI_awcache(3 downto 0) <= m05_couplers_to_axi_interconnect_AWCACHE(3 downto 0);
  M05_AXI_awid(3 downto 0) <= m05_couplers_to_axi_interconnect_AWID(3 downto 0);
  M05_AXI_awlen(7 downto 0) <= m05_couplers_to_axi_interconnect_AWLEN(7 downto 0);
  M05_AXI_awlock(0) <= m05_couplers_to_axi_interconnect_AWLOCK(0);
  M05_AXI_awprot(2 downto 0) <= m05_couplers_to_axi_interconnect_AWPROT(2 downto 0);
  M05_AXI_awqos(3 downto 0) <= m05_couplers_to_axi_interconnect_AWQOS(3 downto 0);
  M05_AXI_awregion(3 downto 0) <= m05_couplers_to_axi_interconnect_AWREGION(3 downto 0);
  M05_AXI_awsize(2 downto 0) <= m05_couplers_to_axi_interconnect_AWSIZE(2 downto 0);
  M05_AXI_awvalid(0) <= m05_couplers_to_axi_interconnect_AWVALID(0);
  M05_AXI_bready(0) <= m05_couplers_to_axi_interconnect_BREADY(0);
  M05_AXI_rready(0) <= m05_couplers_to_axi_interconnect_RREADY(0);
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_axi_interconnect_WDATA(31 downto 0);
  M05_AXI_wlast(0) <= m05_couplers_to_axi_interconnect_WLAST(0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_axi_interconnect_WSTRB(3 downto 0);
  M05_AXI_wvalid(0) <= m05_couplers_to_axi_interconnect_WVALID(0);
  S00_AXI_arready(0) <= axi_interconnect_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= axi_interconnect_to_s00_couplers_AWREADY(0);
  S00_AXI_bid(3 downto 0) <= axi_interconnect_to_s00_couplers_BID(3 downto 0);
  S00_AXI_bresp(1 downto 0) <= axi_interconnect_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= axi_interconnect_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(31 downto 0) <= axi_interconnect_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(3 downto 0) <= axi_interconnect_to_s00_couplers_RID(3 downto 0);
  S00_AXI_rlast(0) <= axi_interconnect_to_s00_couplers_RLAST(0);
  S00_AXI_rresp(1 downto 0) <= axi_interconnect_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= axi_interconnect_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= axi_interconnect_to_s00_couplers_WREADY(0);
  S01_AXI_arready <= axi_interconnect_to_s01_couplers_ARREADY;
  S01_AXI_awready <= axi_interconnect_to_s01_couplers_AWREADY;
  S01_AXI_bresp(1 downto 0) <= axi_interconnect_to_s01_couplers_BRESP(1 downto 0);
  S01_AXI_bvalid <= axi_interconnect_to_s01_couplers_BVALID;
  S01_AXI_rdata(31 downto 0) <= axi_interconnect_to_s01_couplers_RDATA(31 downto 0);
  S01_AXI_rresp(1 downto 0) <= axi_interconnect_to_s01_couplers_RRESP(1 downto 0);
  S01_AXI_rvalid <= axi_interconnect_to_s01_couplers_RVALID;
  S01_AXI_wready <= axi_interconnect_to_s01_couplers_WREADY;
  S02_AXI_arready <= axi_interconnect_to_s02_couplers_ARREADY;
  S02_AXI_rdata(31 downto 0) <= axi_interconnect_to_s02_couplers_RDATA(31 downto 0);
  S02_AXI_rlast <= axi_interconnect_to_s02_couplers_RLAST;
  S02_AXI_rresp(1 downto 0) <= axi_interconnect_to_s02_couplers_RRESP(1 downto 0);
  S02_AXI_rvalid <= axi_interconnect_to_s02_couplers_RVALID;
  S03_AXI_awready <= axi_interconnect_to_s03_couplers_AWREADY;
  S03_AXI_bresp(1 downto 0) <= axi_interconnect_to_s03_couplers_BRESP(1 downto 0);
  S03_AXI_bvalid <= axi_interconnect_to_s03_couplers_BVALID;
  S03_AXI_wready <= axi_interconnect_to_s03_couplers_WREADY;
  axi_interconnect_ACLK_net <= ACLK;
  axi_interconnect_ARESETN_net <= ARESETN;
  axi_interconnect_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  axi_interconnect_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  axi_interconnect_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  axi_interconnect_to_s00_couplers_ARID(3 downto 0) <= S00_AXI_arid(3 downto 0);
  axi_interconnect_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  axi_interconnect_to_s00_couplers_ARLOCK(0) <= S00_AXI_arlock(0);
  axi_interconnect_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  axi_interconnect_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  axi_interconnect_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  axi_interconnect_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  axi_interconnect_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  axi_interconnect_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_interconnect_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_interconnect_to_s00_couplers_AWID(3 downto 0) <= S00_AXI_awid(3 downto 0);
  axi_interconnect_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_interconnect_to_s00_couplers_AWLOCK(0) <= S00_AXI_awlock(0);
  axi_interconnect_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_interconnect_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  axi_interconnect_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_interconnect_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  axi_interconnect_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  axi_interconnect_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  axi_interconnect_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  axi_interconnect_to_s00_couplers_WLAST(0) <= S00_AXI_wlast(0);
  axi_interconnect_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  axi_interconnect_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
  axi_interconnect_to_s01_couplers_ARADDR(31 downto 0) <= S01_AXI_araddr(31 downto 0);
  axi_interconnect_to_s01_couplers_ARPROT(2 downto 0) <= S01_AXI_arprot(2 downto 0);
  axi_interconnect_to_s01_couplers_ARVALID <= S01_AXI_arvalid;
  axi_interconnect_to_s01_couplers_AWADDR(31 downto 0) <= S01_AXI_awaddr(31 downto 0);
  axi_interconnect_to_s01_couplers_AWPROT(2 downto 0) <= S01_AXI_awprot(2 downto 0);
  axi_interconnect_to_s01_couplers_AWVALID <= S01_AXI_awvalid;
  axi_interconnect_to_s01_couplers_BREADY <= S01_AXI_bready;
  axi_interconnect_to_s01_couplers_RREADY <= S01_AXI_rready;
  axi_interconnect_to_s01_couplers_WDATA(31 downto 0) <= S01_AXI_wdata(31 downto 0);
  axi_interconnect_to_s01_couplers_WSTRB(3 downto 0) <= S01_AXI_wstrb(3 downto 0);
  axi_interconnect_to_s01_couplers_WVALID <= S01_AXI_wvalid;
  axi_interconnect_to_s02_couplers_ARADDR(31 downto 0) <= S02_AXI_araddr(31 downto 0);
  axi_interconnect_to_s02_couplers_ARBURST(1 downto 0) <= S02_AXI_arburst(1 downto 0);
  axi_interconnect_to_s02_couplers_ARCACHE(3 downto 0) <= S02_AXI_arcache(3 downto 0);
  axi_interconnect_to_s02_couplers_ARLEN(7 downto 0) <= S02_AXI_arlen(7 downto 0);
  axi_interconnect_to_s02_couplers_ARPROT(2 downto 0) <= S02_AXI_arprot(2 downto 0);
  axi_interconnect_to_s02_couplers_ARSIZE(2 downto 0) <= S02_AXI_arsize(2 downto 0);
  axi_interconnect_to_s02_couplers_ARVALID <= S02_AXI_arvalid;
  axi_interconnect_to_s02_couplers_RREADY <= S02_AXI_rready;
  axi_interconnect_to_s03_couplers_AWADDR(31 downto 0) <= S03_AXI_awaddr(31 downto 0);
  axi_interconnect_to_s03_couplers_AWBURST(1 downto 0) <= S03_AXI_awburst(1 downto 0);
  axi_interconnect_to_s03_couplers_AWCACHE(3 downto 0) <= S03_AXI_awcache(3 downto 0);
  axi_interconnect_to_s03_couplers_AWLEN(7 downto 0) <= S03_AXI_awlen(7 downto 0);
  axi_interconnect_to_s03_couplers_AWPROT(2 downto 0) <= S03_AXI_awprot(2 downto 0);
  axi_interconnect_to_s03_couplers_AWSIZE(2 downto 0) <= S03_AXI_awsize(2 downto 0);
  axi_interconnect_to_s03_couplers_AWVALID <= S03_AXI_awvalid;
  axi_interconnect_to_s03_couplers_BREADY <= S03_AXI_bready;
  axi_interconnect_to_s03_couplers_WDATA(31 downto 0) <= S03_AXI_wdata(31 downto 0);
  axi_interconnect_to_s03_couplers_WLAST <= S03_AXI_wlast;
  axi_interconnect_to_s03_couplers_WSTRB(3 downto 0) <= S03_AXI_wstrb(3 downto 0);
  axi_interconnect_to_s03_couplers_WVALID <= S03_AXI_wvalid;
  m00_couplers_to_axi_interconnect_ARREADY <= M00_AXI_arready;
  m00_couplers_to_axi_interconnect_AWREADY <= M00_AXI_awready;
  m00_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_axi_interconnect_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_axi_interconnect_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_axi_interconnect_WREADY <= M00_AXI_wready;
  m01_couplers_to_axi_interconnect_ARREADY <= M01_AXI_arready;
  m01_couplers_to_axi_interconnect_AWREADY <= M01_AXI_awready;
  m01_couplers_to_axi_interconnect_BID(3 downto 0) <= M01_AXI_bid(3 downto 0);
  m01_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_axi_interconnect_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_axi_interconnect_RID(3 downto 0) <= M01_AXI_rid(3 downto 0);
  m01_couplers_to_axi_interconnect_RLAST <= M01_AXI_rlast;
  m01_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_axi_interconnect_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_axi_interconnect_WREADY <= M01_AXI_wready;
  m02_couplers_to_axi_interconnect_ARREADY <= M02_AXI_arready;
  m02_couplers_to_axi_interconnect_AWREADY <= M02_AXI_awready;
  m02_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_axi_interconnect_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_axi_interconnect_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_axi_interconnect_WREADY <= M02_AXI_wready;
  m03_couplers_to_axi_interconnect_ARREADY <= M03_AXI_arready;
  m03_couplers_to_axi_interconnect_AWREADY <= M03_AXI_awready;
  m03_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_axi_interconnect_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_axi_interconnect_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_axi_interconnect_WREADY <= M03_AXI_wready;
  m04_couplers_to_axi_interconnect_ARREADY <= M04_AXI_arready;
  m04_couplers_to_axi_interconnect_AWREADY <= M04_AXI_awready;
  m04_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_axi_interconnect_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_axi_interconnect_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_axi_interconnect_WREADY <= M04_AXI_wready;
  m05_couplers_to_axi_interconnect_ARREADY(0) <= M05_AXI_arready(0);
  m05_couplers_to_axi_interconnect_AWREADY(0) <= M05_AXI_awready(0);
  m05_couplers_to_axi_interconnect_BID(3 downto 0) <= M05_AXI_bid(3 downto 0);
  m05_couplers_to_axi_interconnect_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_axi_interconnect_BVALID(0) <= M05_AXI_bvalid(0);
  m05_couplers_to_axi_interconnect_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_axi_interconnect_RID(3 downto 0) <= M05_AXI_rid(3 downto 0);
  m05_couplers_to_axi_interconnect_RLAST(0) <= M05_AXI_rlast(0);
  m05_couplers_to_axi_interconnect_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_axi_interconnect_RVALID(0) <= M05_AXI_rvalid(0);
  m05_couplers_to_axi_interconnect_WREADY(0) <= M05_AXI_wready(0);
m00_couplers: entity work.m00_couplers_imp_P3KODA
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_axi_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_axi_interconnect_ARREADY,
      M_AXI_arvalid => m00_couplers_to_axi_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_axi_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_axi_interconnect_AWREADY,
      M_AXI_awvalid => m00_couplers_to_axi_interconnect_AWVALID,
      M_AXI_bready => m00_couplers_to_axi_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_axi_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_axi_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_axi_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_axi_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_axi_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_axi_interconnect_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(3 downto 0) => xbar_to_m00_couplers_ARID(3 downto 0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(3 downto 0) => xbar_to_m00_couplers_AWID(3 downto 0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bid(3 downto 0) => xbar_to_m00_couplers_BID(3 downto 0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m00_couplers_RID(3 downto 0),
      S_AXI_rlast => xbar_to_m00_couplers_RLAST,
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1E9HINZ
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m01_couplers_to_axi_interconnect_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m01_couplers_to_axi_interconnect_ARCACHE(3 downto 0),
      M_AXI_arid(3 downto 0) => m01_couplers_to_axi_interconnect_ARID(3 downto 0),
      M_AXI_arlen(7 downto 0) => m01_couplers_to_axi_interconnect_ARLEN(7 downto 0),
      M_AXI_arlock(0) => m01_couplers_to_axi_interconnect_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_axi_interconnect_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m01_couplers_to_axi_interconnect_ARQOS(3 downto 0),
      M_AXI_arready => m01_couplers_to_axi_interconnect_ARREADY,
      M_AXI_arregion(3 downto 0) => m01_couplers_to_axi_interconnect_ARREGION(3 downto 0),
      M_AXI_arsize(2 downto 0) => m01_couplers_to_axi_interconnect_ARSIZE(2 downto 0),
      M_AXI_arvalid => m01_couplers_to_axi_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m01_couplers_to_axi_interconnect_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m01_couplers_to_axi_interconnect_AWCACHE(3 downto 0),
      M_AXI_awid(3 downto 0) => m01_couplers_to_axi_interconnect_AWID(3 downto 0),
      M_AXI_awlen(7 downto 0) => m01_couplers_to_axi_interconnect_AWLEN(7 downto 0),
      M_AXI_awlock(0) => m01_couplers_to_axi_interconnect_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_axi_interconnect_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m01_couplers_to_axi_interconnect_AWQOS(3 downto 0),
      M_AXI_awready => m01_couplers_to_axi_interconnect_AWREADY,
      M_AXI_awregion(3 downto 0) => m01_couplers_to_axi_interconnect_AWREGION(3 downto 0),
      M_AXI_awsize(2 downto 0) => m01_couplers_to_axi_interconnect_AWSIZE(2 downto 0),
      M_AXI_awvalid => m01_couplers_to_axi_interconnect_AWVALID,
      M_AXI_bid(3 downto 0) => m01_couplers_to_axi_interconnect_BID(3 downto 0),
      M_AXI_bready => m01_couplers_to_axi_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_axi_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rid(3 downto 0) => m01_couplers_to_axi_interconnect_RID(3 downto 0),
      M_AXI_rlast => m01_couplers_to_axi_interconnect_RLAST,
      M_AXI_rready => m01_couplers_to_axi_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_axi_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wlast => m01_couplers_to_axi_interconnect_WLAST,
      M_AXI_wready => m01_couplers_to_axi_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_axi_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_axi_interconnect_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arburst(1 downto 0) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      S_AXI_arcache(3 downto 0) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      S_AXI_arid(3 downto 0) => xbar_to_m01_couplers_ARID(7 downto 4),
      S_AXI_arlen(7 downto 0) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      S_AXI_arlock(0) => xbar_to_m01_couplers_ARLOCK(1),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arqos(3 downto 0) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      S_AXI_arsize(2 downto 0) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awburst(1 downto 0) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      S_AXI_awcache(3 downto 0) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      S_AXI_awid(3 downto 0) => xbar_to_m01_couplers_AWID(7 downto 4),
      S_AXI_awlen(7 downto 0) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      S_AXI_awlock(0) => xbar_to_m01_couplers_AWLOCK(1),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awqos(3 downto 0) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      S_AXI_awsize(2 downto 0) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bid(3 downto 0) => xbar_to_m01_couplers_BID(3 downto 0),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m01_couplers_RID(3 downto 0),
      S_AXI_rlast => xbar_to_m01_couplers_RLAST,
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wlast => xbar_to_m01_couplers_WLAST(1),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_QJ8X5P
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m02_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arready => m02_couplers_to_axi_interconnect_ARREADY,
      M_AXI_arvalid => m02_couplers_to_axi_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awready => m02_couplers_to_axi_interconnect_AWREADY,
      M_AXI_awvalid => m02_couplers_to_axi_interconnect_AWVALID,
      M_AXI_bready => m02_couplers_to_axi_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_axi_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_axi_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_axi_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_axi_interconnect_WREADY,
      M_AXI_wvalid => m02_couplers_to_axi_interconnect_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arburst(1 downto 0) => xbar_to_m02_couplers_ARBURST(5 downto 4),
      S_AXI_arcache(3 downto 0) => xbar_to_m02_couplers_ARCACHE(11 downto 8),
      S_AXI_arid(3 downto 0) => xbar_to_m02_couplers_ARID(11 downto 8),
      S_AXI_arlen(7 downto 0) => xbar_to_m02_couplers_ARLEN(23 downto 16),
      S_AXI_arlock(0) => xbar_to_m02_couplers_ARLOCK(2),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arqos(3 downto 0) => xbar_to_m02_couplers_ARQOS(11 downto 8),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m02_couplers_ARREGION(11 downto 8),
      S_AXI_arsize(2 downto 0) => xbar_to_m02_couplers_ARSIZE(8 downto 6),
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awburst(1 downto 0) => xbar_to_m02_couplers_AWBURST(5 downto 4),
      S_AXI_awcache(3 downto 0) => xbar_to_m02_couplers_AWCACHE(11 downto 8),
      S_AXI_awid(3 downto 0) => xbar_to_m02_couplers_AWID(11 downto 8),
      S_AXI_awlen(7 downto 0) => xbar_to_m02_couplers_AWLEN(23 downto 16),
      S_AXI_awlock(0) => xbar_to_m02_couplers_AWLOCK(2),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awqos(3 downto 0) => xbar_to_m02_couplers_AWQOS(11 downto 8),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m02_couplers_AWREGION(11 downto 8),
      S_AXI_awsize(2 downto 0) => xbar_to_m02_couplers_AWSIZE(8 downto 6),
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bid(3 downto 0) => xbar_to_m02_couplers_BID(3 downto 0),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m02_couplers_RID(3 downto 0),
      S_AXI_rlast => xbar_to_m02_couplers_RLAST,
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wlast => xbar_to_m02_couplers_WLAST(2),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1D3I8FW
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m03_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m03_couplers_to_axi_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m03_couplers_to_axi_interconnect_ARREADY,
      M_AXI_arvalid => m03_couplers_to_axi_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m03_couplers_to_axi_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m03_couplers_to_axi_interconnect_AWREADY,
      M_AXI_awvalid => m03_couplers_to_axi_interconnect_AWVALID,
      M_AXI_bready => m03_couplers_to_axi_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_axi_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_axi_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_axi_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_axi_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_axi_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_axi_interconnect_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arburst(1 downto 0) => xbar_to_m03_couplers_ARBURST(7 downto 6),
      S_AXI_arcache(3 downto 0) => xbar_to_m03_couplers_ARCACHE(15 downto 12),
      S_AXI_arid(3 downto 0) => xbar_to_m03_couplers_ARID(15 downto 12),
      S_AXI_arlen(7 downto 0) => xbar_to_m03_couplers_ARLEN(31 downto 24),
      S_AXI_arlock(0) => xbar_to_m03_couplers_ARLOCK(3),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arqos(3 downto 0) => xbar_to_m03_couplers_ARQOS(15 downto 12),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m03_couplers_ARREGION(15 downto 12),
      S_AXI_arsize(2 downto 0) => xbar_to_m03_couplers_ARSIZE(11 downto 9),
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awburst(1 downto 0) => xbar_to_m03_couplers_AWBURST(7 downto 6),
      S_AXI_awcache(3 downto 0) => xbar_to_m03_couplers_AWCACHE(15 downto 12),
      S_AXI_awid(3 downto 0) => xbar_to_m03_couplers_AWID(15 downto 12),
      S_AXI_awlen(7 downto 0) => xbar_to_m03_couplers_AWLEN(31 downto 24),
      S_AXI_awlock(0) => xbar_to_m03_couplers_AWLOCK(3),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awqos(3 downto 0) => xbar_to_m03_couplers_AWQOS(15 downto 12),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m03_couplers_AWREGION(15 downto 12),
      S_AXI_awsize(2 downto 0) => xbar_to_m03_couplers_AWSIZE(11 downto 9),
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bid(3 downto 0) => xbar_to_m03_couplers_BID(3 downto 0),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m03_couplers_RID(3 downto 0),
      S_AXI_rlast => xbar_to_m03_couplers_RLAST,
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wlast => xbar_to_m03_couplers_WLAST(3),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_MPPXSO
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m04_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m04_couplers_to_axi_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m04_couplers_to_axi_interconnect_ARREADY,
      M_AXI_arvalid => m04_couplers_to_axi_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m04_couplers_to_axi_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m04_couplers_to_axi_interconnect_AWREADY,
      M_AXI_awvalid => m04_couplers_to_axi_interconnect_AWVALID,
      M_AXI_bready => m04_couplers_to_axi_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_axi_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_axi_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_axi_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_axi_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_axi_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_axi_interconnect_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arburst(1 downto 0) => xbar_to_m04_couplers_ARBURST(9 downto 8),
      S_AXI_arcache(3 downto 0) => xbar_to_m04_couplers_ARCACHE(19 downto 16),
      S_AXI_arid(3 downto 0) => xbar_to_m04_couplers_ARID(19 downto 16),
      S_AXI_arlen(7 downto 0) => xbar_to_m04_couplers_ARLEN(39 downto 32),
      S_AXI_arlock(0) => xbar_to_m04_couplers_ARLOCK(4),
      S_AXI_arprot(2 downto 0) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      S_AXI_arqos(3 downto 0) => xbar_to_m04_couplers_ARQOS(19 downto 16),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m04_couplers_ARREGION(19 downto 16),
      S_AXI_arsize(2 downto 0) => xbar_to_m04_couplers_ARSIZE(14 downto 12),
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awburst(1 downto 0) => xbar_to_m04_couplers_AWBURST(9 downto 8),
      S_AXI_awcache(3 downto 0) => xbar_to_m04_couplers_AWCACHE(19 downto 16),
      S_AXI_awid(3 downto 0) => xbar_to_m04_couplers_AWID(19 downto 16),
      S_AXI_awlen(7 downto 0) => xbar_to_m04_couplers_AWLEN(39 downto 32),
      S_AXI_awlock(0) => xbar_to_m04_couplers_AWLOCK(4),
      S_AXI_awprot(2 downto 0) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      S_AXI_awqos(3 downto 0) => xbar_to_m04_couplers_AWQOS(19 downto 16),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m04_couplers_AWREGION(19 downto 16),
      S_AXI_awsize(2 downto 0) => xbar_to_m04_couplers_AWSIZE(14 downto 12),
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bid(3 downto 0) => xbar_to_m04_couplers_BID(3 downto 0),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m04_couplers_RID(3 downto 0),
      S_AXI_rlast => xbar_to_m04_couplers_RLAST,
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wlast => xbar_to_m04_couplers_WLAST(4),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1GVH48P
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m05_couplers_to_axi_interconnect_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m05_couplers_to_axi_interconnect_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m05_couplers_to_axi_interconnect_ARCACHE(3 downto 0),
      M_AXI_arid(3 downto 0) => m05_couplers_to_axi_interconnect_ARID(3 downto 0),
      M_AXI_arlen(7 downto 0) => m05_couplers_to_axi_interconnect_ARLEN(7 downto 0),
      M_AXI_arlock(0) => m05_couplers_to_axi_interconnect_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => m05_couplers_to_axi_interconnect_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m05_couplers_to_axi_interconnect_ARQOS(3 downto 0),
      M_AXI_arready(0) => m05_couplers_to_axi_interconnect_ARREADY(0),
      M_AXI_arregion(3 downto 0) => m05_couplers_to_axi_interconnect_ARREGION(3 downto 0),
      M_AXI_arsize(2 downto 0) => m05_couplers_to_axi_interconnect_ARSIZE(2 downto 0),
      M_AXI_arvalid(0) => m05_couplers_to_axi_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_axi_interconnect_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m05_couplers_to_axi_interconnect_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m05_couplers_to_axi_interconnect_AWCACHE(3 downto 0),
      M_AXI_awid(3 downto 0) => m05_couplers_to_axi_interconnect_AWID(3 downto 0),
      M_AXI_awlen(7 downto 0) => m05_couplers_to_axi_interconnect_AWLEN(7 downto 0),
      M_AXI_awlock(0) => m05_couplers_to_axi_interconnect_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => m05_couplers_to_axi_interconnect_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m05_couplers_to_axi_interconnect_AWQOS(3 downto 0),
      M_AXI_awready(0) => m05_couplers_to_axi_interconnect_AWREADY(0),
      M_AXI_awregion(3 downto 0) => m05_couplers_to_axi_interconnect_AWREGION(3 downto 0),
      M_AXI_awsize(2 downto 0) => m05_couplers_to_axi_interconnect_AWSIZE(2 downto 0),
      M_AXI_awvalid(0) => m05_couplers_to_axi_interconnect_AWVALID(0),
      M_AXI_bid(3 downto 0) => m05_couplers_to_axi_interconnect_BID(3 downto 0),
      M_AXI_bready(0) => m05_couplers_to_axi_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m05_couplers_to_axi_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m05_couplers_to_axi_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m05_couplers_to_axi_interconnect_RDATA(31 downto 0),
      M_AXI_rid(3 downto 0) => m05_couplers_to_axi_interconnect_RID(3 downto 0),
      M_AXI_rlast(0) => m05_couplers_to_axi_interconnect_RLAST(0),
      M_AXI_rready(0) => m05_couplers_to_axi_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m05_couplers_to_axi_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m05_couplers_to_axi_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m05_couplers_to_axi_interconnect_WDATA(31 downto 0),
      M_AXI_wlast(0) => m05_couplers_to_axi_interconnect_WLAST(0),
      M_AXI_wready(0) => m05_couplers_to_axi_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_axi_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m05_couplers_to_axi_interconnect_WVALID(0),
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arburst(1 downto 0) => xbar_to_m05_couplers_ARBURST(11 downto 10),
      S_AXI_arcache(3 downto 0) => xbar_to_m05_couplers_ARCACHE(23 downto 20),
      S_AXI_arid(3 downto 0) => xbar_to_m05_couplers_ARID(23 downto 20),
      S_AXI_arlen(7 downto 0) => xbar_to_m05_couplers_ARLEN(47 downto 40),
      S_AXI_arlock(0) => xbar_to_m05_couplers_ARLOCK(5),
      S_AXI_arprot(2 downto 0) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      S_AXI_arqos(3 downto 0) => xbar_to_m05_couplers_ARQOS(23 downto 20),
      S_AXI_arready(0) => xbar_to_m05_couplers_ARREADY(0),
      S_AXI_arregion(3 downto 0) => xbar_to_m05_couplers_ARREGION(23 downto 20),
      S_AXI_arsize(2 downto 0) => xbar_to_m05_couplers_ARSIZE(17 downto 15),
      S_AXI_arvalid(0) => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awburst(1 downto 0) => xbar_to_m05_couplers_AWBURST(11 downto 10),
      S_AXI_awcache(3 downto 0) => xbar_to_m05_couplers_AWCACHE(23 downto 20),
      S_AXI_awid(3 downto 0) => xbar_to_m05_couplers_AWID(23 downto 20),
      S_AXI_awlen(7 downto 0) => xbar_to_m05_couplers_AWLEN(47 downto 40),
      S_AXI_awlock(0) => xbar_to_m05_couplers_AWLOCK(5),
      S_AXI_awprot(2 downto 0) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      S_AXI_awqos(3 downto 0) => xbar_to_m05_couplers_AWQOS(23 downto 20),
      S_AXI_awready(0) => xbar_to_m05_couplers_AWREADY(0),
      S_AXI_awregion(3 downto 0) => xbar_to_m05_couplers_AWREGION(23 downto 20),
      S_AXI_awsize(2 downto 0) => xbar_to_m05_couplers_AWSIZE(17 downto 15),
      S_AXI_awvalid(0) => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bid(3 downto 0) => xbar_to_m05_couplers_BID(3 downto 0),
      S_AXI_bready(0) => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m05_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => xbar_to_m05_couplers_RID(3 downto 0),
      S_AXI_rlast(0) => xbar_to_m05_couplers_RLAST(0),
      S_AXI_rready(0) => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m05_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wlast(0) => xbar_to_m05_couplers_WLAST(5),
      S_AXI_wready(0) => xbar_to_m05_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid(0) => xbar_to_m05_couplers_WVALID(5)
    );
s00_couplers: entity work.s00_couplers_imp_19B3V30
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arid(3 downto 0) => s00_couplers_to_xbar_ARID(3 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awid(3 downto 0) => s00_couplers_to_xbar_AWID(3 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bid(3 downto 0) => s00_couplers_to_xbar_BID(3 downto 0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rid(3 downto 0) => s00_couplers_to_xbar_RID(3 downto 0),
      M_AXI_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wlast(0) => s00_couplers_to_xbar_WLAST(0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => axi_interconnect_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_interconnect_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_interconnect_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(3 downto 0) => axi_interconnect_to_s00_couplers_ARID(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_interconnect_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => axi_interconnect_to_s00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => axi_interconnect_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => axi_interconnect_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready(0) => axi_interconnect_to_s00_couplers_ARREADY(0),
      S_AXI_arsize(2 downto 0) => axi_interconnect_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid(0) => axi_interconnect_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => axi_interconnect_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(3 downto 0) => axi_interconnect_to_s00_couplers_AWID(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => axi_interconnect_to_s00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => axi_interconnect_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready(0) => axi_interconnect_to_s00_couplers_AWREADY(0),
      S_AXI_awsize(2 downto 0) => axi_interconnect_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid(0) => axi_interconnect_to_s00_couplers_AWVALID(0),
      S_AXI_bid(3 downto 0) => axi_interconnect_to_s00_couplers_BID(3 downto 0),
      S_AXI_bready(0) => axi_interconnect_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => axi_interconnect_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => axi_interconnect_to_s00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => axi_interconnect_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(3 downto 0) => axi_interconnect_to_s00_couplers_RID(3 downto 0),
      S_AXI_rlast(0) => axi_interconnect_to_s00_couplers_RLAST(0),
      S_AXI_rready(0) => axi_interconnect_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => axi_interconnect_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => axi_interconnect_to_s00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => axi_interconnect_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast(0) => axi_interconnect_to_s00_couplers_WLAST(0),
      S_AXI_wready(0) => axi_interconnect_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => axi_interconnect_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => axi_interconnect_to_s00_couplers_WVALID(0)
    );
s01_couplers: entity work.s01_couplers_imp_L45D6L
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s01_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s01_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s01_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s01_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s01_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s01_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s01_couplers_to_xbar_ARREADY(1),
      M_AXI_arsize(2 downto 0) => s01_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s01_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s01_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s01_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s01_couplers_to_xbar_AWREADY(1),
      M_AXI_awsize(2 downto 0) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s01_couplers_to_xbar_AWVALID,
      M_AXI_bready => s01_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s01_couplers_to_xbar_BRESP(3 downto 2),
      M_AXI_bvalid => s01_couplers_to_xbar_BVALID(1),
      M_AXI_rdata(31 downto 0) => s01_couplers_to_xbar_RDATA(63 downto 32),
      M_AXI_rlast => s01_couplers_to_xbar_RLAST(1),
      M_AXI_rready => s01_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s01_couplers_to_xbar_RRESP(3 downto 2),
      M_AXI_rvalid => s01_couplers_to_xbar_RVALID(1),
      M_AXI_wdata(31 downto 0) => s01_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wlast => s01_couplers_to_xbar_WLAST,
      M_AXI_wready => s01_couplers_to_xbar_WREADY(1),
      M_AXI_wstrb(3 downto 0) => s01_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s01_couplers_to_xbar_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => axi_interconnect_to_s01_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => axi_interconnect_to_s01_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_interconnect_to_s01_couplers_ARREADY,
      S_AXI_arvalid => axi_interconnect_to_s01_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => axi_interconnect_to_s01_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_to_s01_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_to_s01_couplers_AWREADY,
      S_AXI_awvalid => axi_interconnect_to_s01_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_to_s01_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_to_s01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_to_s01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => axi_interconnect_to_s01_couplers_RDATA(31 downto 0),
      S_AXI_rready => axi_interconnect_to_s01_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_interconnect_to_s01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_interconnect_to_s01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => axi_interconnect_to_s01_couplers_WDATA(31 downto 0),
      S_AXI_wready => axi_interconnect_to_s01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_interconnect_to_s01_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_interconnect_to_s01_couplers_WVALID
    );
s02_couplers: entity work.s02_couplers_imp_1A8C1WF
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s02_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s02_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s02_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s02_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arprot(2 downto 0) => s02_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s02_couplers_to_xbar_ARREADY(2),
      M_AXI_arsize(2 downto 0) => s02_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s02_couplers_to_xbar_ARVALID,
      M_AXI_rdata(31 downto 0) => s02_couplers_to_xbar_RDATA(95 downto 64),
      M_AXI_rlast => s02_couplers_to_xbar_RLAST(2),
      M_AXI_rready => s02_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s02_couplers_to_xbar_RRESP(5 downto 4),
      M_AXI_rvalid => s02_couplers_to_xbar_RVALID(2),
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => axi_interconnect_to_s02_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_interconnect_to_s02_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_interconnect_to_s02_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_interconnect_to_s02_couplers_ARLEN(7 downto 0),
      S_AXI_arprot(2 downto 0) => axi_interconnect_to_s02_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_interconnect_to_s02_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_interconnect_to_s02_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_interconnect_to_s02_couplers_ARVALID,
      S_AXI_rdata(31 downto 0) => axi_interconnect_to_s02_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_interconnect_to_s02_couplers_RLAST,
      S_AXI_rready => axi_interconnect_to_s02_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_interconnect_to_s02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_interconnect_to_s02_couplers_RVALID
    );
s03_couplers: entity work.s03_couplers_imp_KH77GE
     port map (
      M_ACLK => axi_interconnect_ACLK_net,
      M_ARESETN => axi_interconnect_ARESETN_net,
      M_AXI_awaddr(31 downto 0) => s03_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s03_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s03_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s03_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awprot(2 downto 0) => s03_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s03_couplers_to_xbar_AWREADY(3),
      M_AXI_awsize(2 downto 0) => s03_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s03_couplers_to_xbar_AWVALID,
      M_AXI_bready => s03_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s03_couplers_to_xbar_BRESP(7 downto 6),
      M_AXI_bvalid => s03_couplers_to_xbar_BVALID(3),
      M_AXI_wdata(31 downto 0) => s03_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wlast => s03_couplers_to_xbar_WLAST,
      M_AXI_wready => s03_couplers_to_xbar_WREADY(3),
      M_AXI_wstrb(3 downto 0) => s03_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s03_couplers_to_xbar_WVALID,
      S_ACLK => axi_interconnect_ACLK_net,
      S_ARESETN => axi_interconnect_ARESETN_net,
      S_AXI_awaddr(31 downto 0) => axi_interconnect_to_s03_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_to_s03_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_to_s03_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_to_s03_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_to_s03_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_to_s03_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_interconnect_to_s03_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_interconnect_to_s03_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_to_s03_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_to_s03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_to_s03_couplers_BVALID,
      S_AXI_wdata(31 downto 0) => axi_interconnect_to_s03_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_interconnect_to_s03_couplers_WLAST,
      S_AXI_wready => axi_interconnect_to_s03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_interconnect_to_s03_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_interconnect_to_s03_couplers_WVALID
    );
xbar: component design_1_xbar_0
     port map (
      aclk => axi_interconnect_ACLK_net,
      aresetn => axi_interconnect_ARESETN_net,
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(11 downto 10) => xbar_to_m05_couplers_ARBURST(11 downto 10),
      m_axi_arburst(9 downto 8) => xbar_to_m04_couplers_ARBURST(9 downto 8),
      m_axi_arburst(7 downto 6) => xbar_to_m03_couplers_ARBURST(7 downto 6),
      m_axi_arburst(5 downto 4) => xbar_to_m02_couplers_ARBURST(5 downto 4),
      m_axi_arburst(3 downto 2) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(23 downto 20) => xbar_to_m05_couplers_ARCACHE(23 downto 20),
      m_axi_arcache(19 downto 16) => xbar_to_m04_couplers_ARCACHE(19 downto 16),
      m_axi_arcache(15 downto 12) => xbar_to_m03_couplers_ARCACHE(15 downto 12),
      m_axi_arcache(11 downto 8) => xbar_to_m02_couplers_ARCACHE(11 downto 8),
      m_axi_arcache(7 downto 4) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(23 downto 20) => xbar_to_m05_couplers_ARID(23 downto 20),
      m_axi_arid(19 downto 16) => xbar_to_m04_couplers_ARID(19 downto 16),
      m_axi_arid(15 downto 12) => xbar_to_m03_couplers_ARID(15 downto 12),
      m_axi_arid(11 downto 8) => xbar_to_m02_couplers_ARID(11 downto 8),
      m_axi_arid(7 downto 4) => xbar_to_m01_couplers_ARID(7 downto 4),
      m_axi_arid(3 downto 0) => xbar_to_m00_couplers_ARID(3 downto 0),
      m_axi_arlen(47 downto 40) => xbar_to_m05_couplers_ARLEN(47 downto 40),
      m_axi_arlen(39 downto 32) => xbar_to_m04_couplers_ARLEN(39 downto 32),
      m_axi_arlen(31 downto 24) => xbar_to_m03_couplers_ARLEN(31 downto 24),
      m_axi_arlen(23 downto 16) => xbar_to_m02_couplers_ARLEN(23 downto 16),
      m_axi_arlen(15 downto 8) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(5) => xbar_to_m05_couplers_ARLOCK(5),
      m_axi_arlock(4) => xbar_to_m04_couplers_ARLOCK(4),
      m_axi_arlock(3) => xbar_to_m03_couplers_ARLOCK(3),
      m_axi_arlock(2) => xbar_to_m02_couplers_ARLOCK(2),
      m_axi_arlock(1) => xbar_to_m01_couplers_ARLOCK(1),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(17 downto 15) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(23 downto 20) => xbar_to_m05_couplers_ARQOS(23 downto 20),
      m_axi_arqos(19 downto 16) => xbar_to_m04_couplers_ARQOS(19 downto 16),
      m_axi_arqos(15 downto 12) => xbar_to_m03_couplers_ARQOS(15 downto 12),
      m_axi_arqos(11 downto 8) => xbar_to_m02_couplers_ARQOS(11 downto 8),
      m_axi_arqos(7 downto 4) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY(0),
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arregion(23 downto 20) => xbar_to_m05_couplers_ARREGION(23 downto 20),
      m_axi_arregion(19 downto 16) => xbar_to_m04_couplers_ARREGION(19 downto 16),
      m_axi_arregion(15 downto 12) => xbar_to_m03_couplers_ARREGION(15 downto 12),
      m_axi_arregion(11 downto 8) => xbar_to_m02_couplers_ARREGION(11 downto 8),
      m_axi_arregion(7 downto 4) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      m_axi_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(17 downto 15) => xbar_to_m05_couplers_ARSIZE(17 downto 15),
      m_axi_arsize(14 downto 12) => xbar_to_m04_couplers_ARSIZE(14 downto 12),
      m_axi_arsize(11 downto 9) => xbar_to_m03_couplers_ARSIZE(11 downto 9),
      m_axi_arsize(8 downto 6) => xbar_to_m02_couplers_ARSIZE(8 downto 6),
      m_axi_arsize(5 downto 3) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(11 downto 10) => xbar_to_m05_couplers_AWBURST(11 downto 10),
      m_axi_awburst(9 downto 8) => xbar_to_m04_couplers_AWBURST(9 downto 8),
      m_axi_awburst(7 downto 6) => xbar_to_m03_couplers_AWBURST(7 downto 6),
      m_axi_awburst(5 downto 4) => xbar_to_m02_couplers_AWBURST(5 downto 4),
      m_axi_awburst(3 downto 2) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(23 downto 20) => xbar_to_m05_couplers_AWCACHE(23 downto 20),
      m_axi_awcache(19 downto 16) => xbar_to_m04_couplers_AWCACHE(19 downto 16),
      m_axi_awcache(15 downto 12) => xbar_to_m03_couplers_AWCACHE(15 downto 12),
      m_axi_awcache(11 downto 8) => xbar_to_m02_couplers_AWCACHE(11 downto 8),
      m_axi_awcache(7 downto 4) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(23 downto 20) => xbar_to_m05_couplers_AWID(23 downto 20),
      m_axi_awid(19 downto 16) => xbar_to_m04_couplers_AWID(19 downto 16),
      m_axi_awid(15 downto 12) => xbar_to_m03_couplers_AWID(15 downto 12),
      m_axi_awid(11 downto 8) => xbar_to_m02_couplers_AWID(11 downto 8),
      m_axi_awid(7 downto 4) => xbar_to_m01_couplers_AWID(7 downto 4),
      m_axi_awid(3 downto 0) => xbar_to_m00_couplers_AWID(3 downto 0),
      m_axi_awlen(47 downto 40) => xbar_to_m05_couplers_AWLEN(47 downto 40),
      m_axi_awlen(39 downto 32) => xbar_to_m04_couplers_AWLEN(39 downto 32),
      m_axi_awlen(31 downto 24) => xbar_to_m03_couplers_AWLEN(31 downto 24),
      m_axi_awlen(23 downto 16) => xbar_to_m02_couplers_AWLEN(23 downto 16),
      m_axi_awlen(15 downto 8) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(5) => xbar_to_m05_couplers_AWLOCK(5),
      m_axi_awlock(4) => xbar_to_m04_couplers_AWLOCK(4),
      m_axi_awlock(3) => xbar_to_m03_couplers_AWLOCK(3),
      m_axi_awlock(2) => xbar_to_m02_couplers_AWLOCK(2),
      m_axi_awlock(1) => xbar_to_m01_couplers_AWLOCK(1),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(17 downto 15) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(23 downto 20) => xbar_to_m05_couplers_AWQOS(23 downto 20),
      m_axi_awqos(19 downto 16) => xbar_to_m04_couplers_AWQOS(19 downto 16),
      m_axi_awqos(15 downto 12) => xbar_to_m03_couplers_AWQOS(15 downto 12),
      m_axi_awqos(11 downto 8) => xbar_to_m02_couplers_AWQOS(11 downto 8),
      m_axi_awqos(7 downto 4) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY(0),
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awregion(23 downto 20) => xbar_to_m05_couplers_AWREGION(23 downto 20),
      m_axi_awregion(19 downto 16) => xbar_to_m04_couplers_AWREGION(19 downto 16),
      m_axi_awregion(15 downto 12) => xbar_to_m03_couplers_AWREGION(15 downto 12),
      m_axi_awregion(11 downto 8) => xbar_to_m02_couplers_AWREGION(11 downto 8),
      m_axi_awregion(7 downto 4) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      m_axi_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(17 downto 15) => xbar_to_m05_couplers_AWSIZE(17 downto 15),
      m_axi_awsize(14 downto 12) => xbar_to_m04_couplers_AWSIZE(14 downto 12),
      m_axi_awsize(11 downto 9) => xbar_to_m03_couplers_AWSIZE(11 downto 9),
      m_axi_awsize(8 downto 6) => xbar_to_m02_couplers_AWSIZE(8 downto 6),
      m_axi_awsize(5 downto 3) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bid(23 downto 20) => xbar_to_m05_couplers_BID(3 downto 0),
      m_axi_bid(19 downto 16) => xbar_to_m04_couplers_BID(3 downto 0),
      m_axi_bid(15 downto 12) => xbar_to_m03_couplers_BID(3 downto 0),
      m_axi_bid(11 downto 8) => xbar_to_m02_couplers_BID(3 downto 0),
      m_axi_bid(7 downto 4) => xbar_to_m01_couplers_BID(3 downto 0),
      m_axi_bid(3 downto 0) => xbar_to_m00_couplers_BID(3 downto 0),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID(0),
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rid(23 downto 20) => xbar_to_m05_couplers_RID(3 downto 0),
      m_axi_rid(19 downto 16) => xbar_to_m04_couplers_RID(3 downto 0),
      m_axi_rid(15 downto 12) => xbar_to_m03_couplers_RID(3 downto 0),
      m_axi_rid(11 downto 8) => xbar_to_m02_couplers_RID(3 downto 0),
      m_axi_rid(7 downto 4) => xbar_to_m01_couplers_RID(3 downto 0),
      m_axi_rid(3 downto 0) => xbar_to_m00_couplers_RID(3 downto 0),
      m_axi_rlast(5) => xbar_to_m05_couplers_RLAST(0),
      m_axi_rlast(4) => xbar_to_m04_couplers_RLAST,
      m_axi_rlast(3) => xbar_to_m03_couplers_RLAST,
      m_axi_rlast(2) => xbar_to_m02_couplers_RLAST,
      m_axi_rlast(1) => xbar_to_m01_couplers_RLAST,
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST,
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID(0),
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wlast(5) => xbar_to_m05_couplers_WLAST(5),
      m_axi_wlast(4) => xbar_to_m04_couplers_WLAST(4),
      m_axi_wlast(3) => xbar_to_m03_couplers_WLAST(3),
      m_axi_wlast(2) => xbar_to_m02_couplers_WLAST(2),
      m_axi_wlast(1) => xbar_to_m01_couplers_WLAST(1),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY(0),
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(127 downto 96) => B"00000000000000000000000000000000",
      s_axi_araddr(95 downto 64) => s02_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(63 downto 32) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arburst(7 downto 6) => B"00",
      s_axi_arburst(5 downto 4) => s02_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arburst(3 downto 2) => s01_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(15 downto 12) => B"0000",
      s_axi_arcache(11 downto 8) => s02_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arcache(7 downto 4) => s01_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arid(15 downto 4) => B"000000000000",
      s_axi_arid(3 downto 0) => s00_couplers_to_xbar_ARID(3 downto 0),
      s_axi_arlen(31 downto 24) => B"00000000",
      s_axi_arlen(23 downto 16) => s02_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlen(15 downto 8) => s01_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(3 downto 2) => B"00",
      s_axi_arlock(1) => s01_couplers_to_xbar_ARLOCK(0),
      s_axi_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      s_axi_arprot(11 downto 9) => B"000",
      s_axi_arprot(8 downto 6) => s02_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(5 downto 3) => s01_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(15 downto 8) => B"00000000",
      s_axi_arqos(7 downto 4) => s01_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arready(3) => NLW_xbar_s_axi_arready_UNCONNECTED(3),
      s_axi_arready(2) => s02_couplers_to_xbar_ARREADY(2),
      s_axi_arready(1) => s01_couplers_to_xbar_ARREADY(1),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(11 downto 9) => B"000",
      s_axi_arsize(8 downto 6) => s02_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arsize(5 downto 3) => s01_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arvalid(3) => '0',
      s_axi_arvalid(2) => s02_couplers_to_xbar_ARVALID,
      s_axi_arvalid(1) => s01_couplers_to_xbar_ARVALID,
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(127 downto 96) => s03_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(95 downto 64) => B"00000000000000000000000000000000",
      s_axi_awaddr(63 downto 32) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awburst(7 downto 6) => s03_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(5 downto 4) => B"00",
      s_axi_awburst(3 downto 2) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(15 downto 12) => s03_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(11 downto 8) => B"0000",
      s_axi_awcache(7 downto 4) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 4) => B"000000000000",
      s_axi_awid(3 downto 0) => s00_couplers_to_xbar_AWID(3 downto 0),
      s_axi_awlen(31 downto 24) => s03_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(23 downto 16) => B"00000000",
      s_axi_awlen(15 downto 8) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(3 downto 2) => B"00",
      s_axi_awlock(1) => s01_couplers_to_xbar_AWLOCK(0),
      s_axi_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      s_axi_awprot(11 downto 9) => s03_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(8 downto 6) => B"000",
      s_axi_awprot(5 downto 3) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(15 downto 8) => B"00000000",
      s_axi_awqos(7 downto 4) => s01_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awready(3) => s03_couplers_to_xbar_AWREADY(3),
      s_axi_awready(2) => NLW_xbar_s_axi_awready_UNCONNECTED(2),
      s_axi_awready(1) => s01_couplers_to_xbar_AWREADY(1),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(11 downto 9) => s03_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(8 downto 6) => B"000",
      s_axi_awsize(5 downto 3) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awvalid(3) => s03_couplers_to_xbar_AWVALID,
      s_axi_awvalid(2) => '0',
      s_axi_awvalid(1) => s01_couplers_to_xbar_AWVALID,
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bid(15 downto 4) => NLW_xbar_s_axi_bid_UNCONNECTED(15 downto 4),
      s_axi_bid(3 downto 0) => s00_couplers_to_xbar_BID(3 downto 0),
      s_axi_bready(3) => s03_couplers_to_xbar_BREADY,
      s_axi_bready(2) => '0',
      s_axi_bready(1) => s01_couplers_to_xbar_BREADY,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(7 downto 6) => s03_couplers_to_xbar_BRESP(7 downto 6),
      s_axi_bresp(5 downto 4) => NLW_xbar_s_axi_bresp_UNCONNECTED(5 downto 4),
      s_axi_bresp(3 downto 2) => s01_couplers_to_xbar_BRESP(3 downto 2),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(3) => s03_couplers_to_xbar_BVALID(3),
      s_axi_bvalid(2) => NLW_xbar_s_axi_bvalid_UNCONNECTED(2),
      s_axi_bvalid(1) => s01_couplers_to_xbar_BVALID(1),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(127 downto 96) => NLW_xbar_s_axi_rdata_UNCONNECTED(127 downto 96),
      s_axi_rdata(95 downto 64) => s02_couplers_to_xbar_RDATA(95 downto 64),
      s_axi_rdata(63 downto 32) => s01_couplers_to_xbar_RDATA(63 downto 32),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rid(15 downto 4) => NLW_xbar_s_axi_rid_UNCONNECTED(15 downto 4),
      s_axi_rid(3 downto 0) => s00_couplers_to_xbar_RID(3 downto 0),
      s_axi_rlast(3) => NLW_xbar_s_axi_rlast_UNCONNECTED(3),
      s_axi_rlast(2) => s02_couplers_to_xbar_RLAST(2),
      s_axi_rlast(1) => s01_couplers_to_xbar_RLAST(1),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(3) => '0',
      s_axi_rready(2) => s02_couplers_to_xbar_RREADY,
      s_axi_rready(1) => s01_couplers_to_xbar_RREADY,
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(7 downto 6) => NLW_xbar_s_axi_rresp_UNCONNECTED(7 downto 6),
      s_axi_rresp(5 downto 4) => s02_couplers_to_xbar_RRESP(5 downto 4),
      s_axi_rresp(3 downto 2) => s01_couplers_to_xbar_RRESP(3 downto 2),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(3) => NLW_xbar_s_axi_rvalid_UNCONNECTED(3),
      s_axi_rvalid(2) => s02_couplers_to_xbar_RVALID(2),
      s_axi_rvalid(1) => s01_couplers_to_xbar_RVALID(1),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(127 downto 96) => s03_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wdata(95 downto 64) => B"00000000000000000000000000000000",
      s_axi_wdata(63 downto 32) => s01_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wlast(3) => s03_couplers_to_xbar_WLAST,
      s_axi_wlast(2) => '0',
      s_axi_wlast(1) => s01_couplers_to_xbar_WLAST,
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST(0),
      s_axi_wready(3) => s03_couplers_to_xbar_WREADY(3),
      s_axi_wready(2) => NLW_xbar_s_axi_wready_UNCONNECTED(2),
      s_axi_wready(1) => s01_couplers_to_xbar_WREADY(1),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(15 downto 12) => s03_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wstrb(11 downto 8) => B"1111",
      s_axi_wstrb(7 downto 4) => s01_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(3) => s03_couplers_to_xbar_WVALID,
      s_axi_wvalid(2) => '0',
      s_axi_wvalid(1) => s01_couplers_to_xbar_WVALID,
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
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
    fifo_out_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    fifo_out_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_out_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_arready : in STD_LOGIC;
    fifo_out_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axi_arvalid : out STD_LOGIC;
    fifo_out_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    fifo_out_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_out_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_awready : in STD_LOGIC;
    fifo_out_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axi_awvalid : out STD_LOGIC;
    fifo_out_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_bready : out STD_LOGIC;
    fifo_out_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axi_bvalid : in STD_LOGIC;
    fifo_out_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_rlast : in STD_LOGIC;
    fifo_out_axi_rready : out STD_LOGIC;
    fifo_out_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axi_rvalid : in STD_LOGIC;
    fifo_out_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axi_wlast : out STD_LOGIC;
    fifo_out_axi_wready : in STD_LOGIC;
    fifo_out_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axi_wvalid : out STD_LOGIC;
    fifo_out_axilite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axilite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axilite_arready : in STD_LOGIC;
    fifo_out_axilite_arvalid : out STD_LOGIC;
    fifo_out_axilite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axilite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    fifo_out_axilite_awready : in STD_LOGIC;
    fifo_out_axilite_awvalid : out STD_LOGIC;
    fifo_out_axilite_bready : out STD_LOGIC;
    fifo_out_axilite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axilite_bvalid : in STD_LOGIC;
    fifo_out_axilite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axilite_rready : out STD_LOGIC;
    fifo_out_axilite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_out_axilite_rvalid : in STD_LOGIC;
    fifo_out_axilite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_out_axilite_wready : in STD_LOGIC;
    fifo_out_axilite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_out_axilite_wvalid : out STD_LOGIC;
    in_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axi_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_axilite_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axilite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axilite_arready : out STD_LOGIC;
    in_axilite_arvalid : in STD_LOGIC;
    in_axilite_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axilite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    in_axilite_awready : out STD_LOGIC;
    in_axilite_awvalid : in STD_LOGIC;
    in_axilite_bready : in STD_LOGIC;
    in_axilite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axilite_bvalid : out STD_LOGIC;
    in_axilite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axilite_rready : in STD_LOGIC;
    in_axilite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in_axilite_rvalid : out STD_LOGIC;
    in_axilite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axilite_wready : out STD_LOGIC;
    in_axilite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_axilite_wvalid : in STD_LOGIC;
    out0_axilite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out0_axilite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out0_axilite_arready : in STD_LOGIC;
    out0_axilite_arvalid : out STD_LOGIC;
    out0_axilite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out0_axilite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out0_axilite_awready : in STD_LOGIC;
    out0_axilite_awvalid : out STD_LOGIC;
    out0_axilite_bready : out STD_LOGIC;
    out0_axilite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out0_axilite_bvalid : in STD_LOGIC;
    out0_axilite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out0_axilite_rready : out STD_LOGIC;
    out0_axilite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out0_axilite_rvalid : in STD_LOGIC;
    out0_axilite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out0_axilite_wready : in STD_LOGIC;
    out0_axilite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out0_axilite_wvalid : out STD_LOGIC;
    out1_axilite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out1_axilite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out1_axilite_arready : in STD_LOGIC;
    out1_axilite_arvalid : out STD_LOGIC;
    out1_axilite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out1_axilite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out1_axilite_awready : in STD_LOGIC;
    out1_axilite_awvalid : out STD_LOGIC;
    out1_axilite_bready : out STD_LOGIC;
    out1_axilite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out1_axilite_bvalid : in STD_LOGIC;
    out1_axilite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out1_axilite_rready : out STD_LOGIC;
    out1_axilite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out1_axilite_rvalid : in STD_LOGIC;
    out1_axilite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out1_axilite_wready : in STD_LOGIC;
    out1_axilite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out1_axilite_wvalid : out STD_LOGIC;
    out_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out_axi_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    out_axi_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out_axi_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out_axi_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_axi_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_axi_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=21,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=11,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_clkrst_cnt=8,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_axi_data_fifo_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_axi_data_fifo_0_0;
  component design_1_axi_data_fifo_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_axi_data_fifo_1_0;
  component design_1_axi_dma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component design_1_axi_dma_0_0;
  component design_1_rst_aclk_10M_0 is
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
  end component design_1_rst_aclk_10M_0;
  signal ACLK_0_1 : STD_LOGIC;
  signal S00_AXI_0_1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S00_AXI_0_1_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S00_AXI_0_1_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_1_ARREADY : STD_LOGIC;
  signal S01_AXI_0_1_ARVALID : STD_LOGIC;
  signal S01_AXI_0_1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_1_AWREADY : STD_LOGIC;
  signal S01_AXI_0_1_AWVALID : STD_LOGIC;
  signal S01_AXI_0_1_BREADY : STD_LOGIC;
  signal S01_AXI_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_1_BVALID : STD_LOGIC;
  signal S01_AXI_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_1_RREADY : STD_LOGIC;
  signal S01_AXI_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_1_RVALID : STD_LOGIC;
  signal S01_AXI_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_1_WREADY : STD_LOGIC;
  signal S01_AXI_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_1_WVALID : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_0_M_AXI_AWREADY : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_AWVALID : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_BREADY : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_0_M_AXI_BVALID : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_0_M_AXI_WREADY : STD_LOGIC;
  signal axi_data_fifo_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_0_M_AXI_WVALID : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_data_fifo_1_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARREADY : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_1_M_AXI_ARVALID : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_data_fifo_1_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWREADY : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_data_fifo_1_M_AXI_AWVALID : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_BREADY : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_1_M_AXI_BVALID : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_1_M_AXI_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_RLAST : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_RREADY : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_data_fifo_1_M_AXI_RVALID : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_data_fifo_1_M_AXI_WLAST : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_WREADY : STD_LOGIC;
  signal axi_data_fifo_1_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_data_fifo_1_M_AXI_WVALID : STD_LOGIC;
  signal axi_dma_0_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXIS_MM2S_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXIS_MM2S_TLAST : STD_LOGIC;
  signal axi_dma_0_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_dma_0_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_RLAST : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_WLAST : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M02_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M02_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M02_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M02_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M02_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M02_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M02_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M03_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M03_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M03_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M03_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M03_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M03_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M03_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M03_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M03_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M04_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M04_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M04_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M04_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M04_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M04_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M04_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M04_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M04_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M05_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M05_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M05_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M05_AXI_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M05_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M05_AXI_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M05_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_aclk_10M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_dma_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_aclk_10M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_aclk_10M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_aclk_10M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_aclk_10M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF in_axi:fifo_out_axilite:fifo_out_axi:out0_axilite:out1_axilite:out_axi:in_axilite, CLK_DOMAIN design_1_ACLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RST.ARESETN RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of fifo_out_axi_arready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARREADY";
  attribute X_INTERFACE_INFO of fifo_out_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARVALID";
  attribute X_INTERFACE_INFO of fifo_out_axi_awready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWREADY";
  attribute X_INTERFACE_INFO of fifo_out_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWVALID";
  attribute X_INTERFACE_INFO of fifo_out_axi_bready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi BREADY";
  attribute X_INTERFACE_INFO of fifo_out_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi BVALID";
  attribute X_INTERFACE_INFO of fifo_out_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RLAST";
  attribute X_INTERFACE_INFO of fifo_out_axi_rready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RREADY";
  attribute X_INTERFACE_INFO of fifo_out_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RVALID";
  attribute X_INTERFACE_INFO of fifo_out_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi WLAST";
  attribute X_INTERFACE_INFO of fifo_out_axi_wready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi WREADY";
  attribute X_INTERFACE_INFO of fifo_out_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi WVALID";
  attribute X_INTERFACE_INFO of fifo_out_axilite_arready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite ARREADY";
  attribute X_INTERFACE_INFO of fifo_out_axilite_arvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite ARVALID";
  attribute X_INTERFACE_INFO of fifo_out_axilite_awready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite AWREADY";
  attribute X_INTERFACE_INFO of fifo_out_axilite_awvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite AWVALID";
  attribute X_INTERFACE_INFO of fifo_out_axilite_bready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite BREADY";
  attribute X_INTERFACE_INFO of fifo_out_axilite_bvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite BVALID";
  attribute X_INTERFACE_INFO of fifo_out_axilite_rready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite RREADY";
  attribute X_INTERFACE_INFO of fifo_out_axilite_rvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite RVALID";
  attribute X_INTERFACE_INFO of fifo_out_axilite_wready : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite WREADY";
  attribute X_INTERFACE_INFO of fifo_out_axilite_wvalid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite WVALID";
  attribute X_INTERFACE_INFO of in_axilite_arready : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_arvalid : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_awready : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_awvalid : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_bready : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_bvalid : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_rready : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_rvalid : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_wready : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_wvalid : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of out0_axilite_arready : signal is "xilinx.com:interface:aximm:1.0 out0_axilite ARREADY";
  attribute X_INTERFACE_INFO of out0_axilite_arvalid : signal is "xilinx.com:interface:aximm:1.0 out0_axilite ARVALID";
  attribute X_INTERFACE_INFO of out0_axilite_awready : signal is "xilinx.com:interface:aximm:1.0 out0_axilite AWREADY";
  attribute X_INTERFACE_INFO of out0_axilite_awvalid : signal is "xilinx.com:interface:aximm:1.0 out0_axilite AWVALID";
  attribute X_INTERFACE_INFO of out0_axilite_bready : signal is "xilinx.com:interface:aximm:1.0 out0_axilite BREADY";
  attribute X_INTERFACE_INFO of out0_axilite_bvalid : signal is "xilinx.com:interface:aximm:1.0 out0_axilite BVALID";
  attribute X_INTERFACE_INFO of out0_axilite_rready : signal is "xilinx.com:interface:aximm:1.0 out0_axilite RREADY";
  attribute X_INTERFACE_INFO of out0_axilite_rvalid : signal is "xilinx.com:interface:aximm:1.0 out0_axilite RVALID";
  attribute X_INTERFACE_INFO of out0_axilite_wready : signal is "xilinx.com:interface:aximm:1.0 out0_axilite WREADY";
  attribute X_INTERFACE_INFO of out0_axilite_wvalid : signal is "xilinx.com:interface:aximm:1.0 out0_axilite WVALID";
  attribute X_INTERFACE_INFO of out1_axilite_arready : signal is "xilinx.com:interface:aximm:1.0 out1_axilite ARREADY";
  attribute X_INTERFACE_INFO of out1_axilite_arvalid : signal is "xilinx.com:interface:aximm:1.0 out1_axilite ARVALID";
  attribute X_INTERFACE_INFO of out1_axilite_awready : signal is "xilinx.com:interface:aximm:1.0 out1_axilite AWREADY";
  attribute X_INTERFACE_INFO of out1_axilite_awvalid : signal is "xilinx.com:interface:aximm:1.0 out1_axilite AWVALID";
  attribute X_INTERFACE_INFO of out1_axilite_bready : signal is "xilinx.com:interface:aximm:1.0 out1_axilite BREADY";
  attribute X_INTERFACE_INFO of out1_axilite_bvalid : signal is "xilinx.com:interface:aximm:1.0 out1_axilite BVALID";
  attribute X_INTERFACE_INFO of out1_axilite_rready : signal is "xilinx.com:interface:aximm:1.0 out1_axilite RREADY";
  attribute X_INTERFACE_INFO of out1_axilite_rvalid : signal is "xilinx.com:interface:aximm:1.0 out1_axilite RVALID";
  attribute X_INTERFACE_INFO of out1_axilite_wready : signal is "xilinx.com:interface:aximm:1.0 out1_axilite WREADY";
  attribute X_INTERFACE_INFO of out1_axilite_wvalid : signal is "xilinx.com:interface:aximm:1.0 out1_axilite WVALID";
  attribute X_INTERFACE_INFO of fifo_out_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARADDR";
  attribute X_INTERFACE_PARAMETER of fifo_out_axi_araddr : signal is "XIL_INTERFACENAME fifo_out_axi, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 4, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of fifo_out_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARBURST";
  attribute X_INTERFACE_INFO of fifo_out_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARCACHE";
  attribute X_INTERFACE_INFO of fifo_out_axi_arid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARID";
  attribute X_INTERFACE_INFO of fifo_out_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARLEN";
  attribute X_INTERFACE_INFO of fifo_out_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARLOCK";
  attribute X_INTERFACE_INFO of fifo_out_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARPROT";
  attribute X_INTERFACE_INFO of fifo_out_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARQOS";
  attribute X_INTERFACE_INFO of fifo_out_axi_arregion : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARREGION";
  attribute X_INTERFACE_INFO of fifo_out_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi ARSIZE";
  attribute X_INTERFACE_INFO of fifo_out_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWADDR";
  attribute X_INTERFACE_INFO of fifo_out_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWBURST";
  attribute X_INTERFACE_INFO of fifo_out_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWCACHE";
  attribute X_INTERFACE_INFO of fifo_out_axi_awid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWID";
  attribute X_INTERFACE_INFO of fifo_out_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWLEN";
  attribute X_INTERFACE_INFO of fifo_out_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWLOCK";
  attribute X_INTERFACE_INFO of fifo_out_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWPROT";
  attribute X_INTERFACE_INFO of fifo_out_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWQOS";
  attribute X_INTERFACE_INFO of fifo_out_axi_awregion : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWREGION";
  attribute X_INTERFACE_INFO of fifo_out_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi AWSIZE";
  attribute X_INTERFACE_INFO of fifo_out_axi_bid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi BID";
  attribute X_INTERFACE_INFO of fifo_out_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi BRESP";
  attribute X_INTERFACE_INFO of fifo_out_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RDATA";
  attribute X_INTERFACE_INFO of fifo_out_axi_rid : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RID";
  attribute X_INTERFACE_INFO of fifo_out_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi RRESP";
  attribute X_INTERFACE_INFO of fifo_out_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi WDATA";
  attribute X_INTERFACE_INFO of fifo_out_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axi WSTRB";
  attribute X_INTERFACE_INFO of fifo_out_axilite_araddr : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite ARADDR";
  attribute X_INTERFACE_PARAMETER of fifo_out_axilite_araddr : signal is "XIL_INTERFACENAME fifo_out_axilite, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of fifo_out_axilite_arprot : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite ARPROT";
  attribute X_INTERFACE_INFO of fifo_out_axilite_awaddr : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite AWADDR";
  attribute X_INTERFACE_INFO of fifo_out_axilite_awprot : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite AWPROT";
  attribute X_INTERFACE_INFO of fifo_out_axilite_bresp : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite BRESP";
  attribute X_INTERFACE_INFO of fifo_out_axilite_rdata : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite RDATA";
  attribute X_INTERFACE_INFO of fifo_out_axilite_rresp : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite RRESP";
  attribute X_INTERFACE_INFO of fifo_out_axilite_wdata : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite WDATA";
  attribute X_INTERFACE_INFO of fifo_out_axilite_wstrb : signal is "xilinx.com:interface:aximm:1.0 fifo_out_axilite WSTRB";
  attribute X_INTERFACE_INFO of in_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 in_axi ARADDR";
  attribute X_INTERFACE_PARAMETER of in_axi_araddr : signal is "XIL_INTERFACENAME in_axi, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 2, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of in_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 in_axi ARBURST";
  attribute X_INTERFACE_INFO of in_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 in_axi ARCACHE";
  attribute X_INTERFACE_INFO of in_axi_arid : signal is "xilinx.com:interface:aximm:1.0 in_axi ARID";
  attribute X_INTERFACE_INFO of in_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 in_axi ARLEN";
  attribute X_INTERFACE_INFO of in_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 in_axi ARLOCK";
  attribute X_INTERFACE_INFO of in_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 in_axi ARPROT";
  attribute X_INTERFACE_INFO of in_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 in_axi ARQOS";
  attribute X_INTERFACE_INFO of in_axi_arready : signal is "xilinx.com:interface:aximm:1.0 in_axi ARREADY";
  attribute X_INTERFACE_INFO of in_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 in_axi ARSIZE";
  attribute X_INTERFACE_INFO of in_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 in_axi ARVALID";
  attribute X_INTERFACE_INFO of in_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 in_axi AWADDR";
  attribute X_INTERFACE_INFO of in_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 in_axi AWBURST";
  attribute X_INTERFACE_INFO of in_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 in_axi AWCACHE";
  attribute X_INTERFACE_INFO of in_axi_awid : signal is "xilinx.com:interface:aximm:1.0 in_axi AWID";
  attribute X_INTERFACE_INFO of in_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 in_axi AWLEN";
  attribute X_INTERFACE_INFO of in_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 in_axi AWLOCK";
  attribute X_INTERFACE_INFO of in_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 in_axi AWPROT";
  attribute X_INTERFACE_INFO of in_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 in_axi AWQOS";
  attribute X_INTERFACE_INFO of in_axi_awready : signal is "xilinx.com:interface:aximm:1.0 in_axi AWREADY";
  attribute X_INTERFACE_INFO of in_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 in_axi AWSIZE";
  attribute X_INTERFACE_INFO of in_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 in_axi AWVALID";
  attribute X_INTERFACE_INFO of in_axi_bid : signal is "xilinx.com:interface:aximm:1.0 in_axi BID";
  attribute X_INTERFACE_INFO of in_axi_bready : signal is "xilinx.com:interface:aximm:1.0 in_axi BREADY";
  attribute X_INTERFACE_INFO of in_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 in_axi BRESP";
  attribute X_INTERFACE_INFO of in_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 in_axi BVALID";
  attribute X_INTERFACE_INFO of in_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 in_axi RDATA";
  attribute X_INTERFACE_INFO of in_axi_rid : signal is "xilinx.com:interface:aximm:1.0 in_axi RID";
  attribute X_INTERFACE_INFO of in_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 in_axi RLAST";
  attribute X_INTERFACE_INFO of in_axi_rready : signal is "xilinx.com:interface:aximm:1.0 in_axi RREADY";
  attribute X_INTERFACE_INFO of in_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 in_axi RRESP";
  attribute X_INTERFACE_INFO of in_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 in_axi RVALID";
  attribute X_INTERFACE_INFO of in_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 in_axi WDATA";
  attribute X_INTERFACE_INFO of in_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 in_axi WLAST";
  attribute X_INTERFACE_INFO of in_axi_wready : signal is "xilinx.com:interface:aximm:1.0 in_axi WREADY";
  attribute X_INTERFACE_INFO of in_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 in_axi WSTRB";
  attribute X_INTERFACE_INFO of in_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 in_axi WVALID";
  attribute X_INTERFACE_INFO of in_axilite_araddr : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_PARAMETER of in_axilite_araddr : signal is "XIL_INTERFACENAME in_axilite, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of in_axilite_arprot : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_awaddr : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_awprot : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_bresp : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_rdata : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_rresp : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_wdata : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of in_axilite_wstrb : signal is "xilinx.com:interface:aximm:1.0 in_axilite ";
  attribute X_INTERFACE_INFO of out0_axilite_araddr : signal is "xilinx.com:interface:aximm:1.0 out0_axilite ARADDR";
  attribute X_INTERFACE_PARAMETER of out0_axilite_araddr : signal is "XIL_INTERFACENAME out0_axilite, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of out0_axilite_arprot : signal is "xilinx.com:interface:aximm:1.0 out0_axilite ARPROT";
  attribute X_INTERFACE_INFO of out0_axilite_awaddr : signal is "xilinx.com:interface:aximm:1.0 out0_axilite AWADDR";
  attribute X_INTERFACE_INFO of out0_axilite_awprot : signal is "xilinx.com:interface:aximm:1.0 out0_axilite AWPROT";
  attribute X_INTERFACE_INFO of out0_axilite_bresp : signal is "xilinx.com:interface:aximm:1.0 out0_axilite BRESP";
  attribute X_INTERFACE_INFO of out0_axilite_rdata : signal is "xilinx.com:interface:aximm:1.0 out0_axilite RDATA";
  attribute X_INTERFACE_INFO of out0_axilite_rresp : signal is "xilinx.com:interface:aximm:1.0 out0_axilite RRESP";
  attribute X_INTERFACE_INFO of out0_axilite_wdata : signal is "xilinx.com:interface:aximm:1.0 out0_axilite WDATA";
  attribute X_INTERFACE_INFO of out0_axilite_wstrb : signal is "xilinx.com:interface:aximm:1.0 out0_axilite WSTRB";
  attribute X_INTERFACE_INFO of out1_axilite_araddr : signal is "xilinx.com:interface:aximm:1.0 out1_axilite ARADDR";
  attribute X_INTERFACE_PARAMETER of out1_axilite_araddr : signal is "XIL_INTERFACENAME out1_axilite, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of out1_axilite_arprot : signal is "xilinx.com:interface:aximm:1.0 out1_axilite ARPROT";
  attribute X_INTERFACE_INFO of out1_axilite_awaddr : signal is "xilinx.com:interface:aximm:1.0 out1_axilite AWADDR";
  attribute X_INTERFACE_INFO of out1_axilite_awprot : signal is "xilinx.com:interface:aximm:1.0 out1_axilite AWPROT";
  attribute X_INTERFACE_INFO of out1_axilite_bresp : signal is "xilinx.com:interface:aximm:1.0 out1_axilite BRESP";
  attribute X_INTERFACE_INFO of out1_axilite_rdata : signal is "xilinx.com:interface:aximm:1.0 out1_axilite RDATA";
  attribute X_INTERFACE_INFO of out1_axilite_rresp : signal is "xilinx.com:interface:aximm:1.0 out1_axilite RRESP";
  attribute X_INTERFACE_INFO of out1_axilite_wdata : signal is "xilinx.com:interface:aximm:1.0 out1_axilite WDATA";
  attribute X_INTERFACE_INFO of out1_axilite_wstrb : signal is "xilinx.com:interface:aximm:1.0 out1_axilite WSTRB";
  attribute X_INTERFACE_INFO of out_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 out_axi ARADDR";
  attribute X_INTERFACE_PARAMETER of out_axi_araddr : signal is "XIL_INTERFACENAME out_axi, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_ACLK_0, DATA_WIDTH 32, FREQ_HZ 10000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 4, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of out_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 out_axi ARBURST";
  attribute X_INTERFACE_INFO of out_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 out_axi ARCACHE";
  attribute X_INTERFACE_INFO of out_axi_arid : signal is "xilinx.com:interface:aximm:1.0 out_axi ARID";
  attribute X_INTERFACE_INFO of out_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 out_axi ARLEN";
  attribute X_INTERFACE_INFO of out_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 out_axi ARLOCK";
  attribute X_INTERFACE_INFO of out_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 out_axi ARPROT";
  attribute X_INTERFACE_INFO of out_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 out_axi ARQOS";
  attribute X_INTERFACE_INFO of out_axi_arready : signal is "xilinx.com:interface:aximm:1.0 out_axi ARREADY";
  attribute X_INTERFACE_INFO of out_axi_arregion : signal is "xilinx.com:interface:aximm:1.0 out_axi ARREGION";
  attribute X_INTERFACE_INFO of out_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 out_axi ARSIZE";
  attribute X_INTERFACE_INFO of out_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 out_axi ARVALID";
  attribute X_INTERFACE_INFO of out_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 out_axi AWADDR";
  attribute X_INTERFACE_INFO of out_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 out_axi AWBURST";
  attribute X_INTERFACE_INFO of out_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 out_axi AWCACHE";
  attribute X_INTERFACE_INFO of out_axi_awid : signal is "xilinx.com:interface:aximm:1.0 out_axi AWID";
  attribute X_INTERFACE_INFO of out_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 out_axi AWLEN";
  attribute X_INTERFACE_INFO of out_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 out_axi AWLOCK";
  attribute X_INTERFACE_INFO of out_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 out_axi AWPROT";
  attribute X_INTERFACE_INFO of out_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 out_axi AWQOS";
  attribute X_INTERFACE_INFO of out_axi_awready : signal is "xilinx.com:interface:aximm:1.0 out_axi AWREADY";
  attribute X_INTERFACE_INFO of out_axi_awregion : signal is "xilinx.com:interface:aximm:1.0 out_axi AWREGION";
  attribute X_INTERFACE_INFO of out_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 out_axi AWSIZE";
  attribute X_INTERFACE_INFO of out_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 out_axi AWVALID";
  attribute X_INTERFACE_INFO of out_axi_bid : signal is "xilinx.com:interface:aximm:1.0 out_axi BID";
  attribute X_INTERFACE_INFO of out_axi_bready : signal is "xilinx.com:interface:aximm:1.0 out_axi BREADY";
  attribute X_INTERFACE_INFO of out_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 out_axi BRESP";
  attribute X_INTERFACE_INFO of out_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 out_axi BVALID";
  attribute X_INTERFACE_INFO of out_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 out_axi RDATA";
  attribute X_INTERFACE_INFO of out_axi_rid : signal is "xilinx.com:interface:aximm:1.0 out_axi RID";
  attribute X_INTERFACE_INFO of out_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 out_axi RLAST";
  attribute X_INTERFACE_INFO of out_axi_rready : signal is "xilinx.com:interface:aximm:1.0 out_axi RREADY";
  attribute X_INTERFACE_INFO of out_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 out_axi RRESP";
  attribute X_INTERFACE_INFO of out_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 out_axi RVALID";
  attribute X_INTERFACE_INFO of out_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 out_axi WDATA";
  attribute X_INTERFACE_INFO of out_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 out_axi WLAST";
  attribute X_INTERFACE_INFO of out_axi_wready : signal is "xilinx.com:interface:aximm:1.0 out_axi WREADY";
  attribute X_INTERFACE_INFO of out_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 out_axi WSTRB";
  attribute X_INTERFACE_INFO of out_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 out_axi WVALID";
begin
  ACLK_0_1 <= aclk;
  S00_AXI_0_1_ARADDR(31 downto 0) <= in_axi_araddr(31 downto 0);
  S00_AXI_0_1_ARBURST(1 downto 0) <= in_axi_arburst(1 downto 0);
  S00_AXI_0_1_ARCACHE(3 downto 0) <= in_axi_arcache(3 downto 0);
  S00_AXI_0_1_ARID(3 downto 0) <= in_axi_arid(3 downto 0);
  S00_AXI_0_1_ARLEN(7 downto 0) <= in_axi_arlen(7 downto 0);
  S00_AXI_0_1_ARLOCK(0) <= in_axi_arlock(0);
  S00_AXI_0_1_ARPROT(2 downto 0) <= in_axi_arprot(2 downto 0);
  S00_AXI_0_1_ARQOS(3 downto 0) <= in_axi_arqos(3 downto 0);
  S00_AXI_0_1_ARSIZE(2 downto 0) <= in_axi_arsize(2 downto 0);
  S00_AXI_0_1_ARVALID(0) <= in_axi_arvalid(0);
  S00_AXI_0_1_AWADDR(31 downto 0) <= in_axi_awaddr(31 downto 0);
  S00_AXI_0_1_AWBURST(1 downto 0) <= in_axi_awburst(1 downto 0);
  S00_AXI_0_1_AWCACHE(3 downto 0) <= in_axi_awcache(3 downto 0);
  S00_AXI_0_1_AWID(3 downto 0) <= in_axi_awid(3 downto 0);
  S00_AXI_0_1_AWLEN(7 downto 0) <= in_axi_awlen(7 downto 0);
  S00_AXI_0_1_AWLOCK(0) <= in_axi_awlock(0);
  S00_AXI_0_1_AWPROT(2 downto 0) <= in_axi_awprot(2 downto 0);
  S00_AXI_0_1_AWQOS(3 downto 0) <= in_axi_awqos(3 downto 0);
  S00_AXI_0_1_AWSIZE(2 downto 0) <= in_axi_awsize(2 downto 0);
  S00_AXI_0_1_AWVALID(0) <= in_axi_awvalid(0);
  S00_AXI_0_1_BREADY(0) <= in_axi_bready(0);
  S00_AXI_0_1_RREADY(0) <= in_axi_rready(0);
  S00_AXI_0_1_WDATA(31 downto 0) <= in_axi_wdata(31 downto 0);
  S00_AXI_0_1_WLAST(0) <= in_axi_wlast(0);
  S00_AXI_0_1_WSTRB(3 downto 0) <= in_axi_wstrb(3 downto 0);
  S00_AXI_0_1_WVALID(0) <= in_axi_wvalid(0);
  S01_AXI_0_1_ARADDR(31 downto 0) <= in_axilite_araddr(31 downto 0);
  S01_AXI_0_1_ARPROT(2 downto 0) <= in_axilite_arprot(2 downto 0);
  S01_AXI_0_1_ARVALID <= in_axilite_arvalid;
  S01_AXI_0_1_AWADDR(31 downto 0) <= in_axilite_awaddr(31 downto 0);
  S01_AXI_0_1_AWPROT(2 downto 0) <= in_axilite_awprot(2 downto 0);
  S01_AXI_0_1_AWVALID <= in_axilite_awvalid;
  S01_AXI_0_1_BREADY <= in_axilite_bready;
  S01_AXI_0_1_RREADY <= in_axilite_rready;
  S01_AXI_0_1_WDATA(31 downto 0) <= in_axilite_wdata(31 downto 0);
  S01_AXI_0_1_WSTRB(3 downto 0) <= in_axilite_wstrb(3 downto 0);
  S01_AXI_0_1_WVALID <= in_axilite_wvalid;
  aresetn_1 <= aresetn;
  axi_data_fifo_0_M_AXI_ARREADY <= fifo_out_axilite_arready;
  axi_data_fifo_0_M_AXI_AWREADY <= fifo_out_axilite_awready;
  axi_data_fifo_0_M_AXI_BRESP(1 downto 0) <= fifo_out_axilite_bresp(1 downto 0);
  axi_data_fifo_0_M_AXI_BVALID <= fifo_out_axilite_bvalid;
  axi_data_fifo_0_M_AXI_RDATA(31 downto 0) <= fifo_out_axilite_rdata(31 downto 0);
  axi_data_fifo_0_M_AXI_RRESP(1 downto 0) <= fifo_out_axilite_rresp(1 downto 0);
  axi_data_fifo_0_M_AXI_RVALID <= fifo_out_axilite_rvalid;
  axi_data_fifo_0_M_AXI_WREADY <= fifo_out_axilite_wready;
  axi_data_fifo_1_M_AXI_ARREADY <= fifo_out_axi_arready;
  axi_data_fifo_1_M_AXI_AWREADY <= fifo_out_axi_awready;
  axi_data_fifo_1_M_AXI_BID(3 downto 0) <= fifo_out_axi_bid(3 downto 0);
  axi_data_fifo_1_M_AXI_BRESP(1 downto 0) <= fifo_out_axi_bresp(1 downto 0);
  axi_data_fifo_1_M_AXI_BVALID <= fifo_out_axi_bvalid;
  axi_data_fifo_1_M_AXI_RDATA(31 downto 0) <= fifo_out_axi_rdata(31 downto 0);
  axi_data_fifo_1_M_AXI_RID(3 downto 0) <= fifo_out_axi_rid(3 downto 0);
  axi_data_fifo_1_M_AXI_RLAST <= fifo_out_axi_rlast;
  axi_data_fifo_1_M_AXI_RRESP(1 downto 0) <= fifo_out_axi_rresp(1 downto 0);
  axi_data_fifo_1_M_AXI_RVALID <= fifo_out_axi_rvalid;
  axi_data_fifo_1_M_AXI_WREADY <= fifo_out_axi_wready;
  axi_interconnect_0_M03_AXI_ARREADY <= out0_axilite_arready;
  axi_interconnect_0_M03_AXI_AWREADY <= out0_axilite_awready;
  axi_interconnect_0_M03_AXI_BRESP(1 downto 0) <= out0_axilite_bresp(1 downto 0);
  axi_interconnect_0_M03_AXI_BVALID <= out0_axilite_bvalid;
  axi_interconnect_0_M03_AXI_RDATA(31 downto 0) <= out0_axilite_rdata(31 downto 0);
  axi_interconnect_0_M03_AXI_RRESP(1 downto 0) <= out0_axilite_rresp(1 downto 0);
  axi_interconnect_0_M03_AXI_RVALID <= out0_axilite_rvalid;
  axi_interconnect_0_M03_AXI_WREADY <= out0_axilite_wready;
  axi_interconnect_0_M04_AXI_ARREADY <= out1_axilite_arready;
  axi_interconnect_0_M04_AXI_AWREADY <= out1_axilite_awready;
  axi_interconnect_0_M04_AXI_BRESP(1 downto 0) <= out1_axilite_bresp(1 downto 0);
  axi_interconnect_0_M04_AXI_BVALID <= out1_axilite_bvalid;
  axi_interconnect_0_M04_AXI_RDATA(31 downto 0) <= out1_axilite_rdata(31 downto 0);
  axi_interconnect_0_M04_AXI_RRESP(1 downto 0) <= out1_axilite_rresp(1 downto 0);
  axi_interconnect_0_M04_AXI_RVALID <= out1_axilite_rvalid;
  axi_interconnect_0_M04_AXI_WREADY <= out1_axilite_wready;
  axi_interconnect_0_M05_AXI_ARREADY(0) <= out_axi_arready(0);
  axi_interconnect_0_M05_AXI_AWREADY(0) <= out_axi_awready(0);
  axi_interconnect_0_M05_AXI_BID(3 downto 0) <= out_axi_bid(3 downto 0);
  axi_interconnect_0_M05_AXI_BRESP(1 downto 0) <= out_axi_bresp(1 downto 0);
  axi_interconnect_0_M05_AXI_BVALID(0) <= out_axi_bvalid(0);
  axi_interconnect_0_M05_AXI_RDATA(31 downto 0) <= out_axi_rdata(31 downto 0);
  axi_interconnect_0_M05_AXI_RID(3 downto 0) <= out_axi_rid(3 downto 0);
  axi_interconnect_0_M05_AXI_RLAST(0) <= out_axi_rlast(0);
  axi_interconnect_0_M05_AXI_RRESP(1 downto 0) <= out_axi_rresp(1 downto 0);
  axi_interconnect_0_M05_AXI_RVALID(0) <= out_axi_rvalid(0);
  axi_interconnect_0_M05_AXI_WREADY(0) <= out_axi_wready(0);
  fifo_out_axi_araddr(31 downto 0) <= axi_data_fifo_1_M_AXI_ARADDR(31 downto 0);
  fifo_out_axi_arburst(1 downto 0) <= axi_data_fifo_1_M_AXI_ARBURST(1 downto 0);
  fifo_out_axi_arcache(3 downto 0) <= axi_data_fifo_1_M_AXI_ARCACHE(3 downto 0);
  fifo_out_axi_arid(3 downto 0) <= axi_data_fifo_1_M_AXI_ARID(3 downto 0);
  fifo_out_axi_arlen(7 downto 0) <= axi_data_fifo_1_M_AXI_ARLEN(7 downto 0);
  fifo_out_axi_arlock(0) <= axi_data_fifo_1_M_AXI_ARLOCK(0);
  fifo_out_axi_arprot(2 downto 0) <= axi_data_fifo_1_M_AXI_ARPROT(2 downto 0);
  fifo_out_axi_arqos(3 downto 0) <= axi_data_fifo_1_M_AXI_ARQOS(3 downto 0);
  fifo_out_axi_arregion(3 downto 0) <= axi_data_fifo_1_M_AXI_ARREGION(3 downto 0);
  fifo_out_axi_arsize(2 downto 0) <= axi_data_fifo_1_M_AXI_ARSIZE(2 downto 0);
  fifo_out_axi_arvalid <= axi_data_fifo_1_M_AXI_ARVALID;
  fifo_out_axi_awaddr(31 downto 0) <= axi_data_fifo_1_M_AXI_AWADDR(31 downto 0);
  fifo_out_axi_awburst(1 downto 0) <= axi_data_fifo_1_M_AXI_AWBURST(1 downto 0);
  fifo_out_axi_awcache(3 downto 0) <= axi_data_fifo_1_M_AXI_AWCACHE(3 downto 0);
  fifo_out_axi_awid(3 downto 0) <= axi_data_fifo_1_M_AXI_AWID(3 downto 0);
  fifo_out_axi_awlen(7 downto 0) <= axi_data_fifo_1_M_AXI_AWLEN(7 downto 0);
  fifo_out_axi_awlock(0) <= axi_data_fifo_1_M_AXI_AWLOCK(0);
  fifo_out_axi_awprot(2 downto 0) <= axi_data_fifo_1_M_AXI_AWPROT(2 downto 0);
  fifo_out_axi_awqos(3 downto 0) <= axi_data_fifo_1_M_AXI_AWQOS(3 downto 0);
  fifo_out_axi_awregion(3 downto 0) <= axi_data_fifo_1_M_AXI_AWREGION(3 downto 0);
  fifo_out_axi_awsize(2 downto 0) <= axi_data_fifo_1_M_AXI_AWSIZE(2 downto 0);
  fifo_out_axi_awvalid <= axi_data_fifo_1_M_AXI_AWVALID;
  fifo_out_axi_bready <= axi_data_fifo_1_M_AXI_BREADY;
  fifo_out_axi_rready <= axi_data_fifo_1_M_AXI_RREADY;
  fifo_out_axi_wdata(31 downto 0) <= axi_data_fifo_1_M_AXI_WDATA(31 downto 0);
  fifo_out_axi_wlast <= axi_data_fifo_1_M_AXI_WLAST;
  fifo_out_axi_wstrb(3 downto 0) <= axi_data_fifo_1_M_AXI_WSTRB(3 downto 0);
  fifo_out_axi_wvalid <= axi_data_fifo_1_M_AXI_WVALID;
  fifo_out_axilite_araddr(31 downto 0) <= axi_data_fifo_0_M_AXI_ARADDR(31 downto 0);
  fifo_out_axilite_arprot(2 downto 0) <= axi_data_fifo_0_M_AXI_ARPROT(2 downto 0);
  fifo_out_axilite_arvalid <= axi_data_fifo_0_M_AXI_ARVALID;
  fifo_out_axilite_awaddr(31 downto 0) <= axi_data_fifo_0_M_AXI_AWADDR(31 downto 0);
  fifo_out_axilite_awprot(2 downto 0) <= axi_data_fifo_0_M_AXI_AWPROT(2 downto 0);
  fifo_out_axilite_awvalid <= axi_data_fifo_0_M_AXI_AWVALID;
  fifo_out_axilite_bready <= axi_data_fifo_0_M_AXI_BREADY;
  fifo_out_axilite_rready <= axi_data_fifo_0_M_AXI_RREADY;
  fifo_out_axilite_wdata(31 downto 0) <= axi_data_fifo_0_M_AXI_WDATA(31 downto 0);
  fifo_out_axilite_wstrb(3 downto 0) <= axi_data_fifo_0_M_AXI_WSTRB(3 downto 0);
  fifo_out_axilite_wvalid <= axi_data_fifo_0_M_AXI_WVALID;
  in_axi_arready(0) <= S00_AXI_0_1_ARREADY(0);
  in_axi_awready(0) <= S00_AXI_0_1_AWREADY(0);
  in_axi_bid(3 downto 0) <= S00_AXI_0_1_BID(3 downto 0);
  in_axi_bresp(1 downto 0) <= S00_AXI_0_1_BRESP(1 downto 0);
  in_axi_bvalid(0) <= S00_AXI_0_1_BVALID(0);
  in_axi_rdata(31 downto 0) <= S00_AXI_0_1_RDATA(31 downto 0);
  in_axi_rid(3 downto 0) <= S00_AXI_0_1_RID(3 downto 0);
  in_axi_rlast(0) <= S00_AXI_0_1_RLAST(0);
  in_axi_rresp(1 downto 0) <= S00_AXI_0_1_RRESP(1 downto 0);
  in_axi_rvalid(0) <= S00_AXI_0_1_RVALID(0);
  in_axi_wready(0) <= S00_AXI_0_1_WREADY(0);
  in_axilite_arready <= S01_AXI_0_1_ARREADY;
  in_axilite_awready <= S01_AXI_0_1_AWREADY;
  in_axilite_bresp(1 downto 0) <= S01_AXI_0_1_BRESP(1 downto 0);
  in_axilite_bvalid <= S01_AXI_0_1_BVALID;
  in_axilite_rdata(31 downto 0) <= S01_AXI_0_1_RDATA(31 downto 0);
  in_axilite_rresp(1 downto 0) <= S01_AXI_0_1_RRESP(1 downto 0);
  in_axilite_rvalid <= S01_AXI_0_1_RVALID;
  in_axilite_wready <= S01_AXI_0_1_WREADY;
  out0_axilite_araddr(31 downto 0) <= axi_interconnect_0_M03_AXI_ARADDR(31 downto 0);
  out0_axilite_arprot(2 downto 0) <= axi_interconnect_0_M03_AXI_ARPROT(2 downto 0);
  out0_axilite_arvalid <= axi_interconnect_0_M03_AXI_ARVALID;
  out0_axilite_awaddr(31 downto 0) <= axi_interconnect_0_M03_AXI_AWADDR(31 downto 0);
  out0_axilite_awprot(2 downto 0) <= axi_interconnect_0_M03_AXI_AWPROT(2 downto 0);
  out0_axilite_awvalid <= axi_interconnect_0_M03_AXI_AWVALID;
  out0_axilite_bready <= axi_interconnect_0_M03_AXI_BREADY;
  out0_axilite_rready <= axi_interconnect_0_M03_AXI_RREADY;
  out0_axilite_wdata(31 downto 0) <= axi_interconnect_0_M03_AXI_WDATA(31 downto 0);
  out0_axilite_wstrb(3 downto 0) <= axi_interconnect_0_M03_AXI_WSTRB(3 downto 0);
  out0_axilite_wvalid <= axi_interconnect_0_M03_AXI_WVALID;
  out1_axilite_araddr(31 downto 0) <= axi_interconnect_0_M04_AXI_ARADDR(31 downto 0);
  out1_axilite_arprot(2 downto 0) <= axi_interconnect_0_M04_AXI_ARPROT(2 downto 0);
  out1_axilite_arvalid <= axi_interconnect_0_M04_AXI_ARVALID;
  out1_axilite_awaddr(31 downto 0) <= axi_interconnect_0_M04_AXI_AWADDR(31 downto 0);
  out1_axilite_awprot(2 downto 0) <= axi_interconnect_0_M04_AXI_AWPROT(2 downto 0);
  out1_axilite_awvalid <= axi_interconnect_0_M04_AXI_AWVALID;
  out1_axilite_bready <= axi_interconnect_0_M04_AXI_BREADY;
  out1_axilite_rready <= axi_interconnect_0_M04_AXI_RREADY;
  out1_axilite_wdata(31 downto 0) <= axi_interconnect_0_M04_AXI_WDATA(31 downto 0);
  out1_axilite_wstrb(3 downto 0) <= axi_interconnect_0_M04_AXI_WSTRB(3 downto 0);
  out1_axilite_wvalid <= axi_interconnect_0_M04_AXI_WVALID;
  out_axi_araddr(31 downto 0) <= axi_interconnect_0_M05_AXI_ARADDR(31 downto 0);
  out_axi_arburst(1 downto 0) <= axi_interconnect_0_M05_AXI_ARBURST(1 downto 0);
  out_axi_arcache(3 downto 0) <= axi_interconnect_0_M05_AXI_ARCACHE(3 downto 0);
  out_axi_arid(3 downto 0) <= axi_interconnect_0_M05_AXI_ARID(3 downto 0);
  out_axi_arlen(7 downto 0) <= axi_interconnect_0_M05_AXI_ARLEN(7 downto 0);
  out_axi_arlock(0) <= axi_interconnect_0_M05_AXI_ARLOCK(0);
  out_axi_arprot(2 downto 0) <= axi_interconnect_0_M05_AXI_ARPROT(2 downto 0);
  out_axi_arqos(3 downto 0) <= axi_interconnect_0_M05_AXI_ARQOS(3 downto 0);
  out_axi_arregion(3 downto 0) <= axi_interconnect_0_M05_AXI_ARREGION(3 downto 0);
  out_axi_arsize(2 downto 0) <= axi_interconnect_0_M05_AXI_ARSIZE(2 downto 0);
  out_axi_arvalid(0) <= axi_interconnect_0_M05_AXI_ARVALID(0);
  out_axi_awaddr(31 downto 0) <= axi_interconnect_0_M05_AXI_AWADDR(31 downto 0);
  out_axi_awburst(1 downto 0) <= axi_interconnect_0_M05_AXI_AWBURST(1 downto 0);
  out_axi_awcache(3 downto 0) <= axi_interconnect_0_M05_AXI_AWCACHE(3 downto 0);
  out_axi_awid(3 downto 0) <= axi_interconnect_0_M05_AXI_AWID(3 downto 0);
  out_axi_awlen(7 downto 0) <= axi_interconnect_0_M05_AXI_AWLEN(7 downto 0);
  out_axi_awlock(0) <= axi_interconnect_0_M05_AXI_AWLOCK(0);
  out_axi_awprot(2 downto 0) <= axi_interconnect_0_M05_AXI_AWPROT(2 downto 0);
  out_axi_awqos(3 downto 0) <= axi_interconnect_0_M05_AXI_AWQOS(3 downto 0);
  out_axi_awregion(3 downto 0) <= axi_interconnect_0_M05_AXI_AWREGION(3 downto 0);
  out_axi_awsize(2 downto 0) <= axi_interconnect_0_M05_AXI_AWSIZE(2 downto 0);
  out_axi_awvalid(0) <= axi_interconnect_0_M05_AXI_AWVALID(0);
  out_axi_bready(0) <= axi_interconnect_0_M05_AXI_BREADY(0);
  out_axi_rready(0) <= axi_interconnect_0_M05_AXI_RREADY(0);
  out_axi_wdata(31 downto 0) <= axi_interconnect_0_M05_AXI_WDATA(31 downto 0);
  out_axi_wlast(0) <= axi_interconnect_0_M05_AXI_WLAST(0);
  out_axi_wstrb(3 downto 0) <= axi_interconnect_0_M05_AXI_WSTRB(3 downto 0);
  out_axi_wvalid(0) <= axi_interconnect_0_M05_AXI_WVALID(0);
axi_data_fifo: component design_1_axi_data_fifo_1_0
     port map (
      aclk => ACLK_0_1,
      aresetn => rst_aclk_10M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_data_fifo_1_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_data_fifo_1_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_data_fifo_1_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(3 downto 0) => axi_data_fifo_1_M_AXI_ARID(3 downto 0),
      m_axi_arlen(7 downto 0) => axi_data_fifo_1_M_AXI_ARLEN(7 downto 0),
      m_axi_arlock(0) => axi_data_fifo_1_M_AXI_ARLOCK(0),
      m_axi_arprot(2 downto 0) => axi_data_fifo_1_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_data_fifo_1_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_data_fifo_1_M_AXI_ARREADY,
      m_axi_arregion(3 downto 0) => axi_data_fifo_1_M_AXI_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => axi_data_fifo_1_M_AXI_ARSIZE(2 downto 0),
      m_axi_arvalid => axi_data_fifo_1_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_data_fifo_1_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_data_fifo_1_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_data_fifo_1_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(3 downto 0) => axi_data_fifo_1_M_AXI_AWID(3 downto 0),
      m_axi_awlen(7 downto 0) => axi_data_fifo_1_M_AXI_AWLEN(7 downto 0),
      m_axi_awlock(0) => axi_data_fifo_1_M_AXI_AWLOCK(0),
      m_axi_awprot(2 downto 0) => axi_data_fifo_1_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_data_fifo_1_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_data_fifo_1_M_AXI_AWREADY,
      m_axi_awregion(3 downto 0) => axi_data_fifo_1_M_AXI_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => axi_data_fifo_1_M_AXI_AWSIZE(2 downto 0),
      m_axi_awvalid => axi_data_fifo_1_M_AXI_AWVALID,
      m_axi_bid(3 downto 0) => axi_data_fifo_1_M_AXI_BID(3 downto 0),
      m_axi_bready => axi_data_fifo_1_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_data_fifo_1_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_data_fifo_1_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => axi_data_fifo_1_M_AXI_RDATA(31 downto 0),
      m_axi_rid(3 downto 0) => axi_data_fifo_1_M_AXI_RID(3 downto 0),
      m_axi_rlast => axi_data_fifo_1_M_AXI_RLAST,
      m_axi_rready => axi_data_fifo_1_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_data_fifo_1_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_data_fifo_1_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => axi_data_fifo_1_M_AXI_WDATA(31 downto 0),
      m_axi_wlast => axi_data_fifo_1_M_AXI_WLAST,
      m_axi_wready => axi_data_fifo_1_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => axi_data_fifo_1_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => axi_data_fifo_1_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => axi_interconnect_0_M01_AXI_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => axi_interconnect_0_M01_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_interconnect_0_M01_AXI_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => axi_interconnect_0_M01_AXI_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => axi_interconnect_0_M01_AXI_ARLEN(7 downto 0),
      s_axi_arlock(0) => axi_interconnect_0_M01_AXI_ARLOCK(0),
      s_axi_arprot(2 downto 0) => axi_interconnect_0_M01_AXI_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => axi_interconnect_0_M01_AXI_ARQOS(3 downto 0),
      s_axi_arready => axi_interconnect_0_M01_AXI_ARREADY,
      s_axi_arregion(3 downto 0) => axi_interconnect_0_M01_AXI_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => axi_interconnect_0_M01_AXI_ARSIZE(2 downto 0),
      s_axi_arvalid => axi_interconnect_0_M01_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => axi_interconnect_0_M01_AXI_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => axi_interconnect_0_M01_AXI_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => axi_interconnect_0_M01_AXI_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => axi_interconnect_0_M01_AXI_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => axi_interconnect_0_M01_AXI_AWLEN(7 downto 0),
      s_axi_awlock(0) => axi_interconnect_0_M01_AXI_AWLOCK(0),
      s_axi_awprot(2 downto 0) => axi_interconnect_0_M01_AXI_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => axi_interconnect_0_M01_AXI_AWQOS(3 downto 0),
      s_axi_awready => axi_interconnect_0_M01_AXI_AWREADY,
      s_axi_awregion(3 downto 0) => axi_interconnect_0_M01_AXI_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => axi_interconnect_0_M01_AXI_AWSIZE(2 downto 0),
      s_axi_awvalid => axi_interconnect_0_M01_AXI_AWVALID,
      s_axi_bid(3 downto 0) => axi_interconnect_0_M01_AXI_BID(3 downto 0),
      s_axi_bready => axi_interconnect_0_M01_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_interconnect_0_M01_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_interconnect_0_M01_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_interconnect_0_M01_AXI_RDATA(31 downto 0),
      s_axi_rid(3 downto 0) => axi_interconnect_0_M01_AXI_RID(3 downto 0),
      s_axi_rlast => axi_interconnect_0_M01_AXI_RLAST,
      s_axi_rready => axi_interconnect_0_M01_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_interconnect_0_M01_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_interconnect_0_M01_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_interconnect_0_M01_AXI_WDATA(31 downto 0),
      s_axi_wlast => axi_interconnect_0_M01_AXI_WLAST,
      s_axi_wready => axi_interconnect_0_M01_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_interconnect_0_M01_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_interconnect_0_M01_AXI_WVALID
    );
axi_dma: component design_1_axi_dma_0_0
     port map (
      axi_resetn => rst_aclk_10M_peripheral_aresetn(0),
      m_axi_mm2s_aclk => ACLK_0_1,
      m_axi_mm2s_araddr(31 downto 0) => axi_dma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_dma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_dma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_dma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_dma_0_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => axi_dma_0_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(31 downto 0) => axi_dma_0_M_AXI_MM2S_RDATA(31 downto 0),
      m_axi_mm2s_rlast => axi_dma_0_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_dma_0_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_dma_0_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_dma_0_M_AXI_MM2S_RVALID,
      m_axi_s2mm_aclk => ACLK_0_1,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      m_axis_mm2s_tdata(31 downto 0) => axi_dma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      m_axis_mm2s_tkeep(3 downto 0) => axi_dma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      m_axis_mm2s_tlast => axi_dma_0_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => axi_dma_0_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tvalid => axi_dma_0_M_AXIS_MM2S_TVALID,
      mm2s_introut => NLW_axi_dma_mm2s_introut_UNCONNECTED,
      mm2s_prmry_reset_out_n => NLW_axi_dma_mm2s_prmry_reset_out_n_UNCONNECTED,
      s2mm_introut => NLW_axi_dma_s2mm_introut_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_dma_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => ACLK_0_1,
      s_axi_lite_araddr(9 downto 0) => axi_interconnect_0_M02_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => axi_interconnect_0_M02_AXI_ARREADY,
      s_axi_lite_arvalid => axi_interconnect_0_M02_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => axi_interconnect_0_M02_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => axi_interconnect_0_M02_AXI_AWREADY,
      s_axi_lite_awvalid => axi_interconnect_0_M02_AXI_AWVALID,
      s_axi_lite_bready => axi_interconnect_0_M02_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => axi_interconnect_0_M02_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => axi_interconnect_0_M02_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => axi_interconnect_0_M02_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => axi_interconnect_0_M02_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => axi_interconnect_0_M02_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => axi_interconnect_0_M02_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => axi_interconnect_0_M02_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => axi_interconnect_0_M02_AXI_WREADY,
      s_axi_lite_wvalid => axi_interconnect_0_M02_AXI_WVALID,
      s_axis_s2mm_tdata(31 downto 0) => axi_dma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => axi_dma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      s_axis_s2mm_tlast => axi_dma_0_M_AXIS_MM2S_TLAST,
      s_axis_s2mm_tready => axi_dma_0_M_AXIS_MM2S_TREADY,
      s_axis_s2mm_tvalid => axi_dma_0_M_AXIS_MM2S_TVALID
    );
axi_interconnect: entity work.design_1_axi_interconnect_0_0
     port map (
      ACLK => ACLK_0_1,
      ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M00_ACLK => ACLK_0_1,
      M00_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => axi_interconnect_0_M00_AXI_ARREADY,
      M00_AXI_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => axi_interconnect_0_M00_AXI_AWREADY,
      M00_AXI_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      M00_AXI_bready => axi_interconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => axi_interconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => axi_interconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => axi_interconnect_0_M00_AXI_WVALID,
      M01_ACLK => ACLK_0_1,
      M01_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M01_AXI_araddr(31 downto 0) => axi_interconnect_0_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arburst(1 downto 0) => axi_interconnect_0_M01_AXI_ARBURST(1 downto 0),
      M01_AXI_arcache(3 downto 0) => axi_interconnect_0_M01_AXI_ARCACHE(3 downto 0),
      M01_AXI_arid(3 downto 0) => axi_interconnect_0_M01_AXI_ARID(3 downto 0),
      M01_AXI_arlen(7 downto 0) => axi_interconnect_0_M01_AXI_ARLEN(7 downto 0),
      M01_AXI_arlock(0) => axi_interconnect_0_M01_AXI_ARLOCK(0),
      M01_AXI_arprot(2 downto 0) => axi_interconnect_0_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arqos(3 downto 0) => axi_interconnect_0_M01_AXI_ARQOS(3 downto 0),
      M01_AXI_arready => axi_interconnect_0_M01_AXI_ARREADY,
      M01_AXI_arregion(3 downto 0) => axi_interconnect_0_M01_AXI_ARREGION(3 downto 0),
      M01_AXI_arsize(2 downto 0) => axi_interconnect_0_M01_AXI_ARSIZE(2 downto 0),
      M01_AXI_arvalid => axi_interconnect_0_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => axi_interconnect_0_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awburst(1 downto 0) => axi_interconnect_0_M01_AXI_AWBURST(1 downto 0),
      M01_AXI_awcache(3 downto 0) => axi_interconnect_0_M01_AXI_AWCACHE(3 downto 0),
      M01_AXI_awid(3 downto 0) => axi_interconnect_0_M01_AXI_AWID(3 downto 0),
      M01_AXI_awlen(7 downto 0) => axi_interconnect_0_M01_AXI_AWLEN(7 downto 0),
      M01_AXI_awlock(0) => axi_interconnect_0_M01_AXI_AWLOCK(0),
      M01_AXI_awprot(2 downto 0) => axi_interconnect_0_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awqos(3 downto 0) => axi_interconnect_0_M01_AXI_AWQOS(3 downto 0),
      M01_AXI_awready => axi_interconnect_0_M01_AXI_AWREADY,
      M01_AXI_awregion(3 downto 0) => axi_interconnect_0_M01_AXI_AWREGION(3 downto 0),
      M01_AXI_awsize(2 downto 0) => axi_interconnect_0_M01_AXI_AWSIZE(2 downto 0),
      M01_AXI_awvalid => axi_interconnect_0_M01_AXI_AWVALID,
      M01_AXI_bid(3 downto 0) => axi_interconnect_0_M01_AXI_BID(3 downto 0),
      M01_AXI_bready => axi_interconnect_0_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => axi_interconnect_0_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => axi_interconnect_0_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => axi_interconnect_0_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rid(3 downto 0) => axi_interconnect_0_M01_AXI_RID(3 downto 0),
      M01_AXI_rlast => axi_interconnect_0_M01_AXI_RLAST,
      M01_AXI_rready => axi_interconnect_0_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => axi_interconnect_0_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => axi_interconnect_0_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => axi_interconnect_0_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wlast => axi_interconnect_0_M01_AXI_WLAST,
      M01_AXI_wready => axi_interconnect_0_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => axi_interconnect_0_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => axi_interconnect_0_M01_AXI_WVALID,
      M02_ACLK => ACLK_0_1,
      M02_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M02_AXI_araddr(31 downto 0) => axi_interconnect_0_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arready => axi_interconnect_0_M02_AXI_ARREADY,
      M02_AXI_arvalid => axi_interconnect_0_M02_AXI_ARVALID,
      M02_AXI_awaddr(31 downto 0) => axi_interconnect_0_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awready => axi_interconnect_0_M02_AXI_AWREADY,
      M02_AXI_awvalid => axi_interconnect_0_M02_AXI_AWVALID,
      M02_AXI_bready => axi_interconnect_0_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => axi_interconnect_0_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => axi_interconnect_0_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => axi_interconnect_0_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => axi_interconnect_0_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => axi_interconnect_0_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => axi_interconnect_0_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => axi_interconnect_0_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => axi_interconnect_0_M02_AXI_WREADY,
      M02_AXI_wvalid => axi_interconnect_0_M02_AXI_WVALID,
      M03_ACLK => ACLK_0_1,
      M03_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M03_AXI_araddr(31 downto 0) => axi_interconnect_0_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arprot(2 downto 0) => axi_interconnect_0_M03_AXI_ARPROT(2 downto 0),
      M03_AXI_arready => axi_interconnect_0_M03_AXI_ARREADY,
      M03_AXI_arvalid => axi_interconnect_0_M03_AXI_ARVALID,
      M03_AXI_awaddr(31 downto 0) => axi_interconnect_0_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awprot(2 downto 0) => axi_interconnect_0_M03_AXI_AWPROT(2 downto 0),
      M03_AXI_awready => axi_interconnect_0_M03_AXI_AWREADY,
      M03_AXI_awvalid => axi_interconnect_0_M03_AXI_AWVALID,
      M03_AXI_bready => axi_interconnect_0_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => axi_interconnect_0_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => axi_interconnect_0_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => axi_interconnect_0_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => axi_interconnect_0_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => axi_interconnect_0_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => axi_interconnect_0_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => axi_interconnect_0_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => axi_interconnect_0_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => axi_interconnect_0_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => axi_interconnect_0_M03_AXI_WVALID,
      M04_ACLK => ACLK_0_1,
      M04_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M04_AXI_araddr(31 downto 0) => axi_interconnect_0_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arprot(2 downto 0) => axi_interconnect_0_M04_AXI_ARPROT(2 downto 0),
      M04_AXI_arready => axi_interconnect_0_M04_AXI_ARREADY,
      M04_AXI_arvalid => axi_interconnect_0_M04_AXI_ARVALID,
      M04_AXI_awaddr(31 downto 0) => axi_interconnect_0_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awprot(2 downto 0) => axi_interconnect_0_M04_AXI_AWPROT(2 downto 0),
      M04_AXI_awready => axi_interconnect_0_M04_AXI_AWREADY,
      M04_AXI_awvalid => axi_interconnect_0_M04_AXI_AWVALID,
      M04_AXI_bready => axi_interconnect_0_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => axi_interconnect_0_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => axi_interconnect_0_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => axi_interconnect_0_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => axi_interconnect_0_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => axi_interconnect_0_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => axi_interconnect_0_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => axi_interconnect_0_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => axi_interconnect_0_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => axi_interconnect_0_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => axi_interconnect_0_M04_AXI_WVALID,
      M05_ACLK => ACLK_0_1,
      M05_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      M05_AXI_araddr(31 downto 0) => axi_interconnect_0_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arburst(1 downto 0) => axi_interconnect_0_M05_AXI_ARBURST(1 downto 0),
      M05_AXI_arcache(3 downto 0) => axi_interconnect_0_M05_AXI_ARCACHE(3 downto 0),
      M05_AXI_arid(3 downto 0) => axi_interconnect_0_M05_AXI_ARID(3 downto 0),
      M05_AXI_arlen(7 downto 0) => axi_interconnect_0_M05_AXI_ARLEN(7 downto 0),
      M05_AXI_arlock(0) => axi_interconnect_0_M05_AXI_ARLOCK(0),
      M05_AXI_arprot(2 downto 0) => axi_interconnect_0_M05_AXI_ARPROT(2 downto 0),
      M05_AXI_arqos(3 downto 0) => axi_interconnect_0_M05_AXI_ARQOS(3 downto 0),
      M05_AXI_arready(0) => axi_interconnect_0_M05_AXI_ARREADY(0),
      M05_AXI_arregion(3 downto 0) => axi_interconnect_0_M05_AXI_ARREGION(3 downto 0),
      M05_AXI_arsize(2 downto 0) => axi_interconnect_0_M05_AXI_ARSIZE(2 downto 0),
      M05_AXI_arvalid(0) => axi_interconnect_0_M05_AXI_ARVALID(0),
      M05_AXI_awaddr(31 downto 0) => axi_interconnect_0_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awburst(1 downto 0) => axi_interconnect_0_M05_AXI_AWBURST(1 downto 0),
      M05_AXI_awcache(3 downto 0) => axi_interconnect_0_M05_AXI_AWCACHE(3 downto 0),
      M05_AXI_awid(3 downto 0) => axi_interconnect_0_M05_AXI_AWID(3 downto 0),
      M05_AXI_awlen(7 downto 0) => axi_interconnect_0_M05_AXI_AWLEN(7 downto 0),
      M05_AXI_awlock(0) => axi_interconnect_0_M05_AXI_AWLOCK(0),
      M05_AXI_awprot(2 downto 0) => axi_interconnect_0_M05_AXI_AWPROT(2 downto 0),
      M05_AXI_awqos(3 downto 0) => axi_interconnect_0_M05_AXI_AWQOS(3 downto 0),
      M05_AXI_awready(0) => axi_interconnect_0_M05_AXI_AWREADY(0),
      M05_AXI_awregion(3 downto 0) => axi_interconnect_0_M05_AXI_AWREGION(3 downto 0),
      M05_AXI_awsize(2 downto 0) => axi_interconnect_0_M05_AXI_AWSIZE(2 downto 0),
      M05_AXI_awvalid(0) => axi_interconnect_0_M05_AXI_AWVALID(0),
      M05_AXI_bid(3 downto 0) => axi_interconnect_0_M05_AXI_BID(3 downto 0),
      M05_AXI_bready(0) => axi_interconnect_0_M05_AXI_BREADY(0),
      M05_AXI_bresp(1 downto 0) => axi_interconnect_0_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid(0) => axi_interconnect_0_M05_AXI_BVALID(0),
      M05_AXI_rdata(31 downto 0) => axi_interconnect_0_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rid(3 downto 0) => axi_interconnect_0_M05_AXI_RID(3 downto 0),
      M05_AXI_rlast(0) => axi_interconnect_0_M05_AXI_RLAST(0),
      M05_AXI_rready(0) => axi_interconnect_0_M05_AXI_RREADY(0),
      M05_AXI_rresp(1 downto 0) => axi_interconnect_0_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid(0) => axi_interconnect_0_M05_AXI_RVALID(0),
      M05_AXI_wdata(31 downto 0) => axi_interconnect_0_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wlast(0) => axi_interconnect_0_M05_AXI_WLAST(0),
      M05_AXI_wready(0) => axi_interconnect_0_M05_AXI_WREADY(0),
      M05_AXI_wstrb(3 downto 0) => axi_interconnect_0_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid(0) => axi_interconnect_0_M05_AXI_WVALID(0),
      S00_ACLK => ACLK_0_1,
      S00_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => S00_AXI_0_1_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => S00_AXI_0_1_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => S00_AXI_0_1_ARCACHE(3 downto 0),
      S00_AXI_arid(3 downto 0) => S00_AXI_0_1_ARID(3 downto 0),
      S00_AXI_arlen(7 downto 0) => S00_AXI_0_1_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => S00_AXI_0_1_ARLOCK(0),
      S00_AXI_arprot(2 downto 0) => S00_AXI_0_1_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => S00_AXI_0_1_ARQOS(3 downto 0),
      S00_AXI_arready(0) => S00_AXI_0_1_ARREADY(0),
      S00_AXI_arsize(2 downto 0) => S00_AXI_0_1_ARSIZE(2 downto 0),
      S00_AXI_arvalid(0) => S00_AXI_0_1_ARVALID(0),
      S00_AXI_awaddr(31 downto 0) => S00_AXI_0_1_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => S00_AXI_0_1_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => S00_AXI_0_1_AWCACHE(3 downto 0),
      S00_AXI_awid(3 downto 0) => S00_AXI_0_1_AWID(3 downto 0),
      S00_AXI_awlen(7 downto 0) => S00_AXI_0_1_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => S00_AXI_0_1_AWLOCK(0),
      S00_AXI_awprot(2 downto 0) => S00_AXI_0_1_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => S00_AXI_0_1_AWQOS(3 downto 0),
      S00_AXI_awready(0) => S00_AXI_0_1_AWREADY(0),
      S00_AXI_awsize(2 downto 0) => S00_AXI_0_1_AWSIZE(2 downto 0),
      S00_AXI_awvalid(0) => S00_AXI_0_1_AWVALID(0),
      S00_AXI_bid(3 downto 0) => S00_AXI_0_1_BID(3 downto 0),
      S00_AXI_bready(0) => S00_AXI_0_1_BREADY(0),
      S00_AXI_bresp(1 downto 0) => S00_AXI_0_1_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => S00_AXI_0_1_BVALID(0),
      S00_AXI_rdata(31 downto 0) => S00_AXI_0_1_RDATA(31 downto 0),
      S00_AXI_rid(3 downto 0) => S00_AXI_0_1_RID(3 downto 0),
      S00_AXI_rlast(0) => S00_AXI_0_1_RLAST(0),
      S00_AXI_rready(0) => S00_AXI_0_1_RREADY(0),
      S00_AXI_rresp(1 downto 0) => S00_AXI_0_1_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => S00_AXI_0_1_RVALID(0),
      S00_AXI_wdata(31 downto 0) => S00_AXI_0_1_WDATA(31 downto 0),
      S00_AXI_wlast(0) => S00_AXI_0_1_WLAST(0),
      S00_AXI_wready(0) => S00_AXI_0_1_WREADY(0),
      S00_AXI_wstrb(3 downto 0) => S00_AXI_0_1_WSTRB(3 downto 0),
      S00_AXI_wvalid(0) => S00_AXI_0_1_WVALID(0),
      S01_ACLK => ACLK_0_1,
      S01_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      S01_AXI_araddr(31 downto 0) => S01_AXI_0_1_ARADDR(31 downto 0),
      S01_AXI_arprot(2 downto 0) => S01_AXI_0_1_ARPROT(2 downto 0),
      S01_AXI_arready => S01_AXI_0_1_ARREADY,
      S01_AXI_arvalid => S01_AXI_0_1_ARVALID,
      S01_AXI_awaddr(31 downto 0) => S01_AXI_0_1_AWADDR(31 downto 0),
      S01_AXI_awprot(2 downto 0) => S01_AXI_0_1_AWPROT(2 downto 0),
      S01_AXI_awready => S01_AXI_0_1_AWREADY,
      S01_AXI_awvalid => S01_AXI_0_1_AWVALID,
      S01_AXI_bready => S01_AXI_0_1_BREADY,
      S01_AXI_bresp(1 downto 0) => S01_AXI_0_1_BRESP(1 downto 0),
      S01_AXI_bvalid => S01_AXI_0_1_BVALID,
      S01_AXI_rdata(31 downto 0) => S01_AXI_0_1_RDATA(31 downto 0),
      S01_AXI_rready => S01_AXI_0_1_RREADY,
      S01_AXI_rresp(1 downto 0) => S01_AXI_0_1_RRESP(1 downto 0),
      S01_AXI_rvalid => S01_AXI_0_1_RVALID,
      S01_AXI_wdata(31 downto 0) => S01_AXI_0_1_WDATA(31 downto 0),
      S01_AXI_wready => S01_AXI_0_1_WREADY,
      S01_AXI_wstrb(3 downto 0) => S01_AXI_0_1_WSTRB(3 downto 0),
      S01_AXI_wvalid => S01_AXI_0_1_WVALID,
      S02_ACLK => ACLK_0_1,
      S02_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      S02_AXI_araddr(31 downto 0) => axi_dma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      S02_AXI_arburst(1 downto 0) => axi_dma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      S02_AXI_arcache(3 downto 0) => axi_dma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      S02_AXI_arlen(7 downto 0) => axi_dma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      S02_AXI_arprot(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      S02_AXI_arready => axi_dma_0_M_AXI_MM2S_ARREADY,
      S02_AXI_arsize(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      S02_AXI_arvalid => axi_dma_0_M_AXI_MM2S_ARVALID,
      S02_AXI_rdata(31 downto 0) => axi_dma_0_M_AXI_MM2S_RDATA(31 downto 0),
      S02_AXI_rlast => axi_dma_0_M_AXI_MM2S_RLAST,
      S02_AXI_rready => axi_dma_0_M_AXI_MM2S_RREADY,
      S02_AXI_rresp(1 downto 0) => axi_dma_0_M_AXI_MM2S_RRESP(1 downto 0),
      S02_AXI_rvalid => axi_dma_0_M_AXI_MM2S_RVALID,
      S03_ACLK => ACLK_0_1,
      S03_ARESETN => rst_aclk_10M_peripheral_aresetn(0),
      S03_AXI_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      S03_AXI_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      S03_AXI_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      S03_AXI_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      S03_AXI_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      S03_AXI_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      S03_AXI_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      S03_AXI_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      S03_AXI_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      S03_AXI_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      S03_AXI_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      S03_AXI_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      S03_AXI_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      S03_AXI_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      S03_AXI_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      S03_AXI_wvalid => axi_dma_0_M_AXI_S2MM_WVALID
    );
axilite_data_fifo: component design_1_axi_data_fifo_0_0
     port map (
      aclk => ACLK_0_1,
      aresetn => rst_aclk_10M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_data_fifo_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => axi_data_fifo_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arready => axi_data_fifo_0_M_AXI_ARREADY,
      m_axi_arvalid => axi_data_fifo_0_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_data_fifo_0_M_AXI_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => axi_data_fifo_0_M_AXI_AWPROT(2 downto 0),
      m_axi_awready => axi_data_fifo_0_M_AXI_AWREADY,
      m_axi_awvalid => axi_data_fifo_0_M_AXI_AWVALID,
      m_axi_bready => axi_data_fifo_0_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_data_fifo_0_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_data_fifo_0_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => axi_data_fifo_0_M_AXI_RDATA(31 downto 0),
      m_axi_rready => axi_data_fifo_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_data_fifo_0_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_data_fifo_0_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => axi_data_fifo_0_M_AXI_WDATA(31 downto 0),
      m_axi_wready => axi_data_fifo_0_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => axi_data_fifo_0_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => axi_data_fifo_0_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_interconnect_0_M00_AXI_ARREADY,
      s_axi_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      s_axi_awready => axi_interconnect_0_M00_AXI_AWREADY,
      s_axi_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      s_axi_bready => axi_interconnect_0_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => axi_interconnect_0_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => axi_interconnect_0_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_interconnect_0_M00_AXI_WVALID
    );
rst_aclk_10M: component design_1_rst_aclk_10M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_aclk_10M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => aresetn_1,
      interconnect_aresetn(0) => NLW_rst_aclk_10M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_aclk_10M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_aclk_10M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_aclk_10M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => ACLK_0_1
    );
end STRUCTURE;
