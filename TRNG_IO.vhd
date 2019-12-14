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
    usb_rx : out std_logic;
--    gpio_sw_c : in std_logic;
    sysclk_p : in std_logic;
    sysclk_n : in std_logic
  ); 
end TRNG_IO;

architecture rtl of TRNG_IO is
  signal sysclk_ds : std_logic := '0';
  signal sysclk : std_logic := '0';
  signal w_ready : std_logic;
  signal transmit : std_logic := '0';
  signal transmit_active : std_logic;
  signal transmit_byte : STD_LOGIC_VECTOR(7 downto 0);
  signal out_cnt : STD_LOGIC_VECTOR(G_SZ_FREQ - 1 downto 0);
  signal out_working : std_logic_vector(G_SZ_FREQ - 1 downto 0);
  signal place : integer := 0;
  signal insertNewLine : std_logic := '0';
  
    function Bin2Hexascii (
    signal binary : std_logic_vector(3 downto 0))
    return std_logic_vector is
    variable v_temp : std_logic_vector(7 downto 0);
  begin
    v_temp := std_logic_vector((unsigned(X"0" & binary) + 65));
    return v_temp;
    
  end Bin2Hexascii;
  
begin
  IBUFDS_inst : IBUFDS
  generic map (
    DIFF_TERM => FALSE,
    IBUF_LOW_PWR => TRUE, 
    IOSTANDARD => "DEFAULT")
  port map (
    O => sysclk_ds, 
    I => sysclk_p, 
    IB => sysclk_n 
  );
  
  BUFG_inst : BUFG
  port map (
     O => sysclk,
     I => sysclk_ds 
  );
  
  TRNG_Controller : entity work.TRNG_Controller(rtl) port map (
    gpio_sw_c => '0',
    sysclk => sysclk,
    freq_out => out_cnt,
    write_enb => w_ready
  );

  UART_Transmit : entity work.UART_TX(rtl) port map (
    i_Clk       =>  sysclk,
    i_TX_DV     =>  transmit,
    i_TX_Byte   =>  transmit_byte,
    o_TX_Active =>  transmit_active,
    o_TX_Serial =>  usb_rx,
    o_TX_Done   =>  open
  );


  process 
  begin
    if w_ready = '1' and transmit_active = '0' then
      transmit <= '1';

      if insertNewLine = '1' then
        insertNewLine <= '0';
        transmit_byte <= X"0A";  --X"A" is \n in ascii
      else
        out_working <= std_logic_vector(shift_right(unsigned(out_cnt), place * 4)) AND X"000000000000000F";
--        out_working <= X"000000000000000A";
        transmit_byte <=  Bin2Hexascii(out_working(3 downto 0));
      
        if place = 15 then
          insertNewLine <= '1';
          place <= 0;
        else 
          place <= place + 1;
        end if;
      end if;
      
     else
      transmit <= '0';
    end if;
  end process;
end rtl;
