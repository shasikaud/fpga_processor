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
output reg[5:0] state = 6'd0; // 6 bit output to the conntrol units
// reg[5:0] next_state = 6'd0;

// Define the possible states
parameter idle = 6'd0;
parameter fetch1 = 6'd1;
parameter fetch2 = 6'd2;
parameter fetch3 = 6'd3;
parameter clac = 6'd4;
parameter ldac1 = 6'd5;
parameter ldac2 = 6'd6;
parameter ldac3 = 6'd7;
parameter ldac4 = 6'd8;
parameter stac1 = 6'd9;
parameter stac2 = 6'd10;
parameter stac3 = 6'd11;
parameter stac4 = 6'd12;
parameter mvacr = 6'd13;
parameter mvrac = 6'd14;
parameter add = 6'd15;
parameter mul = 6'd16;


//reg[5:0] next_state = 6'd0;


//state = idle;

always @(posedge clock)

    begin
//    state<= next_state;     // assign the next state for the control unit


        if(state == idle && start == 0) // remains in the idle state till the start signal is received
            begin
            state <=  idle;
            end

        // start == 1 
        // fetch cycle
        else if (state == idle && start == 1)
            begin
            state  <= fetch1;
            end

        else if (state == fetch1 && start == 1)
            begin
            state  <= fetch2;
            end

        else if (state == fetch2 && start == 1)
            begin
            state  <= fetch3;
            end

        else if(state == fetch3 && start == 1)  
            begin
            case(IR[15:0])   

            16'd0: state  <= idle;
            16'd1: state  <= clac;
            16'd2: state  <= ldac1;
            16'd3: state  <= stac1;
            16'd4: state  <= mvacr;
            16'd5: state  <= mvrac;
            16'd6: state  <= add;
            16'd7: state  <= mul;
            // 16'd14: state  <= idle;
            // 16'd15: state  <= add;
            // 16'd16: state  <= idle;
            // 16'd17: state  <= add;
            // 16'd18: state  <= idle;
            // 16'd19: state  <= add;

        //i_clac: state  <= clac;

        //more cases
        //how to jump back to fetch1 at end

            endcase

            end

        else if((state == add || state == ldac4 || state == stac4 || state == clac || state == mvacr || state == mvrac || state == mul ) && start == 1 )
            begin
            state <=idle;
            end

        else if(start == 1)
            begin

            state  <= state + 6'd1;  //whats's this?

            end

    end

endmodule




