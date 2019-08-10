library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity adder_8bit is
port(a,b: in std_logic_vector (7 downto 0);
     y: out std_logic_vector(7 downto 0));
end adder_8bit;

Architecture rtl of adder_8bit is
 signal y_int: unsigned (7 downto 0);
begin
  y_int <= unsigned(a)+ unsigned(b);
  y <= std_logic_vector(y_int);
end rtl; 
