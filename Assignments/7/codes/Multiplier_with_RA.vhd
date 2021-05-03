library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier4bit is
 port ( A: in STD_LOGIC_VECTOR (3 downto 0);
	B: in STD_LOGIC_VECTOR (3 downto 0);
	S: out STD_LOGIC_VECTOR (7 downto 0));
end multiplier4bit;
 
architecture Behavioral of multiplier4bit is
 
-- Full Adder 1bit Component Decalaration
component FA
 port ( A,B: in STD_LOGIC;
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC);
end component;

-- Half Adder 1bit Component Decalaration
component HA
 port ( A,B: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC);
end component;

-- Ripple Carry Adder Decalaration
component RA
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end component;

-- Intermediate declaration
signal AB0, AB1, AB2, AB3: STD_LOGIC_VECTOR (3 downto 0);
signal P1, P2, P3: STD_LOGIC_VECTOR (3 downto 0);
signal B1, B2, B3: STD_LOGIC_VECTOR (3 downto 0);
signal co1, co2, co3: STD_LOGIC;

begin
-- Multiplier input
AB0(0) <= A(0) and B(0);
AB0(1) <= A(1) and B(0);
AB0(2) <= A(2) and B(0);
AB0(3) <= A(3) and B(0);

AB1(0) <= A(0) and B(1);
AB1(1) <= A(1) and B(1);
AB1(2) <= A(2) and B(1);
AB1(3) <= A(3) and B(1);

AB2(0) <= A(0) and B(2);
AB2(1) <= A(1) and B(2);
AB2(2) <= A(2) and B(2);
AB2(3) <= A(3) and B(2);

AB3(0) <= A(0) and B(3);
AB3(1) <= A(1) and B(3);
AB3(2) <= A(2) and B(3);
AB3(3) <= A(3) and B(3);

--adder input signal
B1(0) <= AB0(1); B1(1) <= AB0(2); B1(2) <= AB0(3); B1(3) <= '0';
RA1: RA port map(AB1, B1, '0', P1, co1);

B2(0) <= P1(1); B2(1) <= P1(2); B2(2) <= P1(3); B2(3) <= co1;
RA2: RA port map(AB2, B2, '0', P2, co2);

B3(0) <= P2(1); B3(1) <= P2(2); B3(2) <= P2(3); B3(3) <= co2;
RA3: RA port map(AB3, B3, '0', P2, co3);

-- Mulitplier output
S(0)<= AB0(0);
S(1)<= P1(0);
S(2)<= P2(0);
S(3)<= P3(0);
S(4)<= P3(1);
S(5)<= P3(2);
S(6)<= P3(3);
S(7)<= co3;

end Behavioral;