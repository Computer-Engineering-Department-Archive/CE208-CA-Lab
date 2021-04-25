LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Tb_carry_save IS
END Tb_carry_save;

ARCHITECTURE behavior OF Tb_carry_save IS

 -- Component Declaration for the Unit Under Test (UUT)

COMPONENT carry_save_adder
PORT(
	A : IN std_logic_vector(3 downto 0);
	B : IN std_logic_vector(3 downto 0);
	C : IN std_logic_vector(3 downto 0);
	S : OUT std_logic_vector(4 downto 0);
	Cout : OUT std_logic
);
END COMPONENT;

--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal C : std_logic_vector(3 downto 0) := (others => '0');

--Outputs
signal S : std_logic_vector(4 downto 0);
signal Cout : std_logic;

BEGIN

 -- Instantiate the Unit Under Test (UUT)
uut: carry_save_adder PORT MAP (
	A => A,
	B => B,
	C => C,
	S => S,
	Cout => Cout
);

 -- Stimulus process
stim_proc: process
begin
 -- hold reset state for 100 ns.
	wait for 100 ns;
	A <= "1100";
	B <= "1101";
	C <= "1110";

	wait for 100 ns;
	A <= "1111";
	B <= "1000";
	C <= "1001";

	wait for 100 ns;
	A <= "1110";
	B <= "0101";
	C <= "0111";

	wait;
	end process;

END;