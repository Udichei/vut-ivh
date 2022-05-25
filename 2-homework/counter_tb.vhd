-- Testovani counteru, kod je tak, jak je vygenerovan od ISE
-- Autor: ???

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal EN : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    -- muzete samozrejme nastavit i genericke parametry!
    -- pozor na dobu simulace (nenastavujte moc dlouhe casy nebo zkratte CLK_period)
    -- Pocitejte s tim, ze pri zkouseni pobezi testbench 100 ms
    uut: entity work.counter PORT MAP (
          CLK => CLK,
          RESET => RESET,
          EN => EN
        );

    -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
    

    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        RESET <= '1';
        wait for 100 ns;	
        RESET <= '0';
            
        wait for CLK_period*10;
		  assert (EN = '0') report "test failed" severity warning;
		  
		  wait for clk_period*90;
		  assert (EN = '0') report "test failed " severity warning;
		  
		  wait for clk_period;
		  assert (EN = '1') report "test failed " severity warning;
		  
		  wait for clk_period;
		  assert (EN = '0') report "test failed " severity warning;

		  

        wait;
    end process;

END;
