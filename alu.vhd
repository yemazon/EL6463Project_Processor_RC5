----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:35 11/17/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is

	port (
		in_1, in_2: std_logic_vector(31 downto 0);
		alu_control_fuct: in std_logic_vector(3 downto 0);
		zero: out std_logic;
		alu_result: out std_logic_vector(31 downto 0)
	);
	
end alu;

architecture Behavioral of alu is

	signal and_op: std_logic_vector(3 downto 0):= "0000";
	signal or_op: std_logic_vector(3 downto 0):= "0001";
	signal nor_op: std_logic_vector(3 downto 0):= "1000";
	signal add: std_logic_vector(3 downto 0):= "0010";
	signal subtract_not_equal: std_logic_vector(3 downto 0):= "0011";
	signal branch_if_less: std_logic_vector(3 downto 0):="1111";
	signal subtract: std_logic_vector(3 downto 0):= "0110";
	signal set_on_less_than: std_logic_vector(3 downto 0):= "0111";
	signal shl_op: std_logic_vector(3 downto 0):= "1001";
	signal shr_op: std_logic_vector(3 downto 0):= "1010";
	signal shl_result,shr_result, ab_xor, b_m: std_logic_vector(31 downto 0);

begin

	alu_result <=	in_1 + in_2 when(alu_control_fuct=add) else
						in_1 - in_2 when(alu_control_fuct=subtract or alu_control_fuct=subtract_not_equal or alu_control_fuct=branch_if_less) else
						in_1 and in_2 when(alu_control_fuct=and_op) else
						in_1 or in_2 when(alu_control_fuct=or_op) else
						not (in_1 or in_2) when(alu_control_fuct=nor_op) else
						shl_result when(alu_control_fuct=shl_op) else
						shr_result when(alu_control_fuct=shr_op) else
						"00000000000000000000000000000000"; --when(alu_control_fuct=set_on_less_than and in_1 < in_2) else
						--"00000000000000000000000000000000" when(alu_control_fuct=set_on_less_than);

	zero <=	'1' when(in_1/=in_2 and alu_control_fuct=subtract_not_equal) else 
				'0' when(in_1=in_2 and alu_control_fuct=subtract_not_equal) else
				'1' when(in_1<in_2 and alu_control_fuct=branch_if_less) else
				'0' when(in_1=in_2 and alu_control_fuct=branch_if_less) else
				'1' when(in_1=in_2) else 
				'0';
	
	ab_xor <= in_1;
	with in_2(4 downto 0) select
		shl_result<=
				ab_xor(30 downto 0)&ab_xor(31)when"00001",
				ab_xor(29 downto 0)&ab_xor(31 downto 30)when"00010",
				ab_xor(28 downto 0)&ab_xor(31 downto 29)when"00011",
				ab_xor(27 downto 0)&ab_xor(31 downto 28)when"00100",
				ab_xor(26 downto 0)&ab_xor(31 downto 27)when"00101",
				ab_xor(25 downto 0)&ab_xor(31 downto 26)when"00110",
				ab_xor(24 downto 0)&ab_xor(31 downto 25)when"00111",
				ab_xor(23 downto 0)&ab_xor(31 downto 24)when"01000",
				ab_xor(22 downto 0)&ab_xor(31 downto 23)when"01001",
				ab_xor(21 downto 0)&ab_xor(31 downto 22)when"01010",
				ab_xor(20 downto 0)&ab_xor(31 downto 21)when"01011",
				ab_xor(19 downto 0)&ab_xor(31 downto 20)when"01100",
				ab_xor(18 downto 0)&ab_xor(31 downto 19)when"01101",
				ab_xor(17 downto 0)&ab_xor(31 downto 18)when"01110",
				ab_xor(16 downto 0)&ab_xor(31 downto 17)when"01111",
				ab_xor(15 downto 0)&ab_xor(31 downto 16)when"10000",
				ab_xor(14 downto 0)&ab_xor(31 downto 15)when"10001",
				ab_xor(13 downto 0)&ab_xor(31 downto 14)when"10010",
				ab_xor(12 downto 0)&ab_xor(31 downto 13)when"10011",
				ab_xor(11 downto 0)&ab_xor(31 downto 12)when"10100",
				ab_xor(10 downto 0)&ab_xor(31 downto 11)when"10101",
				ab_xor(9 downto 0)&ab_xor(31 downto 10)when"10110",
				ab_xor(8 downto 0)&ab_xor(31 downto 9)when"10111",
				ab_xor(7 downto 0)&ab_xor(31 downto 8)when"11000",
				ab_xor(6 downto 0)&ab_xor(31 downto 7)when"11001",
				ab_xor(5 downto 0)&ab_xor(31 downto 6)when"11010",
				ab_xor(4 downto 0)&ab_xor(31 downto 5)when"11011",
				ab_xor(3 downto 0)&ab_xor(31 downto 4)when"11100",
				ab_xor(2 downto 0)&ab_xor(31 downto 3)when"11101",
				ab_xor(1 downto 0)&ab_xor(31 downto 2)when"11110",
				ab_xor(0)&ab_xor(31 downto 1)when"11111",
				ab_xor when others;
	
	b_m <= in_1;
	with in_2(4 downto 0) select			
		shr_result <= 
			b_m(30 downto 0)&b_m(31)when"11111",
			b_m(29 downto 0)&b_m(31 downto 30)when"11110",
			b_m(28 downto 0)&b_m(31 downto 29)when"11101",
			b_m(27 downto 0)&b_m(31 downto 28)when"11100",
			b_m(26 downto 0)&b_m(31 downto 27)when"11011",
			b_m(25 downto 0)&b_m(31 downto 26)when"11010",
			b_m(24 downto 0)&b_m(31 downto 25)when"11001",
			b_m(23 downto 0)&b_m(31 downto 24)when"11000",
			b_m(22 downto 0)&b_m(31 downto 23)when"10111",
			b_m(21 downto 0)&b_m(31 downto 22)when"10110",
			b_m(20 downto 0)&b_m(31 downto 21)when"10101",
			b_m(19 downto 0)&b_m(31 downto 20)when"10100",
			b_m(18 downto 0)&b_m(31 downto 19)when"10011",
			b_m(17 downto 0)&b_m(31 downto 18)when"10010",
			b_m(16 downto 0)&b_m(31 downto 17)when"10001",
			b_m(15 downto 0)&b_m(31 downto 16)when"10000",
			b_m(14 downto 0)&b_m(31 downto 15)when"01111",
			b_m(13 downto 0)&b_m(31 downto 14)when"01110",
			b_m(12 downto 0)&b_m(31 downto 13)when"01101",
			b_m(11 downto 0)&b_m(31 downto 12)when"01100",
			b_m(10 downto 0)&b_m(31 downto 11)when"01011",
			b_m(9 downto 0)&b_m(31 downto 10)when"01010",
			b_m(8 downto 0)&b_m(31 downto 9)when"01001",
			b_m(7 downto 0)&b_m(31 downto 8)when"01000",
			b_m(6 downto 0)&b_m(31 downto 7)when"00111",
			b_m(5 downto 0)&b_m(31 downto 6)when"00110",
			b_m(4 downto 0)&b_m(31 downto 5)when"00101",
			b_m(3 downto 0)&b_m(31 downto 4)when"00100",
			b_m(2 downto 0)&b_m(31 downto 3)when"00011",
			b_m(1 downto 0)&b_m(31 downto 2)when"00010",
			b_m(0)&b_m(31 downto 1)when"00001",
			b_m when others;

end Behavioral;

