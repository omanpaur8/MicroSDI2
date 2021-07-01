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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_Cont is
generic(N: integer := 2);
 port(Din : IN STD_LOGIC_VECTOR(N-1 downto 0);
      CLK, Arst, L: IN STD_LOGIC;
      Dout: OUT STD_LOGIC_VECTOR(N-1 downto 0));
end Reg_Cont;

architecture Behavioral of Reg_Cont is
signal sData: unsigned(N-1 downto 0) := (others => '0');
begin

Reg: 
process(CLK)
begin
if(Arst = '1') then
    sData <=  (others => '0');
elsif(rising_edge(CLK)) then
  if(L = '1') then
    sData <= unsigned(Din);
  else
    sData <= sData+1;
  end if;
else
  sData <= sData;
end if;
end process;
Dout <= STD_LOGIC_VECTOR(sData);
end Behavioral;
