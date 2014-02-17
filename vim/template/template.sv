// <+FILENAME+>
// Writen by <+AUTHOR+>
// Date Created <+DATECREATED+>
// <+Last Edited: +>


module <+FILENAMENOEXT+> (
	input logic Clock, nReset, D,
	output logic Q, nQ);

timeunit 1ns; timeprecision 1ps;

always_ff @ (posedge Clock or negedge nReset)
begin
	if(!nReset) //Reset the system
		Q <= 0;
	else
	 begin
		Q <= D;
	 end
end

always_comb
 begin
	nQ = ~Q;
 end
endmodule
