

`timescale 1 ps/ 1 ps
module CompleComb_vlg_ts();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg [7:0]a;
// wires                                               
wire cout;
wire [7:0]s;

// assign statements (if any)                          
complement2 i1 (
// port map - connection between master ports and signals/registers   
	.a(a),
	.ovf(ovf),
	.s(s)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
                                                       
// --> end                                             
$display("Running testbench"); 
                   
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin
		a = 8'b0000_0010; 
		#10;
		if({s} != 8'b1111_1110) begin 
			$display("Error at 0");
			$stop;
		end
		a = 8'b0000_0001; 
		#10;
		if({s} != 8'b1111_1110) begin 
			$display("Error at 1");
			$stop;
		end

		a = 8'b0000_0000; 
		#10;
		if({s} != 8'b0000_0000) begin 
			$display("Error at 3");
			$stop;
		end		
		$stop;
		                                                 
@eachvec;                                              
// --> end                                             
end                                                    
endmodule
