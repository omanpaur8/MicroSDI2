----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2021 03:08:28 PM
-- Design Name: 
-- Module Name: rom_mem - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTROL_MEMORY is
    Port ( Addr : in STD_LOGIC_VECTOR (5 downto 0);
           Data : out STD_LOGIC_VECTOR (25 downto 0));
end CONTROL_MEMORY;

architecture Behavioral of CONTROL_MEMORY is

type mem is array (0 to 63) of std_logic_vector(25 downto 0);

signal rom: mem :=(0 =>   "00000000000000100001011000",
                   1 =>   "00000000000000100000000100",
                   2 =>   "00000000000000101001010011",
                   3 =>   "00000000000111101001010010",
                   4 =>   "00001000000111101001010010",
                   20 =>   "00001010110111101001010010",
                   23 =>   "00000000000000101000010010",
                     others => (others =>'0'));
                     
begin
data <= rom(TO_INTEGER(unsigned(ADDR)));

end Behavioral;
