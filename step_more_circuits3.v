module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    reg [255:0] q_next;
    
  integer i;
    integer row, col;
    integer neighbors;

    always @(*) begin
        for (i = 0; i < 256; i = i + 1) begin
            
            row = i / 16;
            col = i % 16;
            
            neighbors = 0;
            
            neighbors = neighbors + q[((row + 15) % 16) * 16 + ((col + 15) % 16)]; 
            neighbors = neighbors + q[((row + 15) % 16) * 16 + col];                
            neighbors = neighbors + q[((row + 15) % 16) * 16 + ((col + 1) % 16)];  
            
            neighbors = neighbors + q[row * 16 + ((col + 15) % 16)];                 
            neighbors = neighbors + q[row * 16 + ((col + 1) % 16)];                  
            
            neighbors = neighbors + q[((row + 1) % 16) * 16 + ((col + 15) % 16)];  
            neighbors = neighbors + q[((row + 1) % 16) * 16 + col];                  
            neighbors = neighbors + q[((row + 1) % 16) * 16 + ((col + 1) % 16)];   
     
            if (neighbors == 3) begin
                q_next[i] = 1'b1;
            end
            else if (neighbors == 2) begin
                q_next[i] = q[i];
            end
            else begin
                q_next[i] = 1'b0;
            end
            
        end
    end
    
    
    always @(posedge clk)begin
        if(load)
            q<=data;
        else
        q<=q_next;
    
    end
endmodule

