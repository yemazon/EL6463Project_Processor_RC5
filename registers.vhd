----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:04 11/17/2017 
-- Design Name: 
-- Module Name:    registers - Behavioral 
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

entity registers is
	port (
		clk: in std_logic;
		clr: in std_logic;
		reg_write: in std_logic;
		read_reg_1, read_reg_2, write_reg: in std_logic_vector(4 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data_1, read_data_2: out std_logic_vector(31 downto 0)
	);
end registers;

architecture Behavioral of registers is

	type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
	signal reg_mem: mem_array := (
        "00000000000000000000000000000000", -- 0
        "00000000000000000000000000000000", -- 1
        "00000000000000000000000000000000", -- 2
		  "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        --X"0000004E", -- 3
        --X"0000001A", -- 4
        --X"00000004", -- 5
        --X"B7E15163", -- 6
        --X"9E3779B9", -- 7
        X"00000000", -- 8
        "00000000000000000000000000000000", -- 9
        "00000000000000000000000000000000", -- 10 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- 20
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- 30
        "00000000000000000000000000000000"
    );

begin

	read_data_1 <= reg_mem(to_integer(unsigned(read_reg_1)));
   read_data_2 <= reg_mem(to_integer(unsigned(read_reg_2)));

   process(clk, reg_write)
       begin
		 if clr = '0' then 
			reg_mem(0)<=X"00000000";
			reg_mem(1)<=X"00000000";
			reg_mem(2)<=X"00000000";
			reg_mem(3)<=X"00000000";
			reg_mem(4)<=X"00000000";
			reg_mem(5)<=X"00000000";
			reg_mem(6)<=X"00000000";
			reg_mem(7)<=X"00000000";
			reg_mem(8)<=X"00000000";
			reg_mem(9)<=X"00000000";
			reg_mem(10)<=X"00000000";
			reg_mem(11)<=X"00000000";
			reg_mem(12)<=X"00000000";
			reg_mem(13)<=X"00000000";
			reg_mem(14)<=X"00000000";
			reg_mem(15)<=X"00000000";
			reg_mem(16)<=X"00000000";
			reg_mem(17)<=X"00000000";
			reg_mem(18)<=X"00000000";
			reg_mem(19)<=X"00000000";
			reg_mem(20)<=X"00000000";
			reg_mem(21)<=X"00000000";
			reg_mem(22)<=X"00000000";
			reg_mem(23)<=X"00000000";
			reg_mem(24)<=X"00000000";
			reg_mem(25)<=X"00000000";
			reg_mem(26)<=X"00000000";
			reg_mem(27)<=X"00000000";
			reg_mem(28)<=X"00000000";
		 else
			if clk='1' and clk'event and reg_write='1' then
           reg_mem(to_integer(unsigned(write_reg))) <= write_data;
			end if;
		 end if;
   end process;

end Behavioral;

