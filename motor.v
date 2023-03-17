// This module take "mode" input and control two motors accordingly.
// clk should be 100MHz for PWM_gen module to work correctly.
// You can modify / add more inputs and outputs by yourself.
module motor(
    input clk,
    input rst,
    input [1:0]hitmode,
    input throw,
    output [1:0]pwm,
    output [1:0]r_IN,
    output reg[1:0]l_IN
    );

    reg [9:0]next_left_motor;
    reg [9:0]next_right_motor;
    reg [9:0]left_motor;
    reg [9:0]right_motor;
    wire left_pwm, right_pwm;

    motor_pwm m0(clk, rst, left_motor, left_pwm);
    motor_pwm m1(clk, rst, right_motor, right_pwm);

    assign pwm = {left_pwm,right_pwm};

    assign r_IN=2'b10;

    always @(posedge clk or posedge rst) begin//hitmotor
        if(rst)begin
            left_motor<=0;
        end
        else begin
            left_motor<=next_left_motor;
        end
    end
    always @(*) begin
        if(rst)begin
            l_IN=2'b10;
            next_left_motor=0;
        end
        else begin
            case(hitmode)
                0:begin
                    l_IN=2'b10;
                    next_left_motor=10'd00;
                end
                1:begin
                    l_IN=2'b01;
                    next_left_motor=10'd800;
                end
                2:begin
                    l_IN=2'b10;
                    next_left_motor=10'd00;
                end
                3:begin
                    l_IN=2'b10;
                    next_left_motor=10'd790;
                end
                default:begin
                    next_left_motor=0;
                end
            endcase
        end
    end

    always @(posedge clk or posedge rst) begin//throwmotor
        if(rst)begin
            right_motor<=0;
        end
        else begin
            right_motor<=next_right_motor;
        end
    end
    always @(*) begin
        if(rst)begin
            next_right_motor=0;
        end
        else begin
            case(throw)
                0:begin
                    next_right_motor=10'd0;
                end
                1:begin
                    next_right_motor=10'd1023;
                end
                default:begin
                    next_right_motor=0;
                end
            endcase
        end
    end
    
endmodule

module motor_pwm (
    input clk,
    input reset,
    input [9:0]duty,
	output pmod_1 //PWM
);
        
    PWM_gen pwm_0 ( 
        .clk(clk), 
        .reset(reset), 
        .freq(32'd25000),
        .duty(duty), 
        .PWM(pmod_1)
    );

endmodule

//generte PWM by input frequency & duty cycle
module PWM_gen (
    input wire clk,
    input wire reset,
	input [31:0] freq,
    input [9:0] duty,
    output reg PWM
);
    wire [31:0] count_max = 100_000_000 / freq;
    wire [31:0] count_duty = count_max * duty / 1024;
    reg [31:0] count;
        
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            count <= 0;
            PWM <= 0;
        end else if (count < count_max) begin
            count <= count + 1;
            if(count < count_duty)
                PWM <= 1;
            else
                PWM <= 0;
        end else begin
            count <= 0;
            PWM <= 0;
        end
    end
endmodule