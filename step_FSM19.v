module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter A = 0;
    parameter B    = 2'd1;
    parameter C   = 2'd2;

    reg [1:0] state, next_state;

    // Next state logic
    always @(*) begin
        case (state)
            A: next_state = x ? B : A;
            B:    next_state = x ? B : C;
            C:   next_state = x ? B : A;
            default: next_state = A;
        endcase
    end

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    assign z = (state == C & x);

endmodule

