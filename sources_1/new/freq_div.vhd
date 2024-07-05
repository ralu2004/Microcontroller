----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 04/23/2024 
-- Design Name: Frequency Divider
-- Module Name: simpleClockDiv - behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity simpleClockDiv is
    Port ( clk100 : in STD_LOGIC;
           N15_13 : out STD_LOGIC_VECTOR(2 downto 0));
end simpleClockDiv;

architecture div of simpleClockDiv is

begin

process(clk100)
variable count: std_logic_vector(15 downto 0) := (others => '0');
begin
    if (clk100'event) and (clk100 = '1') then
            count := count + 1; 
    end if; 
    N15_13(2) <= count(15);
    N15_13(1) <= count(14);
    N15_13(0) <= count(13);
end process;
end div;