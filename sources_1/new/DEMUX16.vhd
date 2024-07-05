
----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 04/23/2024 12:16:50 PM
-- Design Name: DMUX 1:16 with 8-bit datapath
-- Module Name: dmux1to16 - behavioral
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

entity dmux1to16 is
       Port (INPUT: in STD_LOGIC;
               SEL : in STD_LOGIC_VECTOR (3 downto 0);
               OUT0 : out STD_LOGIC;
               OUT1 : out STD_LOGIC;
               OUT2 : out STD_LOGIC;
               OUT3 : out STD_LOGIC;
               OUT4 : out STD_LOGIC;
               OUT5 : out STD_LOGIC;
               OUT6 : out STD_LOGIC;
               OUT7 : out STD_LOGIC;
               OUT8 : out STD_LOGIC;
               OUT9 : out STD_LOGIC;
               OUT10 : out STD_LOGIC;
               OUT11 : out STD_LOGIC;
               OUT12 : out STD_LOGIC;
               OUT13 : out STD_LOGIC;
               OUT14 : out STD_LOGIC;
               OUT15 : out STD_LOGIC);
end dmux1to16;

architecture behavioral of dmux1to16 is

begin
    process(INPUT, SEL)
    begin
        OUT0 <= '0';
        OUT1 <= '0';
        OUT2 <= '0';
        OUT3 <= '0';
        OUT4 <= '0';
        OUT5 <= '0';
        OUT6 <= '0';
        OUT7 <= '0';
        OUT8 <= '0';
        OUT9 <= '0';
        OUT10 <= '0';
        OUT11 <= '0';
        OUT12 <= '0';
        OUT13 <= '0';
        OUT14 <= '0';
        OUT15 <= '0';
        case SEL is
            when "0000" => OUT0 <= INPUT;
            when "0001" => OUT1 <= INPUT;
            when "0010" => OUT2 <= INPUT;
            when "0011" => OUT3 <= INPUT;
            when "0100" => OUT4 <= INPUT;
            when "0101" => OUT5 <= INPUT;
            when "0110" => OUT6 <= INPUT;
            when "0111" => OUT7 <= INPUT;
            when "1000" => OUT8 <= INPUT;
            when "1001" => OUT9 <= INPUT;
            when "1010" => OUT10 <= INPUT;
            when "1011" => OUT11 <= INPUT;
            when "1100" => OUT12 <= INPUT;
            when "1101" => OUT13 <= INPUT;
            when "1110" => OUT14 <= INPUT;
            when "1111" => OUT15 <= INPUT;
            when others => null;
        end case;
    end process;

end behavioral;
