module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire a,b,c,d;
    full_adder one(x[0],y[0],1'b0,a,sum[0]);
    full_adder two(x[1],y[1],a,b,sum[1]);
    full_adder three(x[2],y[2],b,c,sum[2]);
    full_adder four(x[3],y[3],c,d,sum[3]);
    assign sum[4] = d;

endmodule

module full_adder(input a,b,cin ,output cout,sum);
    assign sum = (a+b+cin)%2;
    assign cout = (a+b+cin)/2;
    endmodule



// also can by 	assign sum = x+y;
