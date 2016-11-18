module nibble(input logic clock, reset, ena,
					input logic [3:0]Data_in
					output logic [3:0]Data_out, 
					output logic [23:0]q,
					output logic [23:0] out_inst,
					output logic [3:0]addr,
					output logic [7:0]y,
					output logic [7:0]x,
					output logic [2:0]op);
	
	reg4a PC(Data_in, clock, reset, Data_out);
	single_port_rom ROM(Data_out,clock,q);
	reg_inst INST(q,clock,reset,out_inst);
	decoder DECODER(out_inst,addr,y,x,op);
	
	single_port_ram RAM (Data_out,	input [4:0] addr,	input we, clk,	output [7:0] q);
endmodule