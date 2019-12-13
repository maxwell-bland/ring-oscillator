----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2019 10:47:42 PM
-- Design Name: 
-- Module Name: TRNG_IO - rtl
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

library std;
use std.textio.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TRNG_IO is
  generic (
    G_SZ_FREQ      : positive :=  64
  );
  
  Port ( 
--    gpio_sw_c : in std_logic;
    sysclk_p : in std_logic
  ); 
end TRNG_IO;

architecture rtl of TRNG_IO is
  signal w_ready : std_logic;
  signal out_cnt : STD_LOGIC_VECTOR(G_SZ_FREQ - 1 downto 0);
begin
  TRNG_Controller : entity work.TRNG_Controller(rtl) port map (
    gpio_sw_c => '0',
    sysclk_p => sysclk_p,
    freq_out => out_cnt,
    write_enb => w_ready
  );
  
  process 
  begin
    if rising_edge(w_ready) then
      report "COUNT";
      report integer'image(to_integer(unsigned(out_cnt)));
    end if;
  end process;
end rtl;
