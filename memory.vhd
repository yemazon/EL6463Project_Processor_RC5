----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:27 11/17/2017 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memory is

	port (
		clk: in STD_LOGIC;
		clr: in Std_logic;
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead: in STD_LOGIC;
		
		di_vld: in std_logic;
		din: in std_logic_vector(63 downto 0);	
		ukey: in std_logic_vector(127 downto 0);
		
		read_data: out STD_LOGIC_VECTOR (31 downto 0);
		enc_out: out STD_LOGIC_VECTOR (63 downto 0);
		dec_out: out STD_LOGIC_VECTOR (63 downto 0)
	);

end memory;

architecture Behavioral of memory is

	type mem_array is array(0 to 63) of STD_LOGIC_VECTOR (31 downto 0);

	signal data_mem: mem_array := (
		 X"00000000", -- 0
       X"00000000", -- 1
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000", -- mem 10 
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",  
		 X"00000000", -- mem 20
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000", -- mem 30
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000", 
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",  
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000",
		 X"00000000", 
		 X"00000000",		 
		 X"00000000");

begin

	read_data <= data_mem(conv_integer(address(5 downto 0))) when MemRead = '1' else X"00000000";
	
	enc_out <= data_mem(32)&data_mem(33);
	dec_out <= data_mem(34)&data_mem(35);
	
	
--	--mem_process: process(address, write_data, clk)
--	mem_process: process(clk, clr)
--	begin
--		if clk = '1' and clk'event then
--			if (MemWrite = '1') then
--				data_mem(conv_integer(address(5 downto 0))) <= write_data;
--			end if;
--		end if;
--	end process mem_process;
	
	mem_process: process(clk, clr)
	begin
		if clr = '0' then
			data_mem(0) <= X"B7E15163"; 
			data_mem(1) <= X"9E3779B9";
		else
			if di_vld = '0' then
				data_mem(31) <= din(31 downto 0);
				data_mem(30) <= din(63 downto 32);
				
				data_mem(26) <= ukey(31 downto 0);
				data_mem(27) <= ukey(63 downto 32);
				data_mem(28) <= ukey(95 downto 64);
				data_mem(29) <= ukey(127 downto 96);
			else
				if clk = '1' and clk'event then
					if (MemWrite = '1') then
						data_mem(conv_integer(address(5 downto 0))) <= write_data;
					end if;
				end if;
			end if;
		end if;
	end process mem_process;

end Behavioral;

