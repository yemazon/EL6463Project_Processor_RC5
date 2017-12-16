----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:36 11/17/2017 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity alu_control is

	port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(3 downto 0);
		alu_control_fuct: out std_logic_vector(3 downto 0)
	);

end alu_control;

architecture Behavioral of alu_control is

	signal nor_op: std_logic_vector(3 downto 0):= "1000";
	signal and_op: std_logic_vector(3 downto 0):= "0000";
	signal or_op: std_logic_vector(3 downto 0):= "0001";
	signal add: std_logic_vector(3 downto 0):= "0010";
	signal subtract_not_equal: std_logic_vector(3 downto 0):= "0011";
	signal subtract: std_logic_vector(3 downto 0):= "0110";
	signal set_on_less_than: std_logic_vector(3 downto 0):= "0111";
	signal shl_op: std_logic_vector(3 downto 0):= "1001";
	signal shr_op: std_logic_vector(3 downto 0):= "1010";
	signal branch_if_less: std_logic_vector(3 downto 0):="1111";

begin

	alu_control_fuct <=  add                when(alu_op="0000" or (alu_op="0010" and funct="010000")) else
								subtract           when(alu_op="0001" or (alu_op="0010" and funct="010001")) else
								shl_op				 when(alu_op="0110") else
								shr_op				 when(alu_op="0111") else
								subtract_not_equal when(alu_op="0011") else
								and_op             when(alu_op="0100" or (alu_op="0010" and funct="010010")) else
								or_op              when(alu_op="0101" or (alu_op="0010" and funct="010011")) else
								nor_op				 when(alu_op="0010" and funct="010100") else
								set_on_less_than   when(alu_op="0010" and funct="101010") else
								branch_if_less     when(alu_op="1000") else
								"0000";

end Behavioral;

