library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity fibo_controller is
  port(clk,rst,n_neq_zero,go_i: std_logic;
       a_sel,b_sel,a_ld,b_ld,c_ld,count_ld,count_en: out std_logic);
end fibo_controller;

architecture rtl of fibo_controller is
  type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
  signal current_state, next_state: state_type;
begin 
  process(n_neq_zero,go_i,current_state)
  begin
    case current_state is
	when s0 =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <='0';	
	  count_en <= '0';
	  next_state <= s1;
	when s1 =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';
	  if (go_i = '1') then 
	    next_state <= s3 ;
	  else
	    next_state <= s2;	
	  end if;
	when s2 =>  
	  a_sel <= '0';
      a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';	
	  next_state <= s1 ;
	when s3 =>  
	  a_sel<='0';
	  a_ld <='1';
	  b_sel<='0';
	  b_ld <='1';
	  c_ld<='0';
	  count_ld <='1';	
	  count_en<='0';
	  next_state <= s4;
	when s4 =>  
	  a_sel <= '0';
      a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';
	  if (n_neq_zero = '1') then 
	    next_state <= s5;
	  else
	    next_state <= s4;
      end if;
	when s5 =>
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '1';
	  count_ld <= '0';	
	  count_en <= '0';
	  next_state <= s6 ;	
	when s6 =>  
	  a_sel <= '1';
	  a_ld <= '1';
	  b_sel <= '1';
	  b_ld <= '1';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';
	  next_state <= s7 ;	
	when s7 =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '1';
	  next_state <= s8 ;	
	when s8 =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';	
	  next_state <= s4;	
	when s9 =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';	
	  next_state <= s0;		  
	when others =>  
	  a_sel <= '0';
	  a_ld <= '0';
	  b_sel <= '0';
	  b_ld <= '0';
	  c_ld <= '0';
	  count_ld <= '0';	
	  count_en <= '0';	
	  next_state<= s0;	     
    end case;
  end process;
  process (rst, clk)
  begin
    if (rst ='1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;
end rtl;