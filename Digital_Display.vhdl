library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Display_Digits is
    Port (
        Count        : in  STD_LOGIC_VECTOR(3 downto 0);
        Cathode_7SD  : out STD_LOGIC_VECTOR(7 downto 0);
        Anode_7SD    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Display_Digits;

architecture Behavioral of Display_Digits is
begin

    -- Activate LEFTMOST digit (bit 7 = 0)
    Anode_7SD <= "01111111";

    process(Count)
    begin
        case Count is
            when "0000" => Cathode_7SD <= "00000011"; -- 0
            when "0001" => Cathode_7SD <= "10011111"; -- 1
            when "0010" => Cathode_7SD <= "00100101"; -- 2
            when "0011" => Cathode_7SD <= "00001101"; -- 3
            when "0100" => Cathode_7SD <= "10011001"; -- 4
            when "0101" => Cathode_7SD <= "01001001"; -- 5
            when "0110" => Cathode_7SD <= "01000001"; -- 6
            when "0111" => Cathode_7SD <= "00011111"; -- 7
            when "1000" => Cathode_7SD <= "00000001"; -- 8
            when "1001" => Cathode_7SD <= "00001001"; -- 9
            when "1010" => Cathode_7SD <= "00010001"; -- A
            when "1011" => Cathode_7SD <= "11000001"; -- b
            when "1100" => Cathode_7SD <= "01100011"; -- C
            when "1101" => Cathode_7SD <= "10000101"; -- d
            when "1110" => Cathode_7SD <= "01100001"; -- E
            when "1111" => Cathode_7SD <= "01110001"; -- F
            when others => Cathode_7SD <= "11111111"; -- all off
        end case;
    end process;

end Behavioral;
