`include "correlator.v"
`timescale 1ns/1ns

module correlator_tb;

    // Inputs
    reg clk;
    reg [7:0] signal1;
    reg [7:0] signal2;
    reg reset;
    wire [3:0] correlation;

    // Instantiate the correlator module
    correlator dut (
        .clk(clk),
        .signal1(signal1),
        .signal2(signal2),
        .result(correlation),
        .reset(reset)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        clk = 0;
        reset = 0;
        signal2 = 8'b01011001;
        signal1 = 8'b10001011;

        #5
        reset = 1;
        #5 reset = 0;

        # 200;
        
        // Finish simulation
        $finish;
    end

    // Dump variables for waveform viewing
    initial begin
        $dumpfile("correlator_tb.vcd");
        $dumpvars(0, correlator_tb);
    end

endmodule
