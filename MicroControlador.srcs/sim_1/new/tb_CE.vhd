----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2021 04:17:16 PM
-- Design Name: 
-- Module Name: tb_CE - Behavioral
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

entity tb_CE is
--  Port ( );
end tb_CE;

architecture Behavioral of tb_CE is

component Main is
 port(PortA: in STD_LOGIC_VECTOR(7 downto 0);
      CLK, Master_CLR: in STD_LOGIC);
end component;

signal PortA: STD_LOGIC_VECTOR(7 downto 0);
signal CLK, Master_CLR: STD_LOGIC;
signal T: time:= 10ns;

begin

uut: Main port map(PortA, CLK, Master_CLR );
Reloj:
process
begin
PortA<="00000000"; CLK<='0'; wait for T/2;
CLK<='1'; wait for T/2;
end process;

Stimulus:
process
begin
Master_CLR<='0'; wait for 20*T;

Assert false
	report "Simulation completed"
	severity failure;

end process;

end Behavioral;
