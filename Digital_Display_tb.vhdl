library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Digital_Display_tb is
end Digital_Display_tb;

architecture Behavioral of Digital_Display_tb is

    component Lab5C_Display_Digits
        Port (
            Count        : in  STD_LOGIC_VECTOR(3 downto 0);
            Cathode_7SD  : out STD_LOGIC_VECTOR(7 downto 0);
            Anode_7SD    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal Count_tb       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Cathode_7SD_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal Anode_7SD_tb   : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: Lab5C_Display_Digits
        port map (
            Count       => Count_tb,
            Cathode_7SD => Cathode_7SD_tb,
            Anode_7SD   => Anode_7SD_tb
        );

    stim_proc : process
    begin
        Count_tb <= "0000"; wait for 20 ns;
        Count_tb <= "0001"; wait for 20 ns;
        Count_tb <= "0010"; wait for 20 ns;
        Count_tb <= "0011"; wait for 20 ns;
        Count_tb <= "0100"; wait for 20 ns;
        Count_tb <= "0101"; wait for 20 ns;
        Count_tb <= "0110"; wait for 20 ns;
        Count_tb <= "0111"; wait for 20 ns;
        Count_tb <= "1000"; wait for 20 ns;
        Count_tb <= "1001"; wait for 20 ns;
        Count_tb <= "1010"; wait for 20 ns;
        Count_tb <= "1011"; wait for 20 ns;
        Count_tb <= "1100"; wait for 20 ns;
        Count_tb <= "1101"; wait for 20 ns;
        Count_tb <= "1110"; wait for 20 ns;
        Count_tb <= "1111"; wait for 20 ns;

        wait;
    end process;

end Behavioral;
