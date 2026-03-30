library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Stopwatch_Top_Module is
    Port (
        Clk_System  : in  STD_LOGIC;
        Reset       : in  STD_LOGIC;
        Cathode_7SD_Loc : out STD_LOGIC_VECTOR(7 downto 0);
        Anode_7SD_Loc   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Stopwatch_Top_Module;

architecture Behavioral of Stopwatch_Top_Module is

    component Four_Bit_Counter_Modularized is
        Port (
            Clk_Sys : in  STD_LOGIC;
            Reset   : in  STD_LOGIC;
            Count   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Digital_Display is
        Port (
            Count       : in  STD_LOGIC_VECTOR(3 downto 0);
            Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
            Anode_7SD   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal Count_4_Bit_Local : STD_LOGIC_VECTOR(3 downto 0);

begin

    Counter_Inst : Four_Bit_Counter_Modularized
        port map (
            Clk_Sys => Clk_System,
            Reset   => Reset,
            Count   => Count_4_Bit_Local
        );
    
    Display_Inst : Digital_Display
        port map (
            Count       => Count_4_Bit_Local,
            Cathode_7SD => Cathode_7SD_Loc,
            Anode_7SD   => Anode_7SD_Loc
        );

end Behavioral;
