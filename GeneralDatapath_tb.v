module GeneralDatapath_tb;

reg PCload, JMPmux, IRload, Meminst, MemWr,Aload,Reset,Clock,Sub;
reg[7:0] data_in;
reg[1:0] Asel;
wire[7:0] dataOut;
wire Apos, Aeq0;
reg testStart;
wire[2:0] IR;

GeneralDatapath testing (PCload,JMPmux,IRload,Meminst,MemWr,Aload,Reset,Clock,Sub,Asel,Aeq0,Apos,IR,data_in,dataOut,testStart);


initial Clock = 0;
//Clock pulse generator
always #5 Clock = ~Clock;

initial
begin
//initialize all inputs
#0 data_in = 8'd10 ; IRload = 0 ; JMPmux = 0 ; PCload = 0 ; Meminst = 0 ; MemWr = 0 ; Asel = 2'd0 ; Aload =0 ; Reset = 1 ; Sub = 0 ;
#10  testStart = 1;
#10  Reset = 0; 
#10  testStart = 0; IRload = 1;



#20 $finish; 
end
endmodule