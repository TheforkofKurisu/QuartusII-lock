module my_pwm_2 (
    input wire clk,           // 时钟输入
    input wire [6:0] duty,    // 7位占空比控制输入（0~127）
    output reg pwm_out        // PWM信号输出
);

reg [6:0] pwm_value;         // 实际用于比较的占空比值，最大不超过100
reg [6:0] counter;           // 计数器，0~99

always @(posedge clk) begin
    // duty大于100时，输出最大占空比100
    if (duty >= 100)
        pwm_value <= 100;
    else
        pwm_value <= duty;

    // 计数器递增，达到100重置为0
    if (counter == 99)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(posedge clk) begin
    // 输出高电平占比由pwm_value决定
    if (counter < pwm_value)
        pwm_out <= 1'b1;
    else
        pwm_out <= 1'b0;
end

endmodule