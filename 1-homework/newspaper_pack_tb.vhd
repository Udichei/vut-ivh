library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.newspaper_pack.ALL;


entity newspaper_pack_tb is
end newspaper_pack_tb;

architecture Behavioral of newspaper_pack_tb is
	signal DATA  : std_logic_vector ( 0 to 11) := "101001011010";
	signal vystup1 : std_logic_vector ( 0 to 2 );
	signal vystup2 : std_logic_vector ( 0 to 2 );
	signal vystup3 : std_logic_vector ( 0 to 2 );
	signal vystup4 : std_logic_vector ( 0 to 2 );
--	signal zaporne : std_logic_vector ( 0 to 2 );
begin

	vystup1 <= GETCOLUMN (DATA, 0, 3);
	vystup2 <= GETCOLUMN (DATA, 1, 3);
	vystup3 <= GETCOLUMN (DATA, 5, 3);
	vystup4 <= GETCOLUMN (DATA, 2, 3);
--	zaporne <= GETCOLUMN (DATA, (-2), 3);

end Behavioral;

