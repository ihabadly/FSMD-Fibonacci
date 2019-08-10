library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity count_dec is
port(clk,rst,en,ld: in std_logic;
     d: in std_logic_vector(3 downto 0);
     count: out std_logic_vector(3 downto 0));
end count_dec;

architecture rtl of count_dec is
  signal count_temp: unsigned(3 downto 0);
begin
  process(clk,rst)
  begin
    if(rst = '1') then
	  count_temp <= (others=>'0');
    elsif(rising_edge (clk)) then
	  if (ld = '1') then
	    count_temp <= unsigned(d);
	  elsif (en = '1') then
	    count_temp <= count_temp - 1;
	  end if;
    end if;
  end process;		
  count<= std_logic_vector(count_temp);
end rtl;