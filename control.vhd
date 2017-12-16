----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:49 11/17/2017 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is

	port (
		opcode: in std_logic_vector(5 downto 0);
		reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
		alu_op: out std_logic_vector(3 downto 0)
	);

end control;

architecture Behavioral of control is

begin

	-- The consequences of vhdl syntax 
	--				                 R-types				              ADDI				  					SUBI				              	ANDI									ORI													SHL									SHR										BLT										beq                  	          bne                            jump                             lw                             sw									  hal
	reg_dest <= 	'1' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else  '0' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '0' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	jump <=			'0' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else  '0' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '1' when opcode="001100"  else '0' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	branch <=		'0' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else 	'0' when opcode="000110" else		'1' when opcode="001001"  else		'1' when opcode="001010"  else '1' when opcode="001011"  else '0' when opcode="001100"  else '0' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	mem_read <=		'0' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else 	'0' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '1' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	mem_to_reg <= 	'0' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else 	'0' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '1' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	mem_write <= 	'0' when opcode="000000"  else '0' when opcode="000001"  else '0' when opcode="000010" else '0' when opcode="000011" else  		'0' when opcode="000100" else   '0' when opcode="000101" else  '0' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '0' when opcode="000111"  else '1' when opcode="001000" else '0' when opcode="111111" else '0';
	alu_src <= 		'0' when opcode="000000"  else '1' when opcode="000001"  else '1' when opcode="000010" else '1' when opcode="000011" else  		'1' when opcode="000100" else   '1' when opcode="000101" else  '1' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '1' when opcode="000111"  else '1' when opcode="001000" else '0' when opcode="111111" else '0';
	reg_write <= 	'1' when opcode="000000"  else '1' when opcode="000001"  else '1' when opcode="000010" else '1' when opcode="000011" else  		'1' when opcode="000100" else   '1' when opcode="000101" else  '1' when opcode="000110" else		'0' when opcode="001001"  else		'0' when opcode="001010"  else '0' when opcode="001011"  else '0' when opcode="001100"  else '1' when opcode="000111"  else '0' when opcode="001000" else '0' when opcode="111111" else '0';
	alu_op <= 		"0010" when opcode="000000" else "0000" when opcode="000001" else "0001" when opcode="000010" else "0100" when opcode="000011" else  "0101" when opcode="000100" else "0110" when opcode="000101" else"0111" when opcode="000110" else  "1000" when opcode="001001" else		"0001" when opcode="001010" else "0011" when opcode="001011" else "0000" when opcode="001100" else "0000" when opcode="000111"  else "0000" when opcode="001000" else "0000" when opcode="111111" else "0000";


end Behavioral;

