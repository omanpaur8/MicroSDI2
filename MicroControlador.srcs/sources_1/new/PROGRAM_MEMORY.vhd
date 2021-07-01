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

entity PROGRAM_MEMORY is
    Port ( Addr : in STD_LOGIC_VECTOR (5 downto 0);
           Data : out STD_LOGIC_VECTOR (15 downto 0));
end PROGRAM_MEMORY;

architecture Behavioral of PROGRAM_MEMORY is

type mem is array (0 to 63) of std_logic_vector(15 downto 0);

constant rom: mem :=(0 =>   "1000101000000000",
                     1 =>   "0000101000000001",
                     2 =>   "1010000000100000",
                     others => (others =>'0'));
                     
begin

data <= rom(TO_INTEGER(unsigned(ADDR)));

end Behavioral;
