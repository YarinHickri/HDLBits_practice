module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter A = 0, B= 1, C=2 ,D =3, E=4;
    reg [2:0] state,next,counter ;
     
    always @(*) begin
        case(state)
            A:next = (~in) ? B:A;
            B:next = (counter == 7) ? C:B;
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
    else if (state == B)
        counter <= counter +1 ;
    else
        counter <= 0;
    
    
    assign done = (state == D);
    
   
endmodule

