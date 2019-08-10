library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity reg_par_8bit is
port (clk, rst, load: in std_logic;
      d: in std_logic_vector(7 downto 0);
      q: out std_logic_vector(7 downto 0));
end reg_par_8bit;

architecture rtl of reg_par_8bit is
begin
  process (rst, clk)
  begin
    if (rst = '1') then
      q <= (others => '0');
    elsif (rising_edge(clk)) then
      if (load = '1')then
        q <= d;
      end if;
    end if;
  end process;
end rtl;
