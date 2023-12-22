----------------------------------------------------------------------------------
-- Company: Elsys Design
-- Engineer: Nicolas Belland
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ic_pkg is
	
	type translation_t is record
	   vaddr       : unsigned(31 downto 0); --virtual address
	   paddr       : unsigned(31 downto 0); --physical address
	   size        : unsigned(31 downto 0);
	   slave       : unsigned(2 downto 0); --which slave to connect to (ROM, RAM, IO, etc...)
	   enable      : std_logic;
    end record translation_t;
	
	type translation_table_t is array(natural range <>) of translation_t;
	
--	type ic_array_t is array(natural range <>) of obi_array_t;

end package;

package body ic_pkg is 
end package body;
