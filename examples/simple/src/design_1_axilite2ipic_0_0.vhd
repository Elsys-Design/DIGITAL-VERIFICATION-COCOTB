-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2023 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: CNES:user:axilite2ipic:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_axilite2ipic_0_0 IS
  PORT (
    i_rst : IN STD_LOGIC;
    i_clk : IN STD_LOGIC;
    axil_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axil_awvalid : IN STD_LOGIC;
    axil_awready : OUT STD_LOGIC;
    axil_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axil_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    axil_wvalid : IN STD_LOGIC;
    axil_wready : OUT STD_LOGIC;
    axil_bready : IN STD_LOGIC;
    axil_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axil_bvalid : OUT STD_LOGIC;
    axil_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axil_arvalid : IN STD_LOGIC;
    axil_arready : OUT STD_LOGIC;
    axil_rready : IN STD_LOGIC;
    axil_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axil_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axil_rvalid : OUT STD_LOGIC;
    IPIC_Ack : IN STD_LOGIC;
    IPIC_Error : IN STD_LOGIC;
    IPIC_Data_Rd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IPIC_Req : OUT STD_LOGIC;
    IPIC_Addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IPIC_Data_Wr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IPIC_RnW : OUT STD_LOGIC
  );
END design_1_axilite2ipic_0_0;

ARCHITECTURE design_1_axilite2ipic_0_0_arch OF design_1_axilite2ipic_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_axilite2ipic_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axilite2ipic IS
    GENERIC (
      G_ADD_MASK : STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
    PORT (
      i_rst : IN STD_LOGIC;
      i_clk : IN STD_LOGIC;
      axil_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axil_awvalid : IN STD_LOGIC;
      axil_awready : OUT STD_LOGIC;
      axil_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axil_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      axil_wvalid : IN STD_LOGIC;
      axil_wready : OUT STD_LOGIC;
      axil_bready : IN STD_LOGIC;
      axil_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axil_bvalid : OUT STD_LOGIC;
      axil_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axil_arvalid : IN STD_LOGIC;
      axil_arready : OUT STD_LOGIC;
      axil_rready : IN STD_LOGIC;
      axil_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axil_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axil_rvalid : OUT STD_LOGIC;
      IPIC_Ack : IN STD_LOGIC;
      IPIC_Error : IN STD_LOGIC;
      IPIC_Data_Rd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IPIC_Req : OUT STD_LOGIC;
      IPIC_Addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IPIC_Data_Wr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IPIC_RnW : OUT STD_LOGIC
    );
  END COMPONENT axilite2ipic;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Ack: SIGNAL IS "CNES:user:IPIC:1.0 IPIC ack";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Addr: SIGNAL IS "CNES:user:IPIC:1.0 IPIC addr";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Data_Rd: SIGNAL IS "CNES:user:IPIC:1.0 IPIC data_rd";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Data_Wr: SIGNAL IS "CNES:user:IPIC:1.0 IPIC data_wr";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Error: SIGNAL IS "CNES:user:IPIC:1.0 IPIC error";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_Req: SIGNAL IS "CNES:user:IPIC:1.0 IPIC req";
  ATTRIBUTE X_INTERFACE_INFO OF IPIC_RnW: SIGNAL IS "CNES:user:IPIC:1.0 IPIC rnw";
  ATTRIBUTE X_INTERFACE_INFO OF axil_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axil_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axil_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axil_awaddr: SIGNAL IS "XIL_INTERFACENAME axil, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_aclk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUS" & 
"ER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axil_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axil_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axil_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axil_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axil_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axil_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axil_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axil_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axil_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axil_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axil_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axil_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axil_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF axil_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axil WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_clk: SIGNAL IS "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, ASSOCIATED_BUSIF axil:IPIC, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_aclk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 i_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_rst: SIGNAL IS "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 i_rst RST";
BEGIN
  U0 : axilite2ipic
    GENERIC MAP (
      G_ADD_MASK => X"000000FF"
    )
    PORT MAP (
      i_rst => i_rst,
      i_clk => i_clk,
      axil_awaddr => axil_awaddr,
      axil_awvalid => axil_awvalid,
      axil_awready => axil_awready,
      axil_wdata => axil_wdata,
      axil_wstrb => axil_wstrb,
      axil_wvalid => axil_wvalid,
      axil_wready => axil_wready,
      axil_bready => axil_bready,
      axil_bresp => axil_bresp,
      axil_bvalid => axil_bvalid,
      axil_araddr => axil_araddr,
      axil_arvalid => axil_arvalid,
      axil_arready => axil_arready,
      axil_rready => axil_rready,
      axil_rdata => axil_rdata,
      axil_rresp => axil_rresp,
      axil_rvalid => axil_rvalid,
      IPIC_Ack => IPIC_Ack,
      IPIC_Error => IPIC_Error,
      IPIC_Data_Rd => IPIC_Data_Rd,
      IPIC_Req => IPIC_Req,
      IPIC_Addr => IPIC_Addr,
      IPIC_Data_Wr => IPIC_Data_Wr,
      IPIC_RnW => IPIC_RnW
    );
END design_1_axilite2ipic_0_0_arch;
