library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity Trojaned_TRNG is
  generic (
    G_N_INVERTERS    : positive :=  3;
    G_N_RINGS        : positive :=  1
  );
  
  port (
    bit_out  : out std_logic
  );
end entity;

architecture rtl of Trojaned_TRNG is

  -- Propogation Delay Constants
  constant C_PROP_DELAY : time := 100 ps;
  constant R_PROP_DELAY : time := (C_PROP_DELAY * 2) / 5 - (10 fs); --- Period = R * (5/2)
  
  signal rst_n : std_logic := '1';
  signal clk_sys_g : std_logic := '0';
  signal clk_sys : std_logic := '1';

  type oscillator_ring_ary_t is array (natural range <>) of std_logic_vector(G_N_INVERTERS-1 downto 0);
  signal oscillator_ring : oscillator_ring_ary_t(G_N_RINGS-1 downto 0);
  
  attribute keep: boolean;
  attribute keep of oscillator_ring: signal is true;  
--  attribute dont_touch: boolean;
--  attribute dont_touch of oscillator_ring: signal is true;

  signal ring_reg_out    : std_logic_vector(G_N_RINGS-1 downto 0) := "0";
  signal bit_out_i : std_logic;
begin
  clk_sys <= not clk_sys after (C_PROP_DELAY / (G_N_INVERTERS + 1)) * 4 / 2;


  -- Mapping internal representations of top signals
  bit_out <= bit_out_i;

  -- Generate oscillator rings in parallel
  gen_oscillator_rings : for i in 0 to G_N_RINGS-1 generate
    -- Connect the oscillator rings in a loop (moving downward). The output (bottom) is also connected to the reset.
    oscillator_ring(i)(0) <= not ring_reg_out(i) after (R_PROP_DELAY / (G_N_INVERTERS + 1));
    oscillator_ring(i)(1) <= not oscillator_ring(i)(0) after (R_PROP_DELAY / (G_N_INVERTERS + 1)) * 2;
    oscillator_ring(i)(2) <= not oscillator_ring(i)(1) after (R_PROP_DELAY / (G_N_INVERTERS + 1)) * 3;
    ring_reg_out(i) <= oscillator_ring(i)(2) after (R_PROP_DELAY / (G_N_INVERTERS + 1)) * 4;
  end generate; -- gen_oscillator_rings

  -- Sample all of the rings and XOR the result
  proc_sample_rings : process(clk_sys, rst_n)
    variable xor_result_v0 : std_logic := '0';
    variable xor_result_v1 : std_logic := '0';
  begin
    if (rst_n = '0') then
      bit_out_i  <= '0';
    elsif rising_edge(clk_sys) then
      -- XOR the registered outputs of the oscillator rings
--      xor_result_v0 := ring_reg_out(0) xor ring_reg_out(1);
--      xor_result_v1 := ring_reg_out(2) xor ring_reg_out(3);
      bit_out_i <= ring_reg_out(0); -- Double register the sampled value
    end if;
  end process; -- proc_sample_rings

end architecture; -- rtl
