module nibble(input logic clock, reset, ena,we);
	
	
	input logic [3:0]Data_in;
	output logic [3:0]Data_out; 
	output logic [23:0]q;
	
	output logic [23:0] out_inst;
	output logic [3:0]addr;
	output logic [7:0]y;
	output logic [7:0]x;
	output logic [2:0]op;
	
	output logic [3:0]out_addr;
	output logic [7:0]out_y;
	output logic [7:0]out_x;
	output logic [2:0]out_op;
	
	output reg ovf;
	output reg [7:0] out_comp2;
	output logic [7:0] out_mux1;
	
	output logic [7:0] out_mux1;
	
	output reg ovf_fa8;
	output reg [7:0] out_fa8;
	
	input [4:0] in_addr_ram;
	
	reg4a PC(Data_in, clock, reset, Data_out);
	
	single_port_rom ROM(Data_out,clock,q);
	reg_inst INST(q,clock,reset,out_inst);
	//fetch
	decoder DECODER(out_inst,addr,y,x,op);
	reg_x X(x,clock,reset,out_x);
	reg_y Y(y,clock,reset,out_y);
	reg_op OP(op,clock,reset,out_op);
	reg_addr ADDR(addr,clock,reset,out_addr);
	//execute/store
	complement2 COMPLEMENT(out_x,ovf,out_comp2);
	//olhar que seria o seletor
	//mux pra escolha da soma ou sub
	mux2 MUX1(out_x, out_comp2, ena, out_mux1);
	//mux pra escolha do y
	mux2 MUX2(out_y, outra coisaa, ena, out_mux2);
	
	fullAdder8(out_mux1, b,ovf_fa8, out_fa8);
	
	single_port_ram RAM (Data_out,	input [4:0] addr,	input we, clk,	output [7:0] q);
endmodule