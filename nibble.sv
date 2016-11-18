module nibble(input logic clock, reset, ena,we);
	
	
	wire [3:0]Data_in;
	wire [3:0]Data_out; 
	wire [23:0]q;
	
	
	reg_pc PC(Data_in, clock, reset, Data_out);
	sum1 ADD1(Data_out,ovf1,Data_in);
	single_port_rom ROM(Data_out,clock,q);
	
	wire [23:0] out_inst;
	wire [3:0]addr;
	wire [7:0]y,x;
	wire [2:0]op;;	

	reg_inst INST(q,clock,reset,out_inst);
	decoder DECODER(out_inst,addr,y,x,op);
	reg_x X(x,clock,reset,out_x);
	reg_y Y(y,clock,reset,out_y);
	reg_op OP(op,clock,reset,out_op);
	reg_addr ADDR(addr,clock,reset,out_addr);
	
	wire [7:0] out_comp2;
	complement2 COMPLEMENT(out_x,ovf,out_comp2);
	
	wire [7:0] out_mux1;
	mux2 MUX1(out_x, out_comp2, mux1, out_mux1);	
	
	wire [7:0] out_mux2;
	mux2 MUX2(out_y, ram_out, out_mux2);
	
	wire [7:0] out_fa8;
	fullAdder8(out_mux1, b,ovf_fa8, out_fa8);
	
	wire [7:0] reg_r_out;
	reg_r R(out_fa8,clock,reset,reg_r_out);
	
	
	wire [7:0] ram_out;
	single_port_ram RAM (reg_r_out, addr,	out_we, clock,ram_out);
	
	always @(negedge clk)
	begin
		out<= reg_R_out;
	end

endmodule