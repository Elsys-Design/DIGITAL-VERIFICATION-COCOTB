
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library obi_utils;
use obi_utils.obi_pkg.all;


entity obi_to_axi4lite is
	generic (
		ADDR_WIDTH 			: positive 	:= 32;
		DATA_WIDTH 			: positive 	:= 32;
		OUTSTANDING_MAX		: positive 	:= 7;
		AXI_PROT_VALUE		: std_logic_vector(2 downto 0) := "001"
	);
	port(
		-- shared signals
		clk			: in  std_logic;
		reset_n		: in  std_logic;
		
		-- OBI :: A channel
		obi_req		: in  std_logic;
		obi_gnt		: out std_logic;
		obi_addr 	: in  std_logic_vector(ADDR_WIDTH-1 downto 0);
		obi_we		: in  std_logic;
		obi_be		: in  std_logic_vector(DATA_WIDTH/8-1 downto 0);
		obi_wdata	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		
		-- OBI :: R channel
		obi_rvalid	: out std_logic;
		obi_rready	: in  std_logic;
		obi_rdata	: out std_logic_vector(DATA_WIDTH-1 downto 0);
		obi_err		: out std_logic;
		
		-- AXI4-Lite :: AW channel
		axi_awvalid	: out std_logic;
		axi_awready	: in  std_logic;
		axi_awaddr	: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		axi_awprot  : out std_logic_vector(2 downto 0);
		
		-- AXI4-Lite :: W channel
		axi_wvalid	: out std_logic;
		axi_wready 	: in  std_logic;
		axi_wdata	: out std_logic_vector(DATA_WIDTH-1 downto 0);
		axi_wstrb	: out std_logic_vector(DATA_WIDTH/8-1 downto 0);
		
		-- AXI4-Lite :: B channel
		axi_bvalid 	: in  std_logic;
		axi_bready	: out std_logic;
		axi_bresp	: in  std_logic_vector(1 downto 0);
		
		-- AXI4-Lite :: AR channel 
		axi_arvalid	: out std_logic;
		axi_arready	: in  std_logic;
		axi_araddr	: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		axi_arprot  : out std_logic_vector(2 downto 0);
		
		-- AXI4-Lite :: R channel
		axi_rvalid	: in  std_logic;
		axi_rready	: out std_logic;
		axi_rdata	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		axi_rresp	: in  std_logic_vector(1 downto 0)
	);
end entity;


architecture rtl of obi_to_axi4lite is
	
	constant OUTSTANDING_WIDTH 	: positive := clog2(OUTSTANDING_MAX);
	
	signal outstanding_count 	: unsigned(OUTSTANDING_WIDTH-1 downto 0); -- number of outstanding transactions
	signal outstanding_w 		: std_logic; 							  -- type of outstanding (1=write, 0=read)
	
	-- indicate that the current OBI write has been partially forwarded
	signal aw_done				: std_logic; -- AW sent, but not W
	signal w_done				: std_logic; -- W sent, but not AW
	
	-- wires
	signal outstanding_is_max 	: std_logic;
	signal outstanding_is_zero	: std_logic;
	signal outstanding_is_one 	: std_logic;
	signal read_is_allowed 		: std_logic; -- no outstanding write, and outstanding counter is not max   
	signal write_is_allowed		: std_logic; -- no outstanding read, and outstanding counter is not max 
	
	signal emit					: std_logic; -- high whenever a new transaction is started on the AXI interface
	signal retire				: std_logic; -- high whenever a transaction finishes on the AXI interface
	
	
begin

outstanding_is_max 	<= '1' when signed(outstanding_count) 	= -1 else '0';
outstanding_is_zero <= '1' when unsigned(outstanding_count) =  0 else '0';
outstanding_is_one  <= '1' when unsigned(outstanding_count) =  1 else '0';

read_is_allowed 	<= outstanding_is_zero or (not outstanding_w and (not outstanding_is_max or retire)) or (outstanding_is_one and retire);
write_is_allowed 	<= outstanding_is_zero or (    outstanding_w and (not outstanding_is_max or retire)) or (outstanding_is_one and retire);


-- OBI R-channel signals 
retire		<= (axi_rvalid or axi_bvalid) and obi_rready;
obi_gnt		<= emit;
obi_rvalid 	<= axi_rvalid or axi_bvalid;
obi_rdata	<= axi_rdata;
obi_err		<= axi_bresp(1) when axi_bvalid = '1' else axi_rresp(1);

axi_bready 	<= obi_rready;
axi_rready 	<= obi_rready;

-- AXI AR-channel signals
axi_araddr 	<= obi_addr;
axi_arprot 	<= AXI_PROT_VALUE;
axi_arvalid <= obi_req and not obi_we and read_is_allowed;

-- AXI AW-channel signals
axi_awaddr 	<= obi_addr;
axi_awprot 	<= AXI_PROT_VALUE;
axi_awvalid <= obi_req and obi_we and not aw_done and write_is_allowed;

-- AXI W-channel signals
axi_wdata 	<= obi_wdata;
axi_wstrb	<= obi_be;
axi_wvalid	<= obi_req and obi_we and not w_done and write_is_allowed;



proc_emit_driver: process(obi_req, obi_we, aw_done, w_done, axi_arready, axi_wready, axi_awready, write_is_allowed, read_is_allowed)
begin
	emit <= '0';
	if obi_req = '1' then
		if obi_we = '1' then
			emit <= (aw_done or axi_awready) and (w_done or axi_wready) and write_is_allowed; -- high when both AW and W phases have been done
		else
			emit <= axi_arready and read_is_allowed;
		end if;
	end if;
end process;


proc_outstanding_update: process(clk, reset_n) -- keep track of outstanding transactions and their (shared) type
begin
	if reset_n = '0' then
		outstanding_count <= (others => '0');
	elsif rising_edge(clk) then
		if emit /= retire then 
			if emit = '1' then
				outstanding_count <= outstanding_count + 1; 
			else
				outstanding_count <= outstanding_count - 1; 
			end if;
		end if;
		
		if emit = '1' then 
			outstanding_w <= obi_we;
		end if;
	end if;
end process;


proc_aw_w_done_update: process(clk, reset_n)
begin
	if reset_n = '0' then
		aw_done <= '0';
		w_done	<= '0';
	elsif rising_edge(clk) then
		if emit = '1' then
			aw_done <= '0';
			w_done  <= '0';
		else
			aw_done <= aw_done or (obi_req and write_is_allowed and axi_awready);
			w_done  <= w_done  or (obi_req and write_is_allowed and axi_wready);
		end if;
	end if;
end process;


end architecture;
