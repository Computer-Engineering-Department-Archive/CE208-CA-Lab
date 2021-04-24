library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_save_adder is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
C : in STD_LOGIC_VECTOR (3 downto 0);
S : OUT STD_LOGIC_VECTOR (4 downto 0);
Cout : OUT STD_LOGIC);
end carry_save_adder;

architecture Behavioral of carry_save_adder is

component full_adder_vhdl_code
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;

 -- Intermediate signal
signal X,Y: STD_LOGIC_VECTOR(3 downto 0);
signal C1,C2,C3: STD_LOGIC;

begin
 -- Carry save adder block
FA1: full_adder_vhdl_code PORT MAP(A(0),B(0),C(0),S(0),X(0));
FA2: full_adder_vhdl_code PORT MAP(A(1),B(1),C(1),Y(0),X(1));
FA3: full_adder_vhdl_code PORT MAP(A(2),B(2),C(2),Y(1),X(2));
FA4: full_adder_vhdl_code PORT MAP(A(3),B(3),C(3),Y(2),X(3));

 -- Ripple carry adder block
FA5: full_adder_vhdl_code PORT MAP(X(0),Y(0),'0',S(1),C1);
FA6: full_adder_vhdl_code PORT MAP(X(1),Y(1),C1,S(2),C2);
FA7: full_adder_vhdl_code PORT MAP(X(2),Y(2),C2,S(3),C3);
FA8: full_adder_vhdl_code PORT MAP(X(3),'0',C3,S(4),Cout);

end Behavioral;
