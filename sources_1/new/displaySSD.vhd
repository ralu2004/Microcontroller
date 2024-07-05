----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam, Eduard Cavasi
-- 
-- Create Date: 04/23/2024 
-- Design Name: Display SSD
-- Module Name: displaySSD - behavioral
-- Project Name: Microcontroller
-- Target Devices: ARTIX-7 100T
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


entity displaySSD is
    Port ( clk100 : in STD_LOGIC;
           ca : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           result: in STD_LOGIC_VECTOR(7 downto 0));
end displaySSD;

architecture Behavioral of displaySSD is

component simpleClockDiv is
    Port ( clk100 : in STD_LOGIC;
           N15_13 : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component BCDtoSSD is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component MUX8to1 is
    generic(datapath: natural := 4);
    Port ( I0 : in STD_LOGIC_VECTOR (datapath downto 1);
           I1 : in STD_LOGIC_VECTOR (datapath downto 1);
           I2 : in STD_LOGIC_VECTOR (datapath downto 1);
           I3 : in STD_LOGIC_VECTOR (datapath downto 1);
           I4 : in STD_LOGIC_VECTOR (datapath downto 1);
           I5 : in STD_LOGIC_VECTOR (datapath downto 1);
           I6 : in STD_LOGIC_VECTOR (datapath downto 1);
           I7 : in STD_LOGIC_VECTOR (datapath downto 1);
           SEL: in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (datapath downto 1));
end component;

signal SEL: std_logic_vector(2 downto 0);
signal CONNECT1: std_logic_vector(3 downto 0);

begin
divider: simpleClockDiv port map(clk100 => clk100, N15_13 => SEL);
mux1: MUX8to1 generic map(4)
              port map(I0 => x"0", I1 => x"0", I2 => x"0", I3 => x"0", I4 => x"0", I5 => x"0", I6 => result(7 downto 4), I7 => result(3 downto 0), SEL => SEL, O => CONNECT1);
mux2: MUX8to1 generic map(8)
              port map(I0 => "11111110",
                       I1 => "11111101",
                       I2 => "11111011",
                       I3 => "11110111",
                       I4 => "11101111",
                       I5 => "11011111",
                       I6 => "10111111",
                       I7 => "01111111",
                       SEL => SEL,
                       O => an);
decoder: BCDtoSSD port map(I => CONNECT1, O => ca);                                           

end Behavioral;