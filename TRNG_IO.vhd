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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TRNG_IO is
  generic (
    G_SZ_FREQ      : positive :=  64;
    g_CLKS_PER_BIT : integer :=  2083
  );
  
  Port ( 
--    gpio_sw_c : in std_logic;
    sysclk_p : in std_logic;
    sysclk_n : in std_logic
  ); 
end TRNG_IO;

architecture rtl of TRNG_IO is
  signal sysclk_ds : std_logic := '0';
  signal sysclk : std_logic := '0';
  signal rst : std_logic := '0';
  signal w_ready : std_logic;
  signal out_cnt : STD_LOGIC_VECTOR(G_SZ_FREQ - 1 downto 0);

  COMPONENT ila_results PORT (
    clk    : in  STD_ULOGIC;
    probe0 : in   STD_ULOGIC_VECTOR(G_SZ_FREQ - 1 downto 0);
    probe1 : in   STD_ULOGIC );
  END COMPONENT;
  
  signal clear_cycle : std_logic := '0';
begin
  sysclk <= not sysclk after 10 ns;
--  IBUFDS_inst : IBUFDS
--  generic map (
--    DIFF_TERM => FALSE,
--    IBUF_LOW_PWR => TRUE, 
--    IOSTANDARD => "DEFAULT")
--  port map (
--    O => sysclk_ds, 
--    I => sysclk_p, 
--    IB => sysclk_n 
--  );
  
--  BUFG_inst : BUFG
--  port map (
--     O => sysclk,
--     I => sysclk_ds 
--  );
  
  TRNG_Controller : entity work.TRNG_Controller(rtl) port map (
    rst => rst,
    sysclk => sysclk,
    freq_out => out_cnt,
    write_enb => w_ready
  );
  
  process(sysclk)
  begin
    if rising_edge(sysclk) then
      if w_ready = '1' then
        if clear_cycle = '0' then
          clear_cycle <= '1';
        elsif clear_cycle = '1' then
          rst <= '1';
        elsif rst = '1' and clear_cycle = '1' then
          clear_cycle <= '0';
        end if;
      else
        rst <= '0';
      end if;
    end if;
  end process;
  
  ila : ila_results port map (
    clk => std_ulogic(sysclk),
    probe0 => std_ulogic_vector(out_cnt),
    probe1 => std_ulogic(w_ready)
  );
end rtl;
