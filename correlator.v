module correlator(
input clk,
input reset,
input [7:0] signal1,
input [7:0] signal2,
output reg [3:0] result
);

reg [14:0] signal1_with_padding;
reg [14:0] signal2_with_padding;
reg [14:0] bitwise_and;
// reg [3:0] result [0:14];
integer i, count, j;

always @(posedge clk or posedge reset) begin

    if (reset) begin
        signal1_with_padding <= {7'b0, signal1};
        signal2_with_padding <= {signal2, 7'b0};
        count <= 0;
        i <= 0;
        result <= 0;
        
    end
    
    else begin
        bitwise_and <= signal1_with_padding & signal2_with_padding;

        result <= bitwise_and[0] + bitwise_and[1] + bitwise_and[2] + bitwise_and[3] + bitwise_and[4] + bitwise_and[5] + bitwise_and[6] + bitwise_and[7] + bitwise_and[8] + bitwise_and[9] + bitwise_and[10] + bitwise_and[11] + bitwise_and[12] + bitwise_and[13] + bitwise_and[14];

        if(count <= 15)
            count <= count + 1;
        else
            count <= 0;

        if (count < 7) begin
            signal2_with_padding <= signal2_with_padding >> 1; 
        end
        else begin
            signal1_with_padding <= signal1_with_padding << 1;
        end

    end
    
end

// always @(*) begin
//     for(j = 0; j<15; j = j + 1) begin
//         correlation[j] = result[j];
//     end
// end

endmodule