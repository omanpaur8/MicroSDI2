----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/05/2021 09:15:48 AM
-- Design Name: 
-- Module Name: Reg_p - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ID is
 port(Din : IN STD_LOGIC_VECTOR(4 downto 0);
      Dout: OUT STD_LOGIC_VECTOR(5 downto 0));
end ID;

architecture Behavioral of ID is
begin
with Din select
Dout <= "000011" when "00000",
        "000100" when "00001",
        "000101" when "00010",
        "000110" when "00011",
        "000111" when "00100",
        "001000" when "00101",
        "001001" when "00110",
        "001010" when "00111",
        "001011" when "01000",
        "001100" when "01001",
        "001101" when "01010",
        "001110" when "01011",
        "001111" when "01100",
        "010000" when "01101",
        "010001" when "01110",
        "010010" when "01111",
        "010011" when "10000",
        "010100" when "10001",
        "010101" when "10010",
        "010110" when "10011",
        "010111" when "10100",
        "011000" when "10101",
        "011001" when "10110",
        "011010" when "10111",
        "011011" when "11000",
        "011100" when "11001",
        "011101" when "11010",
        "011110" when "11011",
        "011111" when "11100",
        "000000" when others;
end Behavioral;
