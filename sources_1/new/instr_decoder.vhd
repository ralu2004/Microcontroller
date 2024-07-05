----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Eduard Cavasi
-- 
-- Create Date: 05/01/2024 10:50:59 AM
-- Design Name: 
-- Module Name: instr_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
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

entity instr_decoder is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (15 downto 0);
           OP1 : out STD_LOGIC_VECTOR (3 downto 0);
           OP2 : out STD_LOGIC_VECTOR (3 downto 0);
           INS_SEL : out STD_LOGIC_VECTOR (3 downto 0);
           INS_OP : out STD_LOGIC_VECTOR (3 downto 0);
           K : out STD_LOGIC_VECTOR (7 downto 0));
end instr_decoder;

architecture Behavioral of instr_decoder is

begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            OP1 <= (others => '0');
            OP2 <= (others => '0');
            INS_SEL <= (others => '0');
            INS_OP <= (others => '0');
            K <= (others => '0');
        else
            if CLK'EVENT and CLK = '1' then
                OP1 <= INS(11 downto 8);
                OP2 <= INS(7 downto 4);
                INS_SEL <= INS(15 downto 12);
                INS_OP <= INS(3 downto 0);
                K <= INS(7 downto 0);
            end if;
        end if;
    end process;

end Behavioral;
