-------------------------------------------------------------
-- Test Bench for 16*8 ROM module 
------------------------------------------------------------- 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity ROM_TB is
end ROM_TB; 
 
architecture TB of ROM_TB is 
component ROM is port(
	clk			: in std_logic;
	rst			: in std_logic;
	enable			: in std_logic;
	read			: in std_logic;
	address			: in integer range 0 to 15;
	dout			: out std_ulogic_vector(7 downto 0)
);
end component;

--init signals
signal T_Clock, T_Reset, T_Enable, T_Read	: std_logic;
signal T_Address				: integer range 0 to 15;
signal T_Dout					: std_ulogic_vector(7 downto 0);

begin
--port mapping 
    U_ROM: ROM port map (
		T_Clock, 
		T_Reset, 
		T_Enable, 
		T_Read, 
		T_Address, 
		T_Dout
    );

    clock_process: process
    
    --clock
    begin
        T_Clock<='1';
        wait for 5 ns;
        T_Clock<='0';
        wait for 5 ns;
    end process;
							
    process

    begin
	--init reset as 1 so we are not in any specific state
	T_Enable <= '1';
	T_Read <= '0';
	T_Reset <= '1';
	T_Address <= 0;
	wait for 20 ns;			
	
	--reset = 0 and read = 1 so we can read data from ROM
	T_Reset <= '0';
	T_Read <= '1';
		
	--loop on ROM array addresses
	for i in 0 to 31 loop
	    wait for 20 ns;
	    T_Address <= T_Address + 1;			
	end loop;

	wait;
    end process;

end TB;

--------------------------------------------------------------
configuration CFG_TB of ROM_TB is 
        for TB 
        end for; 
end CFG_TB; 
--------------------------------------------------------------