library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
  
entity TRNG_Controller is
  generic (
    G_SNAP_FREQ  : positive := 32;
    G_SZ_FREQ    : positive :=  64;
    G_N_TFF      : positive :=  64
  );

  Port ( 
    gpio_sw_c : in std_logic;
    sysclk : in std_logic;
    freq_out : out std_logic_vector(G_SZ_FREQ - 1 downto 0);
    write_enb : out std_logic
  ); 
end TRNG_Controller;

architecture rtl of TRNG_Controller is
  signal w_ready : std_logic := '0';
  signal sys_clk : STD_LOGIC;
  signal snap_cnt : STD_LOGIC_VECTOR(G_SNAP_FREQ - 1 downto 0);
  signal out_cnt : STD_LOGIC_VECTOR(G_N_TFF - 1 downto 0);
begin
  
  TRNG : entity work.Trojaned_TRNG(rtl) port map (
    rst_n => w_ready OR gpio_sw_c,
    counter_out => out_cnt
  );
  
  process(sysclk, gpio_sw_c)
  begin
    if rising_edge(sysclk) then
      snap_cnt <= snap_cnt + 1;
      if gpio_sw_c = '1' then
         snap_cnt <= X"00000000";
      end if;
      
      if w_ready = '1' then
        w_ready <= '0';
      end if;
    end if;
    
    if snap_cnt = X"0BEBC200" then
      freq_out <= out_cnt;
      w_ready <= '1';
      snap_cnt <= X"00000000";
    end if;
  end process;
  
  write_enb <= w_ready;
end rtl;
