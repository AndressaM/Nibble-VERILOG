
`timescale 1 ps/ 1 ps
module FullAdderComb_vlg_ts();

reg eachvec;

reg [7:0]a;
reg [7:0]b;
// wires                                               
wire cout;
wire [7:0]s;

// assign statements (if any)                          
fullAdder8 i1 (
// port map - connection between master ports and signals/registers   
	.a(a),
	.b(b),
	.ovf(ovf),
	.s(s)
);
initial                                                
begin                                                  
                                       
$display("Running testbench"); 
                   
end                                                    
always                                                 
               
begin                                                  
		a = 70;	b = 1;
		#10;
		if({ovf,s} != 71) begin
			$display("Error 1");
			$stop;
		end	
		a = 10; b = 16;
		#10;
		if({ovf,s} != 27) begin
			$display("Error 2");
			$stop;
		end

		#10
		a = 0;
		b = 0;
		#10;
		if({ovf,s} != 0) begin
			$display("Error 2");
			$stop;
		end
		$stop;
		                                                 
@eachvec;                                              
// --> end                                             
end                                                    
endmodule
