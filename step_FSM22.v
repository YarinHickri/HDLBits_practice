module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A  = 0;
    parameter B0 = 1;
    parameter B1 = 2;
    parameter C0 = 3;
    parameter C1 = 4;
    parameter D0 = 5;
    parameter D1 = 6;
    parameter D2 = 7;

    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            A:  next_state = s ? B0 : A;
            
            B0: next_state = w ? C1 : C0;
            B1: next_state = w ? C1 : C0;
            
            C0: next_state = w ? D1 : D0;
            C1: next_state = w ? D2 : D1;
            
            D0: next_state = B0;
            D1: next_state = w ? B1 : B0;
            D2: next_state = w ? B0 : B1;
            
            default: next_state = A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    assign z = (state == B1);

endmodule
