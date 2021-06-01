library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity float_sub is
    port (
        a   : in std_logic_vector(31 downto 0);
        b   : in std_logic_vector(31 downto 0);
        sub : out std_logic_vector(31 downto 0)
    );
end float_sub;

architecture Behavioral of float_sub is

begin

    process (a, b)

        variable avar                : std_logic_vector(31 downto 0) := a;
        variable bvar                : std_logic_vector(31 downto 0) := b;
        variable subvar              : std_logic_vector(31 downto 0);
        variable tempsub             : std_logic_vector(23 downto 0);
        variable exponent_difference : integer;

    begin

        -- check if a or b equals zero
        if (to_integer(unsigned(a)) = 0) then
            subvar := not(bvar(31)) & bvar(30 downto 0);
        elsif (to_integer(unsigned(bvar)) = 0) then
            subvar := avar;
        else
            exponent_difference := to_integer(unsigned(avar(30 downto 23))) - to_integer(unsigned(bvar(30 downto 23)));

            -- shifting smaller exp to right exponent_difference times
            if (exponent_difference >= 0) then
                subvar(30 downto 23) := avar(30 downto 23);
                bvar(22 downto 0)    := to_stdlogicvector(to_bitvector(bvar(22 downto 0)) srl exponent_difference);
            else
                subvar(30 downto 23) := bvar(30 downto 23);
                avar(22 downto 0)    := to_stdlogicvector(to_bitvector(avar(22 downto 0)) srl -1 * exponent_difference);
            end if;

            -- subtracting the fractions
            if (avar(31) = '0') then
                if (bvar(31) = '0') then -- a>0 and b>0
                    if (unsigned(avar(22 downto 0)) > unsigned(bvar(22 downto 0))) then
                        subvar(31) := '0';
                    else
                        subvar(31) := '1';
                    end if;
                    tempsub := std_logic_vector(unsigned('1' & avar(22 downto 0)) - unsigned('1' & bvar(22 downto 0)));
                else -- a>0 and b<0
                    subvar(31) := '0';
                    tempsub    := std_logic_vector(unsigned('1' & avar(22 downto 0)) + unsigned('1' & bvar(22 downto 0)));
                end if;
            else
                if (bvar(31) = '0') then -- a<0 and b>0
                    if (unsigned(bvar(22 downto 0)) > unsigned(avar(22 downto 0))) then
                        subvar(31) := '0';
                    else
                        subvar(31) := '1';
                    end if;
                    tempsub := std_logic_vector(unsigned('1' & bvar(22 downto 0)) - unsigned('1' & avar(22 downto 0)));
                else -- a<0 and b<0
                    subvar(31) := '1';
                    tempsub    := std_logic_vector(unsigned('1' & bvar(22 downto 0)) + unsigned('1' & avar(22 downto 0)));
                end if;
            end if;

            -- overflow
            if (tempsub(23) = '1') then
                tempsub              := to_stdlogicvector(to_bitvector(tempsub) sll 1);
                subvar(30 downto 23) := std_logic_vector(unsigned(avar(30 downto 23)) + 1);

            end if;

            -- set fraction and sign of sub variable
            subvar(22 downto 0) := std_logic_vector(tempsub(22 downto 0));

            -- normalizing
            while (subvar(22) = '0') loop
                subvar(22 downto 0)  := to_stdlogicvector(to_bitvector(subvar(22 downto 0)) sll 1);
                subvar(30 downto 23) := std_logic_vector(unsigned(subvar(30 downto 23)) + 1);
            end loop;
            if (subvar(31) = '1') then
                subvar(22 downto 0)  := to_stdlogicvector(to_bitvector(subvar(22 downto 0)) sll 1);
                subvar(30 downto 23) := std_logic_vector(unsigned(subvar(30 downto 23)) + 1);
            end if;
        end if;

        -- set output
        sub <= subvar;
    end process;

end Behavioral;