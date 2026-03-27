library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port ( D, CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is
begin
    process(CLK, CLR)
    begin
        if CLR = '1' then
            Q <= '0';
        elsif rising_edge(CLK) then
            Q <= D;
        end if;
    end process;
end Behavioral;
