----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam (0 - 8), Eduard Cavasi (9 - F)
-- 
-- Create Date: 04/23/2024 
-- Design Name: BCD to SSD decoder
-- Module Name: BCDtoSSD - behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCDtoSSD is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end BCDtoSSD;

architecture Behavioral of BCDtoSSD is

begin
    process(I)
    begin
        O <= (others => '1');
        if I = x"0" then 
            O(0) <= '0';
            O(1) <= '0';
            O(2) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(5) <= '0';
        elsif I = x"1" then 
            O(1) <= '0';
            O(2) <= '0';
        elsif I = x"2" then
            O(0) <= '0';
            O(1) <= '0';
            O(6) <= '0'; 
            O(4) <= '0';
            O(3) <= '0';
        elsif I = x"3" then
            O(0) <= '0';
            O(1) <= '0'; 
            O(6) <= '0'; 
            O(2) <= '0';
            O(3) <= '0';
        elsif I = x"4" then 
            O(5) <= '0';
            O(6) <= '0'; 
            O(1) <= '0';
            O(2) <= '0';
        elsif I = x"5" then 
            O(0) <= '0';
            O(5) <= '0'; 
            O(6) <= '0';
            O(2) <= '0';
            O(3) <= '0';
        elsif I = x"6" then 
            O(0) <= '0'; 
            O(2) <= '0';
            O(4) <= '0';
            O(3) <= '0';
            O(6) <= '0';
            O(5) <= '0';
        elsif I = x"7" then
            O(0) <= '0'; 
            O(1) <= '0';
            O(2) <= '0';
        elsif I = x"8" then
            O(0) <= '0';
            O(1) <= '0';
            O(2) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        elsif I = x"9" then 
            O(0) <= '0';
            O(1) <= '0';
            O(2) <= '0';
            O(3) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        elsif I = x"A" then 
            O(0) <= '0';
            O(1) <= '0';
            O(2) <= '0';
            O(4) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        elsif I = x"B" then 
            O(2) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        elsif I = x"C" then 
            O(0) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(5) <= '0';
        elsif I = x"D" then 
            O(1) <= '0';
            O(2) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(6) <= '0';
        elsif I = x"E" then 
            O(0) <= '0';
            O(3) <= '0';
            O(4) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        elsif I = x"F" then 
            O(0) <= '0';
            O(4) <= '0';
            O(5) <= '0';
            O(6) <= '0';
        end if;
    end process;

end Behavioral;