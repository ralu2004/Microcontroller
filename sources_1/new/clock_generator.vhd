----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 05/03/2024 02:38:52 PM
-- Design Name: Clock Generator
-- Module Name: clk_gen - Behavioral
-- Project Name: Microcontroller
-- Target Devices: Artix-7 100T
-- Tool Versions: 
-- Description: 
--      the device requires 3 different clock signals, to enable 
--      the major blocks(ROM, Instruction Decoder, Registers) to function 
--      independently
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


entity clk_gen is
    Port ( RESET : in STD_LOGIC;    --asynchronous
           CLK : in STD_LOGIC;
           CLK0 : out STD_LOGIC;    --ROM clock
           CLK1 : out STD_LOGIC;    --DECODE CLOCK
           CLK2 : out STD_LOGIC);   --Register clock
end clk_gen;

architecture Behavioral of clk_gen is

begin
    process(CLK, RESET)
    variable count: std_logic_vector(2 downto 0) := (others => '0');
    begin
        if RESET = '1' then
            count := (others => '0');
        else
            if (CLK'event) and (CLK = '1') then
                if count = "000" then count := "001";
                elsif count = "001" then count := "010";
                elsif count = "010" then count := "100";
                elsif count = "100" then count := "001";
                end if;
            end if; 
        end if;
        CLK0 <= count(0);
        CLK1 <= count(1);
        CLK2 <= count(2);
    end process;

end Behavioral;