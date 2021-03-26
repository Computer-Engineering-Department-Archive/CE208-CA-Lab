---------------------------------------------------
-- n-bit Comparator
-- this simple comparator has two n-bit inputs & 
-- three 1-bit outputs
---------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity Comparator is

generic(n: natural :=2);
port(	A:	in std_logic_vector(n-1 downto 0);
	B:	in std_logic_vector(n-1 downto 0);
	less:		out std_logic;
	equal:		out std_logic;
	greater:	out std_logic
);
end Comparator;

---------------------------------------------------

architecture behv of Comparator is

begin 
    
    process(A,B)
    begin
        if (A<B) then 
	    less <= '1';
	    equal <= '0';
	    greater <= '0';
	elsif (A=B) then   
	    less <= '0';
	    equal <= '1';
	    greater <= '0';
	else 
	    less <= '0';
	    equal <= '0';
	    greater <= '1';
	end if;
    end process;

end behv;

---------------------------------------------------