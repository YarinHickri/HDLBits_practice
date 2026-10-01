module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    
    full_adder one(a[0],b[0],cin,cout[0],sum[0]);
    full_adder two(a[1],b[1],cout[0],cout[1],sum[1]);
    full_adder three(a[2],b[2],cout[1],cout[2],sum[2]);

endmodule

module full_adder(input a, input b,input cin,output cout,output sum);
    assign sum = (a+b+cin)%2;
    assign cout = (a+b+cin)/2;

    
endmodule
