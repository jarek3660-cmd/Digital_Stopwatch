----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2026 07:24:39 PM
-- Design Name: 
-- Module Name: Four_Bit_Counter_Modularized - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_Bit_Counter_Modularized is
    Port ( Clk_Sys : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end Four_Bit_Counter_Modularized;

architecture Behavioral of Four_Bit_Counter_Modularized is
    component Frequency_Divider is
        Port ( Clock_System : in STD_LOGIC;
               Clock_1Hz : out STD_LOGIC);
    end component;
    
    component D_Flip_Flop is
        Port ( D,CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;
    
    signal temp    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal notTemp : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk_1Hz : STD_LOGIC := '0';
    
begin
    notTemp <= not(temp);
    fd:  Frequency_Divider port map(Clock_System => Clk_Sys, Clock_1Hz => Clk_1Hz);
    ff0: D_Flip_Flop port map(D => notTemp(0), CLK => Clk_1Hz, Q => temp(0), CLR => Reset);
    ff1: D_Flip_Flop port map(D => notTemp(1), CLK => temp(0), Q => temp(1), CLR => Reset);
    ff2: D_Flip_Flop port map(D => notTemp(2), CLK => temp(1), Q => temp(2), CLR => Reset);
    ff3: D_Flip_Flop port map(D => notTemp(3), CLK => temp(2), Q => temp(3), CLR => Reset);
    Count <= temp;
end Behavioral;
