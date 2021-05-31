library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gcd_cal is
port(
	clk	:	in std_logic;
	A	:	in integer range 0 to 15;
	B	:	in integer range 0 to 15;
	O	:	out integer range 0 to 15
);
end gcd_cal;

architecture behv of gcd_cal is
-- signals
--signal intA: integer range 0 to 15;
--signal intB: integer range 0 to 15;

-- behv
begin
	process(clk, A, B)
		variable intA : integer range 0 to 15 := A;
		variable intB : integer range 0 to 15 := B;
		variable swap : integer range 0 to 15;
	begin
		while(intB /= 0) loop
				if (intA < intB) then
					swap := intA;
					intA := intB;
					intB := swap;
				else
					intA := intA - intB;
				end if;
			end loop;
		
		O <= intA;
	end process;
end behv;
