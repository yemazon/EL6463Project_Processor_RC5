----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:41 11/17/2017 
-- Design Name: 
-- Module Name:    pc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	port(
		clk: in std_logic;
		clr: in std_logic;
		address_to_load: in std_logic_vector(31 downto 0);
		current_address: out std_logic_vector(31 downto 0)
	);
end pc;

architecture Behavioral of pc is

	signal address: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

begin

	process(clk, clr, address)
		begin
		current_address <= address;
		if clr = '0' then
			address <= "00000000000000000000000000000000";
		else
			if clk='1' and clk'event then
				address <= address_to_load;
			end if;
		end if;
	end process;

end Behavioral;

