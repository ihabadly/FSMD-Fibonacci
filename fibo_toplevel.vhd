library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity fibo_toplevel is
  port (clk,rst,go: in std_logic;
        i: in std_logic_vector(3 downto 0);
        fib: out std_logic_vector(7 downto 0));
end fibo_toplevel;

architecture rtl of fibo_toplevel is
  component fibo_datapath
    port (clk,rst,b_sel, a_sel, b_ld, a_ld, c_ld, count_en, count_ld : in std_logic;
          i_in: in std_logic_vector(3 downto 0);
          n_neq_zero : out std_logic;
          fib: out std_logic_vector(7 downto 0));
  end component;
  component fibo_controller
    port (clk,rst,n_neq_zero,go_i: std_logic;
         a_sel,b_sel,a_ld,b_ld,c_ld,count_ld,count_en: out std_logic);
  end component;
  signal b_sel,a_sel, b_ld, a_ld, c_ld, count_en, count_ld,n_neq_zero: std_logic;
begin 
  u0: fibo_datapath port map(clk,rst,b_sel,a_sel, b_ld, a_ld, c_ld, count_en, count_ld,i,n_neq_zero,fib);
  u1: fibo_controller port map(clk,rst,n_neq_zero,go,a_sel,b_sel,a_ld,b_ld,c_ld,count_ld,count_en);
end rtl;