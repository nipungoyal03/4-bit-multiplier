module test_tb;
reg a0,a1,a2,a3,b0,b1,b2,b3;
wire p0,p1,p2,p3,p4,p5,p6,p7;
integer i;

multiplier test(a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,p2,p3,p4,p5,p6,p7);

initial begin

   $dumpfile("test_tb.vcd");
   $dumpvars(0,test_tb);
   
   for(i=0;i<256;i=i+1)begin
      {a0,a1,a2,a3,b0,b1,b2,b3}=i;
      #10;
   end
    
end

endmodule