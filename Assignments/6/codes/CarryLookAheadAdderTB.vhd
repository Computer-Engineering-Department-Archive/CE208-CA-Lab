LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Tb_Carry_Look_Ahead IS
END Tb_Carry_Look_Ahead;

ARCHITECTURE behavior OF Tb_Carry_Look_Ahead IS

 -- Component Declaration for the Unit Under Test (UUT)
COMPONENT Carry_Look_Ahead
PORT(
	A : IN std_logic_vector(3 downto 0);
	B : IN std_logic_vector(3 downto 0);
	Cin : IN std_logic;
	S : OUT std_logic_vector(3 downto 0);
	Cout : OUT std_logic
);
END COMPONENT;

--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal Cin : std_logic := '0';

--Outputs
signal S : std_logic_vector(3 downto 0);
signal Cout : std_logic;

BEGIN

 -- Instantiate the Unit Under Test (UUT)
uut: Carry_Look_Ahead PORT MAP (
	A => A,
	B => B,
	Cin => Cin,
	S => S,
	Cout => Cout
);

 -- Stimulus process
stim_proc: process
begin
 -- hold reset state for 100 ns.
	wait for 10 ns;

	A <= "1111";
	B <= "1111";
	Cin <= '1';

	wait for 10 ns;

	A <= "1010";
	B <= "0111";
	Cin <= '0';

	wait for 10 ns;

	A <= "1000";
	B <= "1001";
	Cin <= '0';

	wait;

end process;

END;