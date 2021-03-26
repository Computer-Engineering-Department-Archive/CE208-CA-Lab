---------------------------------------------------------------------
-- Test Bench for 2-bit Comparator 
-- nine cases are tested here		   
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Comparator_TB is				-- entity declaration
end Comparator_TB;

---------------------------------------------------------------------

architecture TB of Comparator_TB is

    component Comparator
    port(	A:		in std_logic_vector(1 downto 0);
		B:		in std_logic_vector(1 downto 0);
		less:		out std_logic;
		equal:		out std_logic;
		greater:	out std_logic
    );
    end component;

    signal A, B: std_logic_vector(1 downto 0):="00";
    signal less, equal, greater: std_logic;

begin

    Unit: Comparator port map (A, B, less, equal, greater);
	
    process
        
        variable err_cnt: integer :=0;

    begin								

	-- Case 1 (using the loop statement)
	A <= "11";
	B <= "00";
	for i in 0 to 2 loop
	    wait for 10 ns;
	    assert (greater='1') report "Comparison Error detected!" 
	    severity error;  	
	    if (greater/='1') then 
	        err_cnt:=err_cnt+1; 
	    end if; 		
	    B <= B + '1';	    		
	end loop;
		
	-- Case 2 (using the loop statement)
	A <= "00";
	B <= "01";
	for i in 0 to 2 loop
	    wait for 10 ns;
	    assert (less='1') report "Comparison Error detected!" 
	    severity error; 
	    if (less/='1') then 
	        err_cnt:=err_cnt+1; 
	    end if; 
	    B <= B + '1';	   
	end loop;
		
	-- Case 3
	A <= "01";		
	B <= "01";
	wait for 10 ns;
	assert (equal='1') report "Comparison Error detected!" 
	severity error; 
	if (equal/='1') then
	    err_cnt:=err_cnt+1;
	end if;
		
	-- summary of all the tests
	if (err_cnt=0) then 			
	    assert false 
	    report "Testbench of Adder completed successfully!" 
	    severity note; 
	else 
	    assert true 
	    report "Something wrong, try again" 
	    severity error; 
	end if; 
		
	wait;
		
    end process;

end TB;

-------------------------------------------------------------------
configuration CFG_TB of Comparator_TB is
	for TB
	end for;
end CFG_TB;
--------------------------------------------------------------------