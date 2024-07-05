----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 04/23/2024 
-- Design Name: MUX8to1 
-- Module Name: MUX8to1 - behavioral
-- Project Name: Microcontroller
-- Target Devices: ARTIX-7 100T
-- Tool Versions: 
-- Description: 
--      n-bit datapath
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

entity MUX8to1 is
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
end MUX8to1;

architecture Behavioral of MUX8to1 is

begin
    process(I0, I1, I2, I3, I4, I5, I6, I7, SEL)
    begin
        case SEL is
            when "000" =>   O <= I0;
            when "001" =>   O <= I1;
            when "010" =>   O <= I2;
            when "011" =>   O <= I3;
            when "100" =>   O <= I4;
            when "101" =>   O <= I5;
            when "110" =>   O <= I6;
            when "111" =>   O <= I7;
            when others => null;
        end case;
    end process;

end Behavioral;