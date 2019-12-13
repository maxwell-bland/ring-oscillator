library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
  
entity TRNG_Controller is
  generic (
    G_SNAP_FREQ  : positive := 32;
    G_SZ_FREQ    : positive :=  64;
    G_N_TFF      : positive :=  8
  );

  Port ( 
    button_in : in std_logic;
    freq_out : out std_logic_vector(G_SZ_FREQ - 1 downto 0)
  ); 
end TRNG_Controller;

architecture rtl of TRNG_Controller is
  signal sys_clk : STD_LOGIC;
  signal snap_cnt : STD_LOGIC_VECTOR(G_SNAP_FREQ - 1 downto 0);
  signal out_cnt : STD_LOGIC_VECTOR(G_N_TFF - 1 downto 0);
begin
  
  TRNG : entity work.Trojaned_TRNG(rtl) port map (
    rst_n => button_in,
    counter_out => out_cnt
  );
  
--  process (CLKOUT0) 
--  begin
--     if rising_edge(CLKOUT0) then
--        snap_cnt <= snap_cnt + 1;
--     end if;
     
--     if
--  end process;
    
end rtl;
