library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp_neq is
  port(x,y: in std_logic_vector (3 downto 0);
       x_neq_y: out std_logic);
end comp_neq ;

architecture rtl of comp_neq is
begin
  process(x,y)
  begin
    if (x = y) then
	    x_neq_y <= '0';
	  else
	    x_neq_y <= '1';
	  end if;
  end process;
end rtl;