module half_adder(input a,input b, output s,output c);  
xor sum(s,a,b); 
and carry(c,a,b); 
endmodule

module full_adder(output s, c_out, input a, b, c_in);

wire w1, w2,w3,w4;
xor xor1(w1, a, b);
xor xor2(s, w1, c_in);
and and1(w3, a, b);
and and2(w4, w1, c_in);
or or1(c_out, w3, w4);
endmodule

module bit_adder(input a0 ,a1, a2, a3 ,b0, b1, b2, b3,output s0 ,s1 ,s2 ,s3 ,c);
wire c1,c2,c3;

half_adder h1(a0,b0,s0,c1);
full_adder f1(s1,c2,a1,b1,c1);
full_adder f2(s2,c3,a2,b2,c2);
full_adder f3(s3,c,a3,b3,c3);


endmodule

module main_block(input a0,a1,a2,a3,b,b0,b1,b2,b3,output s0,s1,s2,s3,c);

wire w1,w2,w3,w4;
and a1(w1,a0,b);
and a2(w2,a1,b);
and a3(w3,a2,b);
and a4(w4,a3,b);

bit_adder add1(w1,w2,w3,w4,b0,b1,b2,b3,s0,s1,s2,s3,c);


endmodule

module multiplier(input a0,a1,a2,a3,b0,b1,b2,b3,output p0,p1,p2,p3,p4,p5,p6,p7);

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
and a1(p0,a0,b0);
and a2(w2,a1,b1);
and a3(w3,a2,b2);
and a4(w4,a3,b3);

main_block m1(a0,a1,a2,a3,b1,w2,w3,w4,1'b0,p1,w5,w6,w7,w8);
main_block m2(a0,a1,a2,a3,b2,w5,w6,w7,w8,p2,w9,w10,w11,w12);
main_block m3(a0,a1,a2,a3,b3,w9,w10,w11,w12,p3,p4,p5,p6,p7);


endmodule