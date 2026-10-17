module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter A1 =0, A2 =1, A3 =2 , B1=3, B2 =4,B3 =5;
    reg[2:0] state,next;
    always @(*)begin 
        case(state)
            A1: next = (~ground) ? B1 : (dig ? A3 : (bump_left ? A2 : A1));
            A2: next = (~ground) ? B2 : (dig ? B3 : (bump_right ? A1 : A2));
            A3: next = (~ground) ? B1 : A3;
            B1: next = (ground) ? A1 : B1;
            B2:next = (ground) ? A2 : B2;
            B3: next = (~ground) ? B2 : B3;            
        endcase
    end
    
    always @(posedge clk or posedge areset)begin
        if(areset)
            state <= A1;
        else
            state <= next; 
    end
    
    
    assign walk_left = (state == A1);
  assign walk_right = (state == A2);
assign aaah = (state == B1 | state == B2);
    assign digging =   (state == A3 | state == B3);

endmodule

