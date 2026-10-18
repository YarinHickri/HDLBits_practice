module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter A = 0;
    parameter B = 1;
    parameter C = 2;
    reg [1:0] state, next_state;
    always @(*) begin
        case (state)
            A: next_state = x ? B : A; 
            B: next_state = x ? C : B;
            C: next_state = x ? C : B; 
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    assign z = (state == B); 
endmodule

