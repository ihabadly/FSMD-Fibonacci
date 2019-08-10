library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity fibo_datapath is
  port (clk,rst,b_sel, a_sel, b_ld, a_ld, c_ld, count_en, count_ld : in std_logic;
        i_in: in std_logic_vector(3 downto 0);
        n_neq_zero : out std_logic;
        fib: out std_logic_vector(7 downto 0));
end fibo_datapath;

architecture rtl of fibo_datapath is
component count_dec
  port (clk,rst,en,ld: in std_logic;
       d: in std_logic_vector(3 downto 0);
       count: out std_logic_vector(3 downto 0));
end component;
component mux2_1_8bit
  port (a,b:in std_logic_vector(7 downto 0);
       s:in std_logic;
       y: out std_logic_vector(7 downto 0));
end component;
component comp_neq
  port (x,y :in std_logic_vector (3 downto 0);
        x_neq_y: out std_logic);
end component;
component reg_par_8bit
  port (clk,rst,load: in std_logic;
        d: in std_logic_vector(7 downto 0);
        q: out std_logic_vector(7 downto 0));
end component;
component adder_8bit 
  port (a,b: in std_logic_vector (7 downto 0);
       y: out std_logic_vector(7 downto 0));
end component;
  signal a_in,a_out,b_in,b_out,sum,c_out : std_logic_vector(7 downto 0);
  signal n: std_logic_vector(3 downto 0); 
begin
  u0: reg_par_8bit port map (clk,rst,a_ld,a_in,a_out);
  u1: reg_par_8bit port map (clk,rst,b_ld,b_in,b_out);
  u2: reg_par_8bit port map (clk,rst,c_ld,sum,c_out);
  u3: mux2_1_8bit port map ("00000000",b_out,a_sel,a_in);
  u4: mux2_1_8bit port map ("00000001",c_out,b_sel,b_in);
  u5: count_dec port map (clk,rst,count_en,count_ld,i_in,n);
  u6: adder_8bit port map (a_out,b_out,sum);
  u7: comp_neq port map (n,"0000",n_neq_zero);
  fib <= c_out;
end rtl;
