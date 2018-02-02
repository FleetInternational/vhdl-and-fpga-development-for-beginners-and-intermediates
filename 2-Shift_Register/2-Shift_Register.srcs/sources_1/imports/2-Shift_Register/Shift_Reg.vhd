-------------------------------------------------------------------------------
-- File:		Shift_Reg.vhd
-- Engineer:	Jordan Christman
-- Description:	This is an implementation of a 4 bit shift register 
-- 				behavioral architecture.
-------------------------------------------------------------------------------

-- Lab 2 Tasks

-- 1) Fill in the "?" with the correct values
--
-- 2) Compile & Simulate Shift_Reg.vhd in ModelSim
--			* Note ModelSim will give you compiling
--			  error's if you do not change the "?"
-- 
-- 3) Implement Shift_reg.vhd on your BASYS 3 board

-- Library's
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity Declaration
entity Shift_Reg is
port (
	A 				: out std_logic;	-- single bit in register
	B 				: out std_logic;	-- single bit in register
	C 				: out std_logic;	-- single bit in register
	D 				: out std_logic;	-- single bit in register
	data_in 		: in std_logic;		-- data input (1 or 0)
	reset 			: in std_logic;		-- when this signal goes high clear 
										-- all bit values on a clock cycle
	clk 			: in std_logic);	-- input clock
end Shift_Reg;

-- Architecture Body
architecture behavior of Shift_Reg is

-- Defined Signals used in Architecture
signal A_reg, B_reg	: std_logic := '0';
signal C_reg, D_reg	: std_logic := '0';

-- Begin Architecture
begin

	-- Signal Assignments
	A <= A_reg;
	B <= B_reg;
	C <= C_reg;
	D <= D_reg;
	
	-- Process that is used to shift values
	--  		** HINT **
	-- (We want this process to be evaluated
	-- on every clock cycle) Remember sensitivity lists?
	reg_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				A_reg <= '0';
				B_reg <= '0';
				C_reg <= '0';
				D_reg <= '0';
			else
				-- 					** HINT **
				-- This is where the shifting actually occurs
				-- depending on how you code this, you can have
				-- a shift right or shift left register
				A_reg <= data_in;
				B_reg <= A_reg;
				C_reg <= B_reg;
				D_reg <= C_reg;
			end if;
		end if;
	end process reg_process;
end behavior;