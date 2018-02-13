-------------------------------------------------------------------------------
-- File:		USR.vhd
-- Engineer:	Jordan Christman
-- Description:	This is an implementation of a 8 bit Universal Shift Register 
-- 				behavioral architecture.
-------------------------------------------------------------------------------

-- Lab 3 Tasks

-- 1) Fill in the "?" with the correct values
--
-- 2) Compile & Simulate USR.vhd in ModelSim
--			* Note ModelSim will give you compiling
--			  error's if you do not change the "?"
-- 
-- 3) Implement USR.vhd on your BASYS 3 board

-- Use the comments to help you figure out how to
-- get this design to work

-- Librarys
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity Declariation
entity USR is 
generic (
	data_width 	: integer := 8);
port (
	A 			: out std_logic_vector(data_width - 1 downto 0);
	I 			: in std_logic_vector(data_width - 1 downto 0);
	S			: in std_logic_vector(1 downto 0);
	reset 		: in std_logic;
	clk			: in std_logic);
end USR;

-- Architecture Body
architecture behavior of USR is

-- signal we change the value of to change the output
signal A_reg	: std_logic_vector(data_width - 1 downto 0);

begin

	-- Assign the output to ???
	A <= A_reg;
	
	-- Process for all shift register operations
	-- We want this process to be evaluated every
	-- clock cycle. So what should we put in the
	-- sensitivity list?
	USR_proc: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				-- what value do we want to reset to ???
				A_reg <= (others => '0');
			else
				case S is
					when "00" => -- Hold
						A_reg <= A_reg;
						
					when "01" => -- Right shift
						-- Be sure to note data types and syntax
						A_reg(data_width - 1) <= '0';
						
						-- Use the left shift as a reference
						A_reg(data_width - 2 downto 0) <= A_reg(data_width-1 downto 1);
						
					when "10" => -- Left shift
						A_reg(data_width - 1 downto 1) <= A_reg(data_width - 2 downto 0);
						A_reg(0) <= '0';
						
					when "11" => -- Parallel Load
						A_reg <= I;
						
					when others => -- Error code
						A_reg <= (others => 'X');
						
				end case;
			end if;
		end if;
	end process USR_proc;
end behavior;