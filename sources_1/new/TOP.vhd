----------------------------------------------------------------------------------
-- Company: UTCN
-- Engineer: Eduard Cavasi 
--           
-- Create Date: 05/01/2024 
-- Design Name: 
-- Module Name: TOP - Structural
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

entity TOP is
    Port ( CLK:  in STD_LOGIC;
           RESET: in STD_LOGIC;
           ZF : out STD_LOGIC;
           CF : out STD_LOGIC;
           catodes: out STD_LOGIC_VECTOR(6 downto 0);
           anodes: out STD_LOGIC_VECTOR(7 downto 0));
end TOP;

architecture Structural of TOP is

component freq_divisor is
    Port ( CLK100 : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CLK : out STD_LOGIC);
end component;

component displaySSD is
    Port ( clk100 : in STD_LOGIC;
           ca : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           result: in STD_LOGIC_VECTOR(7 downto 0));
end component;

component ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           OPCODE: in STD_LOGIC_VECTOR(3 downto 0);
           CIN: in STD_LOGIC;
           ZIN: in STD_LOGIC;
           RES: out STD_LOGIC_VECTOR (7 downto 0);
           CF : out STD_LOGIC;
           ZF : out STD_LOGIC);
end component;

component register8bit is
    Port ( INPUT : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component instr_decoder is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (15 downto 0);
           OP1 : out STD_LOGIC_VECTOR (3 downto 0);
           OP2 : out STD_LOGIC_VECTOR (3 downto 0);
           INS_SEL : out STD_LOGIC_VECTOR (3 downto 0);
           INS_OP : out STD_LOGIC_VECTOR (3 downto 0);
           K : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux16to1 is
    Port ( IN0 : in STD_LOGIC_VECTOR (7 downto 0);
           IN1 : in STD_LOGIC_VECTOR (7 downto 0);
           IN2 : in STD_LOGIC_VECTOR (7 downto 0);
           IN3 : in STD_LOGIC_VECTOR (7 downto 0);
           IN4 : in STD_LOGIC_VECTOR (7 downto 0);
           IN5 : in STD_LOGIC_VECTOR (7 downto 0);
           IN6 : in STD_LOGIC_VECTOR (7 downto 0);
           IN7 : in STD_LOGIC_VECTOR (7 downto 0);
           IN8 : in STD_LOGIC_VECTOR (7 downto 0);
           IN9 : in STD_LOGIC_VECTOR (7 downto 0);
           IN10 : in STD_LOGIC_VECTOR (7 downto 0);
           IN11 : in STD_LOGIC_VECTOR (7 downto 0);
           IN12 : in STD_LOGIC_VECTOR (7 downto 0);
           IN13 : in STD_LOGIC_VECTOR (7 downto 0);
           IN14 : in STD_LOGIC_VECTOR (7 downto 0);
           IN15 : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT: out STD_LOGIC_VECTOR (7 downto 0));
end component;

component dmux1to16 is
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
end component;

component ProgramCounter is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           INPUT : in STD_LOGIC_VECTOR (7 downto 0);
           ADDRESS : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component clk_gen is
    Port ( RESET : in STD_LOGIC;    --asynchronous
           CLK : in STD_LOGIC;
           CLK0 : out STD_LOGIC;    --ROM clock
           CLK1 : out STD_LOGIC;    --DECODE CLOCK
           CLK2 : out STD_LOGIC);   --Registers clock
end component;

component Program_ROM is
    Port (CLK: in STD_LOGIC;
          ADDRESS: in STD_LOGIC_VECTOR(7 downto 0);
          INSTRUCTION: out STD_LOGIC_VECTOR(15 downto 0));
end component;

component FlagsRegister is
    Port ( ZFIN : in STD_LOGIC;
           CFIN : in STD_LOGIC;
           ZFOUT : out STD_LOGIC;
           CFOUT : out STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC);
end component;

component JumpCtrl is
    Port ( INS : in STD_LOGIC_VECTOR (15 downto 0);
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           ZF: in STD_LOGIC;
           CF: in STD_LOGIC;
           ADDRESS : out STD_LOGIC_VECTOR (7 downto 0);
           SIG : out STD_LOGIC;
           JMP_SIG: out STD_LOGIC);
end component;

Signal RES, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, QA, QB, QC, QD, QE, QF, OP1, OP2, OP2INT, K, ADDRESS, ADDRESS_LOAD, an: STD_LOGIC_VECTOR(7 downto 0);
Signal CLK_2sec, CLK0, CLK1, CLK2, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, LA, LB, LC, LD, LE, LF, CFIN, ZFIN, CFOUT, ZFOUT, SIG_LOAD, JMP_SIG, LOADER: STD_LOGIC;
Signal SEL, SEL2, OP, ADR1, ADR2: STD_LOGIC_VECTOR(3 downto 0);
Signal INSTRUCTION: STD_LOGIC_VECTOR(15 downto 0);
Signal ca: STD_LOGIC_VECTOR(6 downto 0);

begin
    DEBUG: freq_divisor port map(CLK, '0', CLK_2sec);
    GEN_CLK: clk_gen port map(RESET, CLK_2sec, CLK0, CLK1, CLK2);
    INSTR_SEL: Program_ROM port map(CLK0, ADDRESS, INSTRUCTION);
    
    LOADER <= '1' when JMP_SIG = '0' else
              '0';
    LOAD: dmux1to16 port map(LOADER, ADR1, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, LA, LB, LC, LD, LE, LF);
    DECODE: instr_decoder port map(CLK1, RESET, INSTRUCTION, ADR1, ADR2, SEL, OP, K);
    REGISTER0: register8bit port map(RES, L0, CLK2, '0', Q0);
    REGISTER1: register8bit port map(RES, L1, CLK2, '0', Q1);
    REGISTER2: register8bit port map(RES, L2, CLK2, '0', Q2);
    REGISTER3: register8bit port map(RES, L3, CLK2, '0', Q3);
    REGISTER4: register8bit port map(RES, L4, CLK2, '0', Q4);
    REGISTER5: register8bit port map(RES, L5, CLK2, '0', Q5);
    REGISTER6: register8bit port map(RES, L6, CLK2, '0', Q6);
    REGISTER7: register8bit port map(RES, L7, CLK2, '0', Q7);
    REGISTER8: register8bit port map(RES, L8, CLK2, '0', Q8);
    REGISTER9: register8bit port map(RES, L9, CLK2, '0', Q9);
    REGISTERA: register8bit port map(RES, LA, CLK2, '0', QA);
    REGISTERB: register8bit port map(RES, LB, CLK2, '0', QB);
    REGISTERC: register8bit port map(RES, LC, CLK2, '0', QC);
    REGISTERD: register8bit port map(RES, LD, CLK2, '0', QD);
    REGISTERE: register8bit port map(RES, LE, CLK2, '0', QE);
    REGISTERF: register8bit port map(RES, LF, CLK2, '0', QF);
    OP1MUX:    mux16to1 port map(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, QA, QB, QC, QD, QE, QF, ADR1, OP1);
    OP2MUX:    mux16to1 port map(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, QA, QB, QC, QD, QE, QF, ADR2, OP2INT);
    SEL2 <= OP when SEL  = "1100" else
            SEL;
    OP2 <= OP2INT when SEL = "1100" else
           K;
    ALUSTART: ALU port map(OP1, OP2, SEL2, OP, CFOUT, ZFOUT, RES, CFIN, ZFIN);
    INSERT_FLAGS: FlagsRegister port map(ZFIN, CFIN, ZFOUT, CFOUT, CLK2, RESET);
    JUMP: JumpCtrl port map(INSTRUCTION, CLK1, RESET, ZFOUT, CFOUT, ADDRESS_LOAD, SIG_LOAD, JMP_SIG);
    NEXT_INSTR: ProgramCounter port map(CLK2, RESET, SIG_LOAD, ADDRESS_LOAD, ADDRESS);
    
    DISPLAY: displaySSD port map(CLK, ca, an, Q0);
    catodes <= ca;
    anodes <= an;
    ZF <= ZFOUT;
    CF <= CFOUT;
end Structural;
