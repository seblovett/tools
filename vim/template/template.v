// <+FILENAME+>
// Writen by <+AUTHOR+>
// Date Created <+DATECREATED+>
// <+Last Edited: +>


module <+FILENAMENOEXT+> (
	input wire Clock, nReset, D,
	output reg Q, nQ);

always @ (posedge Clock or negedge nReset)
begin
	if(!nReset) //Reset the system
		Q <= 0;
	else
	 begin
		Q <= D;
	 end
end

always @ (*)
 begin
	nQ = ~Q;
 end
endmodule
