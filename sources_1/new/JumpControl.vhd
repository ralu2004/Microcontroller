----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Raluca Adam
-- 
-- Create Date: 05/04/2024 07:44:44 PM
-- Design Name: Jump Control
-- Module Name: JumpCtrl - Behavioral
-- Project Name: Microcontroller
-- Target Devices: Artix-7 100T
-- Tool Versions: 
-- Description: 
--             SIG output signal will activate LOAD in the Program Counter if a jump is performed
--             ADDRESS will be loaded in the Program Counter in that case
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity JumpCtrl is
    Port ( INS : in STD_LOGIC_VECTOR (15 downto 0);
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           ZF: in STD_LOGIC;
           CF: in STD_LOGIC;
           ADDRESS : out STD_LOGIC_VECTOR (7 downto 0);
           SIG : out STD_LOGIC;
           JMP_SIG: out STD_LOGIC);
end JumpCtrl;

architecture Behavioral of JumpCtrl is

begin
     process(CLK, RESET)
     begin
        if RESET = '1' then
            ADDRESS <= (others => '0');
            SIG <= '0';
        else
            if (CLK'event) and (CLK = '1') then
                JMP_SIG <= '0'; --we don`t know if current instruction is a jump instruction
                SIG <= '0'; --unless all cond are satisf do not load anything into the Program Counter
                if INS(15 downto 13) = "100" then --jump op code
                    JMP_SIG <= '1'; -- if it was indeed a jump instruction
                    if INS(12) = '0' then --unconditional jump
                        ADDRESS <= INS(7 downto 0);
                        SIG <= '1';
                    elsif INS(12) = '1' then --conditional jump
                        case INS(11 downto 10) is
                            --jump zero
                            when "00" => if ZF = '1' then
                                            ADDRESS <= INS(7 downto 0);
                                            SIG <= '1'; 
                                         end if; 
                            --jump NOT zero
                            when "01" => if ZF = '0' then
                                            ADDRESS <= INS(7 downto 0);
                                            SIG <= '1'; 
                                         end if; 
                            --jump carry
                            when "10" => if CF = '1' then
                                            ADDRESS <= INS(7 downto 0);
                                            SIG <= '1'; 
                                         end if; 
                            --jump not carry
                            when "11" => if CF = '0' then
                                            ADDRESS <= INS(7 downto 0);
                                            SIG <= '1'; 
                                         end if; 
                            when others => null;
                        end case;
                    end if;
                end if;
            end if;
        end if;
     end process;
end Behavioral;