library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux2_1_8bit is
  port (a,b: in std_logic_vector(7 downto 0);
        s: in std_logic;
		    y: out std_logic_vector(7 downto 0));
 end mux2_1_8bit ;

architecture rtl of mux2_1_8bit is
begin
   y <= b when s = '1' else a;
end rtl;