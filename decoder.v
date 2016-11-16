module decoder(input inst[23:0], output addr[3:0],y[7:0],x[7:0],op[2:0]);
		
		assign addr = inst[20:16];
		assign y = inst[7:0];
		assign op = inst[23:21];
		assign x = inst[15:8];
		
		
endmodule