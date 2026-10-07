module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire first,second,third;
    bcd_fadd one(a[3:0],b[3:0],cin,first,sum[3:0]);
    bcd_fadd two(a[7:4],b[7:4],first,second,sum[7:4]);
    bcd_fadd three(a[11:8],b[11:8],second,third,sum[11:8]);
    bcd_fadd four(a[15:12],b[15:12],third,cout,sum[15:12]);
        
    

endmodule
