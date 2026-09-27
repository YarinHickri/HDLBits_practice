module top_module (input p1a, p1b, p1c, p1d, p1e, p1f, output p1y,input p2a, p2b, p2c, p2d,output p2y );
wire first,second,third,fourth ; 
    assign first = p1a & p1b & p1c;
	assign second = p2a & p2b;
    assign third = p1d & p1f & p1e;
    assign fourth = p2c & p2d;
    assign p1y = first | third;
    assign p2y = second | fourth;
endmodule
