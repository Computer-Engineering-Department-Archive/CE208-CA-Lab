--------------------------------------------
-- Simple D Latch
-- latch is simply controlled by enable bit
-- but has nothing to do with clock sigal
-- notice this difference from flip-flops
--------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;

--------------------------------------------

entity D_latch is
port(	data_in:	in std_logic;
	enable:		in std_logic;
	data_out:	out std_logic
);
end D_latch;

--------------------------------------------

architecture behv of D_latch is
begin		

    -- compare this to D flipflop

    process(data_in, enable)
    begin
        if (enable='1') then
            -- no clock signal here
	    data_out <= data_in;  
	end if;
    end process;	
	
end behv;

--------------------------------------------