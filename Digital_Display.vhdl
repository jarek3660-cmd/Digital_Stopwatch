library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Stopwatch_Top_Module_tb is
--()Port
end Stopwatch_Top_Module_tb;

architecture Behavioral of Stopwatch_Top_Module_tb is

    signal Clk_System_tb  : std_logic := '0';
    signal Reset_tb       : std_logic := '0';
    signal Cathode_7SD_tb : std_logic_vector(7 downto 0);
    signal Anode_7SD_tb   : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 10 ns;
    
    component Stopwatch_Top_Module is
        Port (
            Clk_System  : in  STD_LOGIC;
            Reset       : in  STD_LOGIC;
            Cathode_7SD_Loc : out STD_LOGIC_VECTOR(7 downto 0);
            Anode_7SD_Loc   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
begin

    DUT : Stopwatch_Top_Module
        port map (
            Clk_System      => Clk_System_tb,
            Reset           => Reset_tb,
            Cathode_7SD_Loc => Cathode_7SD_tb,
            Anode_7SD_Loc   => Anode_7SD_tb
        );

    clk_process : process
    begin
        Clk_System_tb <= '0';
        wait for CLK_PERIOD/2;
        Clk_System_tb <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_process : process
    begin
        Reset_tb <= '1';
        wait for 10 ns;
        Reset_tb <= '0';
        wait for 10 ns;
        wait;
    end process;

end Behavioral;
