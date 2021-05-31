library STD;
use STD.textio.all;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test IS PORT(
cnt : integer:=5;
MAX_COUNT : integer:=9;
x : IN STD_LOGIC

);
END test;
architecture behavior of test is
begin
  process (x)
    variable s : line;
    variable cnt : integer:=0;
  begin
    if (x='1' and x'last_value='0') then
      cnt:=cnt+1;
      if (cnt>MAX_COUNT) then
        write(s,"Counter overflow - ");
        write(s,cnt);
        writeline(output,s);
      end if;
    end if;
  end process;
end behavior;
