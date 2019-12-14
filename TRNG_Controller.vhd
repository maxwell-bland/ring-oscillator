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
    rst : in std_logic;
    sysclk : in std_logic;
    freq_out : out std_logic_vector(G_SZ_FREQ - 1 downto 0);
    write_enb : out std_logic
  ); 
end TRNG_Controller;

architecture rtl of TRNG_Controller is
  signal w_ready : std_logic := '0';
  signal snap_cnt : integer := 0;
  signal out_cnt : STD_LOGIC_VECTOR(G_N_TFF - 1 downto 0) :=  X"0000000000000000";
begin
  
  TRNG : entity work.Trojaned_TRNG(rtl) port map (
    sysclk => sysclk,
    rst => rst,
    counter_out => out_cnt
  );
  
  process(sysclk)
  begin
    if rising_edge(sysclk) then
      snap_cnt <= snap_cnt + 1;
      if rst = '1' then
         snap_cnt <= 0;
         w_ready <= '0'; 
      end if;
 
--      if snap_cnt = X"0BEBC200" then
      if snap_cnt = X"00000200" then
        freq_out <= out_cnt;
        w_ready <= '1';
      end if;
    end if;
  end process;
  
  write_enb <= w_ready;
end rtl;
