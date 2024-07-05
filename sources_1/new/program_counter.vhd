
----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 05/03/2024 03:49:18 PM
-- Design Name: Program Counter
-- Module Name: ProgramCounter - Behavioral
-- Project Name: Microcontroller
-- Target Devices: Artix-7 100T
-- Tool Versions: 
-- Description: 
--      direct counter on 8 bits
--      asynchronous RESET
--      synchronous LOAD 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgramCounter is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           INPUT : in STD_LOGIC_VECTOR (7 downto 0);
           ADDRESS : out STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
begin
    process(CLK, RESET)
    variable count: std_logic_vector(7 downto 0) := (others => '0');
    begin
        if RESET = '1' then
                count := (others => '0');
        else
            if (CLK'event) and (CLK = '1') then
                if LOAD = '1' then
                        count := INPUT;
                else
                    count := count + 1;
                end if;
            end if;
        end if;
        ADDRESS <= count;
    end process;
end Behavioral;
