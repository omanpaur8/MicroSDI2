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

entity Main is
 port(PortA: in STD_LOGIC_VECTOR(7 downto 0);
      CLK, Master_CLR: in STD_LOGIC);
end Main;

architecture Behavioral of Main is

component Reg_Cont is
generic(N: integer := 2);
 port(Din : IN STD_LOGIC_VECTOR(N-1 downto 0);
      CLK, Arst, L: IN STD_LOGIC;
      Dout: OUT STD_LOGIC_VECTOR(N-1 downto 0));
end component;

component Reg_n is
generic(N: integer := 2);
 port(Din : IN STD_LOGIC_VECTOR(N-1 downto 0);
      CLK, Arst, L: IN STD_LOGIC;
      Dout: OUT STD_LOGIC_VECTOR(N-1 downto 0));
end component;

component PROGRAM_MEMORY is
    Port ( Addr : in STD_LOGIC_VECTOR (5 downto 0);
           Data : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ID is
 port(Din : IN STD_LOGIC_VECTOR(4 downto 0);
      Dout: OUT STD_LOGIC_VECTOR(5 downto 0));
end component;

component CONTROL_MEMORY is
    Port ( Addr : in STD_LOGIC_VECTOR (5 downto 0);
           Data : out STD_LOGIC_VECTOR (25 downto 0));
end component;

--Señales STACK
signal sStack: STD_LOGIC_VECTOR(5 downto 0);
--Señales PC
signal sMuxPC, sPC: STD_LOGIC_VECTOR(5 downto 0);
--Señanes Program Memory
signal sMAR: STD_LOGIC_VECTOR(5 downto 0);
signal sPM: STD_LOGIC_VECTOR(15 downto 0);
signal sMBR: STD_LOGIC_VECTOR(15 downto 0);
--Señales MBR
signal opcode: STD_LOGIC_VECTOR(4 downto 0);
signal n,m: STD_LOGIC_VECTOR(2 downto 0);
signal k: STD_LOGIC_VECTOR(7 downto 0);
signal f: STD_LOGIC_VECTOR(4 downto 0);
signal a: STD_LOGIC_VECTOR(5 downto 0);

--Señales control memory
signal sID, sMuxCAR, sCAR: STD_LOGIC_VECTOR(5 downto 0);
signal sCM: STD_LOGIC_VECTOR(25 downto 0);
signal sMuxMCC: STD_LOGIC;
signal MA, MB, MD, MPC, MCAR: STD_LOGIC_VECTOR(1 downto 0);
signal MMD, WE, Cin, L, PUSH, POP, LPC, LMAR, LMBR: STD_LOGIC;
signal S : STD_LOGIC_VECTOR(3 downto 0);
signal MCC : STD_LOGIC_VECTOR(2 downto 0);


begin

MuxPC:
with MPC select
sMuxPC <= a when "00",
          sStack when "01",
          sPC when others;
PC: Reg_Cont generic map(N=>6) port map(Din=>sMuxPC, CLK=>CLK, Arst=>Master_CLR, L=>LPC, Dout=>sPC);
MAR: Reg_n generic map(N=>6) port map(Din=>sPC, CLK=>CLK, Arst=>Master_CLR, L=>LMAR, Dout=>sMAR);
PROGRAM_MEMORY0: PROGRAM_MEMORY port map(Addr=>sMAR, Data=>sPM);
MBR: Reg_n generic map(N=>16) port map(Din=>sPM, CLK=>CLK, Arst=>Master_CLR, L=>LMBR, Dout=>sMBR);
opcode <= sMBR(15 downto 11);
n<=sMBR(10 downto 8);
m<=sMBR(7 downto 5);
k<=sMBR(7 downto 0);
f<=sMBR(7 downto 3);
a<=sMBR(10 downto 5);
I_D: ID port map(Din=>opcode, Dout=>sID);
MuxCAR:
with MCAR select
sMuxCAR <= "000000" when "00",
           "010111" when "01",
           "000000" when "10",
           sID when others;
CAR: Reg_Cont generic map(N=>6) port map(Din=>sMuxCAR, CLK=>CLK, Arst=>Master_CLR, L=>sMuxMCC, Dout=>sCAR);       
CONTROL_MEMORY0: CONTROL_MEMORY port map(Addr=>sCAR, Data=>sCM);
MMD<=sCM(25); WE<=sCM(24); MA<=sCM(23 downto 22); MB<=sCM(21 downto 20);
S<=sCM(19 downto 16); Cin<=sCM(15); MD<=sCM(14 downto 13); L<=sCM(12); 
MCC<=sCM(11 downto 9); PUSH<=sCM(8); POP<=sCM(7); MPC<=sCM(6 downto 5);
LPC<=sCM(4); LMAR<=sCM(3); LMBR<=sCM(2); MCAR<=sCM(1 downto 0);
MuxMCC:
with MCC select
sMuxMCC <= '0' when "000",
           '0' when "001",
           '0' when "010",
           '0' when "011",
           '0' when "100",
           '1' when others;
end Behavioral;
