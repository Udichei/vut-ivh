-- Citac s volitelnou frekvenci
-- IVH projekt - ukol2
-- autor: xsyano00

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
-- v pripade nutnosti muzete nacist dalsi knihovny

entity counter is
	 Generic (
			CLK_PERIOD : time := 10 ns;
			OUT_PERIOD : time := 1000 ns);			
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           EN : out  STD_LOGIC);
end counter;
architecture Behavioral of counter is
	
-- zde je funkce log2 z prednasek, pravdepodobne se vam bude hodit.
	function log2(A: integer) return integer is
		variable bits : integer := 0;
		variable b : integer := 1;
	begin
		while (b <= a) loop
			b := b * 2;
			bits := bits + 1;
		end loop;
		return bits;
	end function;
	
	
begin

process (clk)
	variable count  : integer := 0;
	
	begin
	
		if RESET = '1' then
			count := 0;
			EN <= '0';
		elsif(clk'event and clk = '1') then
			if (count = (OUT_PERIOD/CLK_PERIOD)) then
				EN <= '1';
				EN <= '0' after CLK_PERIOD;
				count := 0;
			else
				count := count + 1;
				EN <= '0';
			end if;
		end if;
		
	
	end process;

end Behavioral;