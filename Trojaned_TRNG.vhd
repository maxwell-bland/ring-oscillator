library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.std_logic_unsigned.all;

entity Trojaned_TRNG is
  generic (
    G_N_INVERTERS    : positive :=  3;
    G_N_RINGS        : positive :=  1;
    G_N_TFF          : positive :=  64
  );
  
  port (
    sysclk : in std_logic;
    rst : in std_logic;
    counter_out : out std_logic_vector(G_N_TFF - 1 downto 0)
  );
end entity;

architecture rtl of Trojaned_TRNG is
 

  type oscillator_ring_ary_t is array (natural range <>) of std_logic_vector(G_N_INVERTERS-1 downto 0);
  signal oscillator_ring : oscillator_ring_ary_t(G_N_RINGS-1 downto 0) := ( 0 => "000" );
  
  
  attribute keep: boolean;
  attribute keep of oscillator_ring: signal is true;  
--  attribute dont_touch: boolean;
--  attribute dont_touch of oscillator_ring: signal is true;

  signal ring_reg_out    : std_logic_vector(G_N_RINGS-1 downto 0) := "0";
  signal intermediate : std_logic_vector(G_N_TFF - 1 downto 0) := X"0000000000000000";
begin

  -- Generate oscillator rings in parallel
--  gen_oscillator_rings : for i in 0 to G_N_RINGS-1 generate
--    -- Connect the oscillator rings in a loop (moving downward). The output (bottom) is also connected to the reset.
--    oscillator_ring(i)(0) <= not oscillator_ring(i)(2);
--    oscillator_ring(i)(1) <= not oscillator_ring(i)(0); 
--    oscillator_ring(i)(2) <= not oscillator_ring(i)(1); 
--  end generate;
  
  

  TFF_0 : entity work.TFlipFlop(rtl) port map (
           CLK => sysclk,--not oscillator_ring(0)(2),
           RESET => rst,
           T => '1',
           Q => intermediate(0),
           CLK_enable => sysclk
  );  
  
   gen_TFF : for i in 1 to G_N_TFF - 1 generate
           TFF_i : entity work.TFlipFlop(rtl) port map (
           CLK => not intermediate(i-1),
           RESET => rst,
           T => '1',
           Q => intermediate(i),
           CLK_enable => not intermediate(i-1) 
   );
 end generate;
 
 counter_out <= intermediate;

end architecture; -- rtl
