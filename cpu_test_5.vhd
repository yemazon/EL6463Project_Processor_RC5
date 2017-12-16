--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:33:06 12/15/2017
-- Design Name:   
-- Module Name:   C:/Users/Shuai/Desktop/NYU-6463-Processor/cpu_test_5.vhd
-- Project Name:  NYU-6463-Processer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE	IEEE.STD_LOGIC_TEXTIO.ALL;
USE	STD.TEXTIO.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cpu_test_5 IS
END cpu_test_5;

 
ARCHITECTURE behavior OF cpu_test_5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clr : IN  std_logic;
         clk : IN  std_logic;
         di_vld : IN  std_logic;
         din : IN  std_logic_vector(63 downto 0);
         ukey : IN  std_logic_vector(127 downto 0);
         enc_out : OUT  std_logic_vector(63 downto 0);
         dec_out : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clr : std_logic := '0';
   signal clk : std_logic := '0';
   signal di_vld : std_logic := '0';
   signal din : std_logic_vector(63 downto 0) := (others => '0');
   signal ukey : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal enc_out : std_logic_vector(63 downto 0);
   signal dec_out : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clr => clr,
          clk => clk,
          di_vld => di_vld,
          din => din,
          ukey => ukey,
          enc_out => enc_out,
          dec_out => dec_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 
chk_result: process
	variable tmp_din 		: std_logic_vector(63 downto 0);
	variable tmp_key 		: std_logic_vector(127 downto 0);
	variable l				: line;
	variable good_val 	: boolean;
	variable r 				: real;
	variable space 		: character;
	file vector_file: text is in "enc.txt";
begin
	WAIT FOR 200 NS;
   while not endfile(vector_file) loop
      wait for 20000 ns;
		readline(vector_file, l);
		hread(l, tmp_key, good_val);
		assert good_val report "bad vector value";
		read(l, space, good_val);
		assert good_val report "bad vector value";
		hread(l, tmp_din, good_val);
		assert good_val report "bad vector value";
		
		din <= tmp_din;
		ukey <= tmp_key;
		clr <= '0';
      wait for clk_period*10;
		
		clr <= '1';
		wait for clk_period*10;
		di_vld <= '0';
		wait for clk_period*0.5;
		di_vld <= '1';
		wait for 129400 ns;
   end loop;
   wait;
end process;
 
 
chk_result2: process
	variable tmp_key 		: std_logic_vector(127 downto 0);
	variable tmp_dout 	: std_logic_vector(63 downto 0);
	variable l				: line;
	variable good_val 	: boolean;
	variable r 				: real;
	variable vector_time : time;
	variable space 		: character;
	file vector_file: text is in "dec.txt";
begin
	WAIT FOR 200 NS;
	--count := 1;
   while not endfile(vector_file) loop
		readline(vector_file, l);
		hread(l, tmp_key, good_val);
		assert good_val report "bad vector value";
		read(l, space, good_val);
		assert good_val report "bad vector value";
		hread(l, tmp_dout, good_val);
		assert good_val report "bad vector value";
		--while data_rdy = '0' loop
		wait for 150000 ns;
		--end loop;
		--report "test: " & integer'image(count)severity note;
		--count := count + 1;
      assert (tmp_dout/=enc_out) report "output matched!";
		
   end loop;
   wait;
end process;

 
 

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--		
--		clr <= '0';
--		din <= x"0000000000000000";
--		ukey <= x"00000000000000000000000000000000";
--		
--      wait for clk_period*10;
--		
--		clr <= '1';
--		wait for clk_period;
--		
--		di_vld <= '0';
--		wait for clk_period;
--		
--		di_vld <= '1';
--		
--		
--		wait for 100000 ns;
--		
--		clr <= '0';
--		din <= x"0000000000000000";
--		ukey <= x"00000000000000000000000000000000";
--		
--      wait for clk_period*10;
--		
--		clr <= '1';
--		wait for clk_period;
--		
--		di_vld <= '0';
--		wait for clk_period;
--		
--		di_vld <= '1';
--
--      wait;
--   end process;

END;
