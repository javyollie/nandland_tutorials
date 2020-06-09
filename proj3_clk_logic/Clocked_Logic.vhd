library ieee;
use ieee.std_logic_1164.all;

entity Clocked_Logic is
	port (
		i_Clk      : in std_logic;
		i_Switch_1 : in std_logic;
		o_LED_1    : out std_logic);
end entity Clocked_Logic;

architecture RTL of Clocked_Logic is

	signal r_LED_1    : std_logic := '0';
	signal r_Switch_1 : std_logic := '0';	

begin
-- Two types of processes
-- Conbinational processes (no clk) can occur outside process
-- Sequential processes (w/ clk)

-- Inside parenthesis is sensitivity list which is a list of signal
-- inputs when they change the process gets executed
-- In a sequential process this list typically comes of as a clk
-- This process is sensitive to this input clock (both rising and fall)
	p_Register : process (i_Clk) is
    begin
    	if rising_edge(i_Clk) then
    		r_Switch_1 <= i_Switch_1;	-- Register!

    		if i_Switch_1 = '0' and r_Switch_1 = '1' then --Falling edge
    			r_LED_1 <= not r_LED_1;
    		end if;
    	end if;
    end process p_Register;

    o_LED_1 <= r_LED_1;

end architecture RTL; -- RTL