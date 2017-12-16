----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:02 11/17/2017 
-- Design Name: 
-- Module Name:    sign_extend - Behavioral 
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
use IEEE.numeric_std.all;

entity sign_extend is

	port (
		x: in std_logic_vector(15 downto 0);
		y: out std_logic_vector(31 downto 0)
	);
	
end sign_extend;

architecture Behavioral of sign_extend is
begin
	y <= std_logic_vector(resize(signed(x), y'length));
end Behavioral;

