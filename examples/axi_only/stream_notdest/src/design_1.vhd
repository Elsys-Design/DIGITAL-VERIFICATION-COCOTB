--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Nov 22 16:21:18 2023
--Host        : D-C620HZ2 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    axis_in_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    axis_in_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_in_tready : out STD_LOGIC;
    axis_in_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_in_tvalid : in STD_LOGIC;
    axis_out_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    axis_out_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_out_tready : in STD_LOGIC;
    axis_out_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_out_tvalid : out STD_LOGIC
  );
end design_1;

architecture STRUCTURE of design_1 is
begin
    axis_out_tdata <= axis_in_tdata;
    axis_out_tkeep <= axis_in_tkeep;
    axis_out_tstrb <= axis_in_tstrb;
    axis_out_tvalid <= axis_in_tvalid;
    axis_in_tready <= axis_out_tready;
end STRUCTURE;
