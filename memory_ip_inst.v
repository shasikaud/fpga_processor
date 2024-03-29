// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.


// Generated by Quartus Prime Version 20.1 (Build Build 720 11/11/2020)
// Created on Tue May 25 13:54:25 2021

memory_ip memory_ip_inst
(
	.address(address_sig) ,	// input [8:0] address_sig
	.clock(clock_sig) ,	// input  clock_sig
	.data(data_sig) ,	// input [15:0] data_sig
	.rden(rden_sig) ,	// input  rden_sig
	.wren(wren_sig) ,	// input  wren_sig
	.q(q_sig) 	// output [15:0] q_sig
);

