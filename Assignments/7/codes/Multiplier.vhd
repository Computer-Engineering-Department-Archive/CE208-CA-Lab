library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Array_Multi is
port (  X, Y: 		in STD_LOGIC_VECTOR(3 downto 0);
	P:   		out STD_LOGIC_VECTOR(7 downto 0));
end Array_Multi;
 
architecture Behavioral of Array_Multi is
 
signal C1, C2, C3: STD_LOGIC_VECTOR (3 downto 0);
signal S1, S2, S3: STD_LOGIC_VECTOR (3 downto 0);
signal XY0, XY1, XY2, XY3: STD_LOGIC_VECTOR (3 downto 0);

component FA
port ( X, Y, Cin: 	in STD_LOGIC;
       Cout, Sum:	out STD_LOGIC);
end component;

component HA
 port ( X, Y:		in STD_LOGIC;
	Cout, Sum:	out STD_LOGIC);
end component;

begin
XY0(0) <= X(0) and Y(0); XY1(0) <= X(0) and Y(1);
XY0(1) <= X(1) and Y(0); XY1(1) <= X(1) and Y(1);
XY0(2) <= X(2) and Y(0); XY1(2) <= X(2) and Y(1);
XY0(3) <= X(3) and Y(0); XY1(3) <= X(3) and Y(1);

XY2(0) <= X(0) and Y(2); XY3(0) <= X(0) and Y(3);
XY2(1) <= X(1) and Y(2); XY3(1) <= X(1) and Y(3);
XY2(2) <= X(2) and Y(2); XY3(2) <= X(2) and Y(3);
XY2(3) <= X(3) and Y(2); XY3(3) <= X(3) and Y(3);

FA1: FA port map( XY0(2), XY1(1), C1(0), C1(1), S1(1));
FA2: FA port map( XY0(3), XY1(2), C1(1), C1(2), S1(2));
FA3: FA port map( S2(2), XY2(1), C2(0), C2(1), S2(1));
FA4: FA port map( S2(3), XY2(2), C2(1), C2(2), S2(2));
FA5: FA port map( C1(3), XY2(3), C2(2), C2(3), S2(3));
FA6: FA port map( S2(2), XY3(1), C3(0), C3(1), S3(1));
FA7: FA port map( S2(3), XY3(2), C3(1), C3(2), S3(2));
FA8: FA port map( C2(3), XY3(3), C3(2), C3(3), S3(3));
HA1: HA port map( XY0(1), XY1(0), C1(0), S1(0));
HA2: HA port map( XY1(3), C1(2), C1(3), S1(3));
HA3: HA port map( S1(1), XY2(0), C2(0), S2(0));
HA4: HA port map( S2(1), XY3(0), C3(0), S3(0));

P(0) <= XY0(0); P(1) <= S1(0); P(2) <= S2(0);
P(3) <= S3(0); P(4) <= S3(1); P(5) <= S3(2);
P(6) <= S3(3); P(7) <= C3(3);

end Behavioral;