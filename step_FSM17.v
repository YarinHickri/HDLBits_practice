module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    
      parameter A = 0, B= 1, C=2 ,D =3, E=4;
    reg [2:0] state,next;
    reg [3:0] counter ;
     wire odd;
    always @(*) begin
        case(state)
            A:next = (~in) ? B:A;
            B:next = (counter == 8) ? C:B;
            C:next = (in) ? D:E;
            D: next = (~in) ? B:A;
            E :next = (in) ? A:E;
       
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else 
            state <= next;
    
    end
    
    always @(posedge clk)
        if(reset)
            counter <= 0;
    else if (state == B )
        counter <= counter +1 ;
    else
        counter <= 0;
    
    always @(posedge clk)begin
        if(state == B & counter <8)
            out_byte <={in ,out_byte[7:1]};
    
    end
    wire parity_reset;
    assign parity_reset = reset | (state == A) | (state == E) | (state == D);
    
    parity  check (.clk(clk),.reset(parity_reset),.in(in & (state == B)),.odd(odd));
    
    assign done = (state == D & odd==1);



endmodule

