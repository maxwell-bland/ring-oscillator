----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2019 01:55:47 PM
-- Design Name: 
-- Module Name: TFlipFlop - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- s
-- Dependenciess: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------s------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TFlipFlop is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           T : in STD_LOGIC;
           Q : out STD_LOGIC;
           CLK_enable : in STD_LOGIC);
end TFlipFlop;

architecture rtl of TFlipFlop is
   signal  temp: std_logic;

begin

 process (Reset,CLK) 
   begin
       if (rising_edge(CLK)) then    --sometimes you need to include a package for rising_edge, you can use CLK'EVENT AND CLK = '1' instead
           if Reset='1' then   
               temp <= '0';          
           elsif CLK_enable ='1' then
               temp <= T xor temp;
           end if;
       end if; 
   end process;
   Q <= temp;

end rtl;
