module microprocessor_tb;

reg [7:0]data_in;
reg Enter, Reset, Clock, testStart;
wire [7:0]dataOut, CheckState;

microprocessor microP(data_in,Enter,Reset,Clock,testStart,dataOut,CheckState,Halt);

initial Clock = 0;
//Clock pulse generator
always #10 Clock = ~Clock;

initial
begin
//initialize all inputs
#0 Reset = 1'b1; testStart = 1'b1;
//#40 Reset = 1'b0; testStart = 1'b0;
//#80 data_in = 8'd10; Enter = 1'b1;
//#120 data_in = 8'd20; Enter = 1'b1;
//#130 Enter = 1'b0;
#160 $finish; 
end
endmodule