module bcd_to_7seg(
    input [3:0] bcd_in,
    output reg [7:0] seg_out // λ˳��gfedcba��7'bxxxxxxx �� g=bit6, a=bit0��
);

always @(*) begin
    case(bcd_in)
        // ����˵����0=�����Σ�1=Ϩ��Σ����������ԣ�
        4'd0: seg_out = 8'b11000000; // 0 �� abcdef=0��g=1
        4'd1: seg_out = 8'b11111001; // 1 �� bc=0������=1
        4'd2: seg_out = 8'b10100100; // 2 �� abged=0
        4'd3: seg_out = 8'b10110000; // 3 �� abcdg=0
        4'd4: seg_out = 8'b10011001; // 4 �� fgbc=0
        4'd5: seg_out = 8'b10010010; // 5 �� afgcd=0
        4'd6: seg_out = 8'b10000010; // 6 �� afgcde=0
        4'd7: seg_out = 8'b11111000; // 7 �� abc=0
        4'd8: seg_out = 8'b10000000; // 8 �� ȫ��
        4'd9: seg_out = 8'b10010000; // 9 �� abcfg=0
        default: seg_out = 8'b1111111; // ȫ��
    endcase
end

endmodule
