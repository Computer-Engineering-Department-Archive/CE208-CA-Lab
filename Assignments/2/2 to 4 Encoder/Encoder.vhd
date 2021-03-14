library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
--------------------------------------------------
-- takes a 4 bit wire and proccess it
-- 4 to 2 bit encoder truth table is as below
--
-- 	INPUT	  | 	OUTPUT	  | 	VALID
--       0000		    XX		    0
--       1XXX		    11		    1
--       01XX		    10	            1
--       001X		    01		    1
--       0001		    00		    1
--       ZZZZ		    ZZ		    0
--
--------------------------------------------------
entity Encoder is
 	port(
 		input : in STD_LOGIC_VECTOR(3 downto 0);
 		output : out STD_LOGIC_VECTOR(2 downto 0)
 	);
end Encoder;
 
architecture behave of Encoder is
begin
 
process(input)
begin
	if    (input(3) = '1') then output <= "111";
	elsif (input(2) = '1') then output <= "101";
	elsif (input(1) = '1') then output <= "011";
	elsif (input(0) = '1') then output <= "001";
	else                        output <= "000"
end process;
 
end behave;

