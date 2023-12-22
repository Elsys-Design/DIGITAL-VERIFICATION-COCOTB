
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package obi_pkg is

	function clog2(x: natural) return natural;
	
	type obi_array_t is array(natural range <>) of std_logic_vector;
	
	type obi_t is record
		req       : std_logic;
		gnt       : std_logic;
		addr      : std_logic_vector(31 downto 0);
		we        : std_logic;
		be        : std_logic_vector(3 downto 0);
		wdata     : std_logic_vector(31 downto 0);
		rvalid    : std_logic;
		rready    : std_logic;
		rdata     : std_logic_vector(31 downto 0);
		err       : std_logic;
	end record obi_t;
	
	-- type obi_bus_array_t is array(natural range <>) of obi_t;
  
end package;

package body obi_pkg is 

	function clog2(x: natural) return natural is
		variable log : natural;
		variable tmp : natural;
	begin
		if x <= 1 then
			return x;
		end if;
		log := 0;
		tmp := x - 1;
		while tmp > 0 loop
			log := log + 1;
			tmp := tmp / 2;
		end loop;
		return log;
	end function;

end package body;


