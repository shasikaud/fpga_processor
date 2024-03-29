
module state_machine(clock, start, IR, state);

input clock;           // clock of the state machine
input start;           // Start signal to start the state machine from its idle state
input[15:0] IR;        // 16 bit instruction register input
output reg[5:0] state = 6'd0; // 6 bit output to the conntrol units

parameter idle = 6'd0;
parameter fetch1 = 6'd1;
parameter fetch2 = 6'd2;
parameter fetch3 = 6'd3;
parameter fetch4 = 6'd4;
parameter fetch5 = 6'd5;
parameter fetch6 = 6'd6;
parameter ldr11 = 6'd7;
parameter ldr12 = 6'd8;
parameter ldr13 = 6'd9;
parameter ldr14 = 6'd10;
parameter ldr21 = 6'd11;
parameter ldr22 = 6'd12;
parameter ldr23 = 6'd13;
parameter ldr24 = 6'd14;
parameter stac1 = 6'd15;
parameter stac2 = 6'd16;
parameter stac3 = 6'd17;
parameter stac4 = 6'd18;
parameter add1 = 6'd19;
parameter add2 = 6'd20;
parameter mul1 = 6'd21;
parameter mul2 = 6'd22;
parameter FINISH = 6'd23;

always @(posedge clock)

    begin
//    state<= next_state;     // assign the next state for the control unit


        if(start == 0) // remains in the idle state till the start signal is received
            begin
            state <=  idle;
            end

        // start == 1 
        // fetch cycle
        else if (state == idle && start == 1)
            begin
            state  <= fetch1;
            end

        else if(state == fetch6 && start == 1)  
            begin
            case(IR[15:10])  
            6'd0: state  <= idle;
            6'd1: state  <= ldr11;
            6'd2: state  <= ldr21;
            6'd3: state  <= stac1;
            6'd4: state  <= add1;
            6'd5: state  <= mul1;

            endcase

            end

        else if((state == add2 || state == ldr14 || state == ldr24 || state == stac4 || state == mul2 ) && start == 1 )
            begin
            state <=fetch1;
            end

        else if(start == 1)
            begin

            state  <= state + 6'd1;  //whats's this?

            end

    end

endmodule
