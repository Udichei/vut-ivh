library IEEE;
use IEEE.STD_LOGIC_1164.all;

package newspaper_pack is

	type DIRECTION_T is (DIR_LEFT, DIR_RIGHT);

	function GETCOLUMN ( signal DATA : in std_logic_vector; COLID : in integer; ROWS : in integer) return std_logic_vector;

end newspaper_pack;


package body newspaper_pack is
 
	function GETCOLUMN ( signal DATA : in std_logic_vector; COLID : in integer; ROWS : in integer) return std_logic_vector is
		variable vysledek : std_logic_vector(0 to ROWS-1);
		variable col_num  : integer := COLID;
		
	begin 
		if COLID < 0 then
			
			while (col_num < ((DATA'length)/ROWS) - 1) loop
				col_num := col_num + (DATA'length)/ROWS;
			end loop;
		else
			while (col_num > (DATA'length)/ROWS - 1) loop
				col_num := col_num - (DATA'length)/ROWS;
			end loop;
		end if;
		
		vysledek := DATA(col_num*ROWS to col_num*ROWS + ROWS);
		return vysledek;
	end;
 
end newspaper_pack;