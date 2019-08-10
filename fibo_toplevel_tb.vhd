library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity fibo_toplevel_tb is
end fibo_toplevel_tb;

architecture behav of fibo_toplevel_tb is
  component fibo_toplevel
    port(clk,rst,go: in std_logic;
         i: in std_logic_vector (3 downto 0);
         fib: out std_logic_vector (7 downto 0));
  end component;
  constant clockperiod: time:= 100 ns;
  signal rst,go: std_logic;
  signal i: std_logic_vector (3 downto 0);
  signal fib: std_logic_vector (7 downto 0);
  signal clk:std_logic := '1';
begin
  clk <= not clk after clockperiod /2;
  rst <='1','0'after 70 ns;
  go <='0','1' after 220 ns,'0' after 420 ns;
  i <= "1100"; --the maximum index value is 12

  dut : fibo_toplevel port map(clk,rst,go,i,fib);
end behav;