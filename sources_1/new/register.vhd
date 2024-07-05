----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 04/22/2024 08:38:30 PM
-- Design Name: 8 bit REGISTER
-- Module Name: register8bit - behavioral
-- Project Name: Microcontroller
-- Target Devices: ARTIX-7 100T
-- Tool Versions: 
-- Description: 
--     performs LOAD and HOLD operations, based on selection input S
--     asynchronous RESET
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register8bit is
    Port ( INPUT : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end register8bit;

architecture behavioral of register8bit is

begin
    process(CLK, RESET)
    variable INTERN: std_logic_vector(7 downto 0) := (others => '0');
    begin
        if RESET = '1' then
                INTERN := (others => '0');
        else
            if CLK'EVENT and CLK = '1' then
                if S = '1' then
                        INTERN := INPUT;
                end if;
            end if;
        end if;
        Q <= INTERN;
    end process;
end behavioral;