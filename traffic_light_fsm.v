module traffic_light_fsm (
    input wire clk,
    input wire rst,
    output reg [1:0] ns_light, // 00=Red, 01=Yellow, 10=Green
    output reg [1:0] ew_light
);

reg [1:0] state, next_state;

localparam S0 = 2'd0, // NS: Green, EW: Red
           S1 = 2'd1, // NS: Yellow, EW: Red
           S2 = 2'd2, // NS: Red, EW: Green
           S3 = 2'd3; // NS: Red, EW: Yellow

// State transition
always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

// Next state logic
always @(*) begin
    case (state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S0;
        default: next_state = S0;
    endcase
end

// Output logic
always @(*) begin
    case (state)
        S0: begin ns_light = 2'b10; ew_light = 2'b00; end // NS Green, EW Red
        S1: begin ns_light = 2'b01; ew_light = 2'b00; end // NS Yellow, EW Red
        S2: begin ns_light = 2'b00; ew_light = 2'b10; end // NS Red, EW Green
        S3: begin ns_light = 2'b00; ew_light = 2'b01; end // NS Red, EW Yellow
    endcase
end

endmodule
