----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2026 12:13:37 AM
-- Design Name: 
-- Module Name: Four_Bit_Modularized_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_Bit_Modularized_tb is
--  Port ( );
end Four_Bit_Modularized_tb;

architecture Behavioral of Four_Bit_Modularized_tb is

component Four_Bit_Counter_Modularized is
    Port ( Clk_Sys : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk_Sys_Loc : STD_LOGIC;      
signal Reset_Loc : STD_LOGIC;

begin

    uut: Four_Bit_Counter_Modularized Port map(
        Clk_Sys => Clk_Sys_Loc,
        Reset => Reset_Loc);
    
    
    
end Behavioral;
