----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam, Eduard Cavasi
-- 
-- Create Date: 05/04/2024 02:43:53 PM
-- Design Name: Program ROM
-- Module Name: Program_ROM - Behavioral
-- Project Name: Microcontroller
-- Target Devices: Artix-7 100T
-- Tool Versions: 
-- Description: program to test the functionalities of the Microcontroller
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

entity Program_ROM is
    Port (CLK: in STD_LOGIC;
          ADDRESS: in STD_LOGIC_VECTOR(7 downto 0);
          INSTRUCTION: out STD_LOGIC_VECTOR(15 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

begin
    process(CLK)
    begin
        if CLK'EVENT and CLK = '1' then
            case ADDRESS is
                when x"00" => INSTRUCTION <= "0000000000000010";       --LOAD REG0, 2
                when x"01" => INSTRUCTION <= "0000000100000011";       --LOAD REG1, 3
                when x"02" => INSTRUCTION <= "1100000000010100";       --ADD REG0, REG1
                when x"03" => INSTRUCTION <= "0100000000000111";       --ADD REG0, 7
                when x"04" => INSTRUCTION <= "0001000011110000";       --AND REG0, 240
                when x"05" => INSTRUCTION <= "1100000000010000";       --LOAD REG0, REG1
                when x"06" => INSTRUCTION <= "0110000000000011";       --SUB REG0, 3    (ZF = 1)
                when x"07" => INSTRUCTION <= "1001100100001001";       --JC TO X"09" (shloudn't be taken)
                when x"08" => INSTRUCTION <= "0000000000000001";       --LOAD REG0, 1 
                when x"09" => INSTRUCTION <= "0011000000000011";       --XOR REG0, REG1
                when x"0A" => INSTRUCTION <= "0010000000010101";       --OR REG0, 21
                when x"0B" => INSTRUCTION <= "1101000000001111";       --SR1 REG0
                when x"0C" => INSTRUCTION <= "1101000000000110";       --SL0 REG0
                when x"0D" => INSTRUCTION <= "1101000000000010";       --RL REG0
                when x"0E" => INSTRUCTION <= "1101000000001000";       --SRA REG0
                when x"0F" => INSTRUCTION <= "1000000100010001";       --JMP TO X"11" (should jump)
                when x"10" => INSTRUCTION <= "0000000000001000";       --LOAD REG0, 8 (skipped)
                when x"11" => INSTRUCTION <= "0000000000001111";       --LOAD REG0, 15 (see 15, means jump was executed)
                when x"12" => INSTRUCTION <= "0100000011110110";       --ADD REG0, 246 (CF = 1)
                when x"13" => INSTRUCTION <= "0000000000001110";       --LOAD REG0, 14
                when x"14" => INSTRUCTION <= "0111000000001100";       --SUBCY REG0, 12 
                when x"15" => INSTRUCTION <= "1001010100010111";       --JNZ TO X"17"
                when x"16" => INSTRUCTION <= "0110000000000001";       --SUB REG0, 1 (skipped)
                when x"17" => INSTRUCTION <= "1101000000001100";       --RR REG0 
                when others => INSTRUCTION <= "UUUUUUUUUUUUUUUU";
            end case;
        end if;
            
    end process;
end Behavioral;