----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Eduard Cavasi
-- 
-- Create Date: 04/20/2024 01:49:03 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           OPCODE: in STD_LOGIC_VECTOR(3 downto 0);
           CIN: in STD_LOGIC;
           ZIN: in STD_LOGIC;
           RES: out STD_LOGIC_VECTOR (7 downto 0);
           CF : out STD_LOGIC;
           ZF : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal ALU_ADD: STD_LOGIC_VECTOR(8 downto 0);
signal RESULT: STD_LOGIC_VECTOR(7 downto 0);
signal C: STD_LOGIC;

begin
    ALU:process(A, B, SEL, OPCODE, CIN, ZIN)
    begin
        C <= '0';
        ALU_ADD <= "000000000";
        case SEL is
            --LOAD
            when "0000" =>
                RESULT <= B;
            --AND
            when "0001" =>
                RESULT <= A AND B;
            --OR
            when "0010" =>
                RESULT <= A OR B;
            --XOR
            when "0011" =>
                RESULT <= A xor B;
            --ADD
            when "0100" =>
                RESULT <= A + B;
                ALU_ADD <= ('0' & A) + ('0' & B);
            --ADDCY
            when "0101" =>
                RESULT <= A + B + CIN;
                ALU_ADD <= ('0' & A) + ('0' & B) + CIN;
            --SUB
            when "0110" =>
                RESULT <= A - B;
                ALU_ADD <= ('0' & A) - ('0' & B);
            --SUBCY
            when "0111" =>
                RESULT <= A - B - CIN;
                ALU_ADD <= ('0' & A) - ('0' & B) - CIN;
            when others => 
                if SEL =  "1101" then
                    case OPCODE is
                        --SR0
                        when "1110" =>
                            C <= A(0);
                            RESULT(7) <= '0';
                            RESULT(0) <= A(1);
                            RESULT(1) <= A(2);
                            RESULT(2) <= A(3);
                            RESULT(3) <= A(4);
                            RESULT(4) <= A(5);
                            RESULT(5) <= A(6);
                            RESULT(6) <= A(7);
                        --SR1
                        when "1111" =>
                            C <= A(0);
                            RESULT(7) <= '1';
                            RESULT(0) <= A(1);
                            RESULT(1) <= A(2);
                            RESULT(2) <= A(3);
                            RESULT(3) <= A(4);
                            RESULT(4) <= A(5);
                            RESULT(5) <= A(6);
                            RESULT(6) <= A(7);
                        --SRX
                        when "1010" =>
                            C <= A(0);
                            RESULT(7) <= A(7);
                            RESULT(0) <= A(1);
                            RESULT(1) <= A(2);
                            RESULT(2) <= A(3);
                            RESULT(3) <= A(4);
                            RESULT(4) <= A(5);
                            RESULT(5) <= A(6);
                            RESULT(6) <= A(7);
                        --SRA
                        when "1000" =>
                            C <= A(0);
                            RESULT(7) <= CIN;
                            RESULT(0) <= A(1);
                            RESULT(1) <= A(2);
                            RESULT(2) <= A(3);
                            RESULT(3) <= A(4);
                            RESULT(4) <= A(5);
                            RESULT(5) <= A(6);
                            RESULT(6) <= A(7);
                        --RR 
                        when "1100" =>
                            C <= A(0);
                            RESULT(7) <= A(0);
                            RESULT(0) <= A(1);
                            RESULT(1) <= A(2);
                            RESULT(2) <= A(3);
                            RESULT(3) <= A(4);
                            RESULT(4) <= A(5);
                            RESULT(5) <= A(6);
                            RESULT(6) <= A(7);
                        --SL0
                        when "0110" =>
                            C <= A(7);
                            RESULT(0) <= '0';
                            RESULT(1) <= A(0);
                            RESULT(2) <= A(1);
                            RESULT(3) <= A(2);
                            RESULT(4) <= A(3);
                            RESULT(5) <= A(4);
                            RESULT(6) <= A(5);
                            RESULT(7) <= A(6);
                        --SL1
                        when "0111" =>
                            C <= A(7);
                            RESULT(0) <= '1';
                            RESULT(1) <= A(0);
                            RESULT(2) <= A(1);
                            RESULT(3) <= A(2);
                            RESULT(4) <= A(3);
                            RESULT(5) <= A(4);
                            RESULT(6) <= A(5);
                            RESULT(7) <= A(6);
                        --SLX
                        when "0100" =>
                            C <= A(7);
                            RESULT(0) <= A(0);
                            RESULT(1) <= A(0);
                            RESULT(2) <= A(1);
                            RESULT(3) <= A(2);
                            RESULT(4) <= A(3);
                            RESULT(5) <= A(4);
                            RESULT(6) <= A(5);
                            RESULT(7) <= A(6);
                        --SLA
                        when "0000" =>
                            C <= A(7);
                            RESULT(0) <= CIN;
                            RESULT(1) <= A(0);
                            RESULT(2) <= A(1);
                            RESULT(3) <= A(2);
                            RESULT(4) <= A(3);
                            RESULT(5) <= A(4);
                            RESULT(6) <= A(5);
                            RESULT(7) <= A(6);
                        --RL
                        when "0010" =>
                            C <= A(7);
                            RESULT(0) <= A(7);
                            RESULT(1) <= A(0);
                            RESULT(2) <= A(1);
                            RESULT(3) <= A(2);
                            RESULT(4) <= A(3);
                            RESULT(5) <= A(4);
                            RESULT(6) <= A(5);
                            RESULT(7) <= A(6);
                        when others => null;
                    end case;
                else null;
            end if;
        end case;
    end process;
    --result
    RES <= RESULT;
    --zero flag
    ZF <= ZIN when SEL = x"0" else
          '1' when RESULT = x"00" else
          '0';
    --carry flag
    CF <= CIN when SEL = x"0" else
          '1' when (ALU_ADD(8) = '1' AND (SEL /= x"D")) else
          '0' when (ALU_ADD(8) = '0' AND (SEL /= x"D")) else
           C;   
end Behavioral;
