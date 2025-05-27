module tb_traffic_light_fsm;

reg clk, rst;
wire [1:0] ns_light, ew_light;

traffic_light_fsm uut (
    .clk(clk),
    .rst(rst),
    .ns_light(ns_light),
    .ew_light(ew_light)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    rst = 1; #10;
    rst = 0;
    #100 $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0d | NS Light=%b | EW Light=%b", $time, ns_light, ew_light);
end

endmodule
