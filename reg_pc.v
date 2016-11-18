module reg_pc ( 

input logic [4:0] Data_in,
input logic clock, reset,
output logic [4:0] Data_out);

always_ff @ ( posedge reset or posedge clock) 
	if (reset) Data_out <= 5'b0;

else Data_out <= Data_in;

endmodule