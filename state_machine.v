/*
reset button needed
clear memory needed
This module defines the state machine of the processor
When the start signals is high the state machine will start
At every posedge of the clock the stage machine will compute 
    the next state to be fed into the the control unit
*/
module state_machine(clock, start, IR, state);

input clock;           // clock of the state machine
input start;           // Start signal to start the state machine from its idle state
input[15:0] IR;        // 16 bit instruction register input
output reg[5:0] state; // 6 bit output to the conntrol units

// Define the possible states
parameter idle = 6'd0;
parameter fetch1 = 6'd1;
parameter fetch2 = 6'd2;
parameter fetch3 = 6'd3;
parameter clac = 6'd4;
parameter ldac1 = 6'd5;
parameter ldac2 = 6'd6;
parameter ldac3 = 6'd7;
parameter stac1 = 6'd8;
parameter stac2 = 6'd9;
parameter stac3 = 6'd10;
parameter mvacr = 16'd11;
parameter mvrac = 16'd12;
parameter add = 6'd13;
parameter mul = 6'd14;


reg[5:0] next_state = 6'd0;



always @(posedge clock)

begin
state<= next_state;     // assign the next state for the control unit


if(state == idle && start == 0) // remains in the idle state till the start signal is received
    begin
    next_state <= 6'd0;
    end

// start == 1 
// fetch cycle
if (state == idle && start == 1)
    begin
    next_state <= fetch1;
    end

else if (state == fetch1 && start == 1)
    begin
    next_state <= fetch2;
    end

else if (state == fetch2 && start == 1)
    begin
    next_state <= fetch3;
    end

else if(state == fetch3 && start == 1)  
    begin
    case(IR[15:0])   

    16'b0: next_state <= idle;
    16'b1: next_state <= add;

//i_clac: next_state <= clac;

//more cases
//how to jump back to fetch1 at end

endcase

end

else if(state == add)
begin
next_state<=idle;
end

else
begin

next_state <= state + 6'd1;  //whats's this?

end

end

endmodule




