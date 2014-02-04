// <+FILENAME+>
// Writen by <+AUTHOR+>
// Date Created <+DATECREATED+>
// Last Edited: 


module <+FILENAME+> (
	input logic Clock, nReset, D
	output logic Q, nQ);

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
