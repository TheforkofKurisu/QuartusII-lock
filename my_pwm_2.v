module my_pwm_2 (
    input wire clk,           // ʱ������
    input wire [6:0] duty,    // 7λռ�ձȿ������루0~127��
    output reg pwm_out        // PWM�ź����
);

reg [6:0] pwm_value;         // ʵ�����ڱȽϵ�ռ�ձ�ֵ����󲻳���100
reg [6:0] counter;           // ��������0~99

always @(posedge clk) begin
    // duty����100ʱ��������ռ�ձ�100
    if (duty >= 100)
        pwm_value <= 100;
    else
        pwm_value <= duty;

    // �������������ﵽ100����Ϊ0
    if (counter == 99)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(posedge clk) begin
    // ����ߵ�ƽռ����pwm_value����
    if (counter < pwm_value)
        pwm_out <= 1'b1;
    else
        pwm_out <= 1'b0;
end

endmodule