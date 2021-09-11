`timescale 1 ns/10 ps
module core_tb();

    reg clock;
    reg reset;
    wire [31:0] rd_data;
    
    core UUT(
        .clock(clock),
        .reset(reset),
        .rd_data(rd_data));
    
    always #5 clock <= ~clock;

    // always #1000 reset <= ~reset;

    always 
    begin
        clock = 0;
        reset = 1;

        #12;

        reset = 0;

        #2000;
    end
endmodule