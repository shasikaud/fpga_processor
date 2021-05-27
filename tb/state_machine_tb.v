`timescale 1ns/1ps
module state_machine_tb();
    reg clock, start;
    reg [15:0] IR;
    wire [5:0] state;
    // wire [5:0] next_state

    always
		begin
			#5 clock = 1;
			#5 clock = 0;
		end
    state_machine state_machine_dut(
        .clock(clock),
        .start(start),
        .IR(IR),
        .state(state)
        // .next_state(next_state)
    );

    initial begin
        start = 0;
        IR = 16'd0;

        #50;
//
       start = 0;
       IR = 16'd1;

       #50;

       start = 1;
       IR = 16'd1;

       #50;
//
//        start = 1;
//        IR = 16'd2;
//
//        #50; 
//
//        start = 1;
//        IR = 16'd3;
//
//        #50; 
//
//        start = 1;
//        IR = 16'd4;
//
//        #50; 
    end

endmodule        