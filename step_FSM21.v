module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A =0, B=1;
    reg  [1:0] state,next; 
    
    always @(*)begin
        case(state)
       A:next = x ? B:A;     
       B:next = B;     
        endcase
    end
    always @(posedge clk or posedge areset)begin
               if (areset)
                   state<=A;
            else 
                state<= next;
            end
    assign z = (state == A & x==1) | (state ==B & x== 0);
    

endmodule

