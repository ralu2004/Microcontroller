----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Eduard Cavasi
-- 
-- Create Date: 05/03/2024 02:38:52 PM
-- Design Name: Frequency divider
-- Module Name: freq_divisor - Behavioral
-- Project Name: Microcontroller
-- Target Devices: Artix-7 100T
-- Tool Versions: 
-- Description: 
--      divides the frequency from 100MHz to 1Hz
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

entity freq_divisor is
    Port ( CLK100 : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CLK : out STD_LOGIC);
end freq_divisor;

architecture Behavioral of freq_divisor is

begin
    process(CLK100, RESET)
        constant STOP: INTEGER := 100_000_000;
        variable INTERN: INTEGER := 0;
        variable PULSE: STD_LOGIC := '0';
    begin 
        if RESET = '1' then
            INTERN := 0;
        else
            if CLK100'EVENT and CLK100 = '1' then
                INTERN := INTERN + 1;
                if INTERN = STOP then
                    PULSE := not PULSE;
                    INTERN := 0;
                end if;
            end if;
        end if;
        CLK <= PULSE;
    end process;

end Behavioral;
