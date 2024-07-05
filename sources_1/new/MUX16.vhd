----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 04/23/2024 11:25:49 AM
-- Design Name: MUX 16:1 with 8-bit datapath
-- Module Name: mux16to1 - behavioral
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

entity mux16to1 is
    Port ( IN0 : in STD_LOGIC_VECTOR (7 downto 0);
           IN1 : in STD_LOGIC_VECTOR (7 downto 0);
           IN2 : in STD_LOGIC_VECTOR (7 downto 0);
           IN3 : in STD_LOGIC_VECTOR (7 downto 0);
           IN4 : in STD_LOGIC_VECTOR (7 downto 0);
           IN5 : in STD_LOGIC_VECTOR (7 downto 0);
           IN6 : in STD_LOGIC_VECTOR (7 downto 0);
           IN7 : in STD_LOGIC_VECTOR (7 downto 0);
           IN8 : in STD_LOGIC_VECTOR (7 downto 0);
           IN9 : in STD_LOGIC_VECTOR (7 downto 0);
           IN10 : in STD_LOGIC_VECTOR (7 downto 0);
           IN11 : in STD_LOGIC_VECTOR (7 downto 0);
           IN12 : in STD_LOGIC_VECTOR (7 downto 0);
           IN13 : in STD_LOGIC_VECTOR (7 downto 0);
           IN14 : in STD_LOGIC_VECTOR (7 downto 0);
           IN15 : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT: out STD_LOGIC_VECTOR (7 downto 0));
end mux16to1;

architecture behavioral of mux16to1 is

begin
    OUTPUT <= IN0 when SEL = "0000" else
              IN1 when SEL = "0001" else
              IN2 when SEL = "0010" else
              IN3 when SEL = "0011" else
              IN4 when SEL = "0100" else
              IN5 when SEL = "0101" else
              IN6 when SEL = "0110" else
              IN7 when SEL = "0111" else
              IN8 when SEL = "1000" else
              IN9 when SEL = "1001" else
              IN10 when SEL = "1010" else
              IN11 when SEL = "1011" else
              IN12 when SEL = "1100" else
              IN13 when SEL = "1101" else
              IN14 when SEL = "1110" else
              IN15 when SEL = "1111";
end behavioral;