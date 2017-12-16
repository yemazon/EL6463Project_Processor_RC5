----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:47 11/17/2017 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is

	generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);

end shifter;

architecture Behavioral of shifter is

	signal temp: std_logic_vector(n2-1 downto 0);
	
begin

		temp <= std_logic_vector(resize(unsigned(x), n2));
		y <= std_logic_vector(shift_left(signed(temp), k));

end Behavioral;

