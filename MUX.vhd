---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: MUX
--              ( 8x1 Multiplexor)
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX is
    Port ( INPUT_0 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_1 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_2 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_3 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_4 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_5 : in STD_LOGIC_VECTOR (7 downto 0);
           CONTROL : in STD_LOGIC_VECTOR (2 downto 0);
           MUX_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
    with CONTROL select
        MUX_OUT <= INPUT_1 when "001",
                   INPUT_2 when "010",
                   INPUT_3 when "011",
                   INPUT_4 when "100",
                   INPUT_5 when "101",
                   INPUT_0 when others;                      
end Behavioral;
