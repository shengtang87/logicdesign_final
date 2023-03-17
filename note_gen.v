module note_gen(
    clk, // clock from crystal
    rst, // active high reset
    volume, 
    note_div_left, // div for note generation
    note_div_right,
    audio_left,
    audio_right
);

    // I/O declaration
    input clk; // clock from crystal
    input rst; // active low reset
    input [2:0] volume;
    input [21:0] note_div_left, note_div_right; // div for note generation
    output reg [15:0] audio_left, audio_right;

    // Declare internal signals
    reg [21:0] clk_cnt_next, clk_cnt;
    reg [21:0] clk_cnt_next_2, clk_cnt_2;
    reg b_clk, b_clk_next;
    reg c_clk, c_clk_next;

    // Note frequency generation
    // clk_cnt, clk_cnt_2, b_clk, c_clk
    always @(posedge clk or posedge rst)
        if (rst == 1'b1)
            begin
                clk_cnt <= 22'd0;
                clk_cnt_2 <= 22'd0;
                b_clk <= 1'b0;
                c_clk <= 1'b0;
            end
        else
            begin
                clk_cnt <= clk_cnt_next;
                clk_cnt_2 <= clk_cnt_next_2;
                b_clk <= b_clk_next;
                c_clk <= c_clk_next;
            end
    
    // clk_cnt_next, b_clk_next
    always @*
        if (clk_cnt == note_div_left)
            begin
                clk_cnt_next = 22'd0;
                b_clk_next = ~b_clk;
            end
        else
            begin
                clk_cnt_next = clk_cnt + 1'b1;
                b_clk_next = b_clk;
            end

    // clk_cnt_next_2, c_clk_next
    always @*
        if (clk_cnt_2 == note_div_right)
            begin
                clk_cnt_next_2 = 22'd0;
                c_clk_next = ~c_clk;
            end
        else
            begin
                clk_cnt_next_2 = clk_cnt_2 + 1'b1;
                c_clk_next = c_clk;
            end

    // Assign the amplitude of the note
    // Volume is controlled here
    always @(*) begin
        if(note_div_left == 22'd1)begin
            audio_left=16'h0000;
        end
        else if(b_clk == 1'b0)begin
            case(volume)
                1:begin
                    audio_left =(16'hFC00);
                end
                2:begin
                    audio_left =(16'hF800);
                end
                3:begin
                    audio_left =(16'hF000);
                end
                4:begin
                    audio_left =(16'hE000);
                end
                5:begin
                    audio_left =(16'hC000);
                end
                default:begin
                    audio_left =(16'hF000);
                end
            endcase
        end
        else begin
            case(volume)
                1:begin
                    audio_left =(16'h400);
                end
                2:begin
                    audio_left =(16'h800);
                end
                3:begin
                    audio_left =(16'h1000);
                end
                4:begin
                    audio_left =(16'h2000);
                end
                5:begin
                    audio_left =(16'h4000);
                end
                default:begin
                    audio_left =(16'h1000);
                end
            endcase
        end
    end
    always @(*) begin
        if(note_div_right == 22'd1)begin
            audio_right=16'h0000;
        end
        else if(c_clk == 1'b0)begin
            case(volume)
                1:begin
                    audio_right =(16'hFC00);
                end
                2:begin
                    audio_right =(16'hF800);
                end
                3:begin
                    audio_right =(16'hF000);
                end
                4:begin
                    audio_right =(16'hE000);
                end
                5:begin
                    audio_right =(16'hC000);
                end
                default:begin
                    audio_right =(16'hF000);
                end
            endcase
        end
        else begin
            case(volume)
                1:begin
                    audio_right =(16'h400);
                end
                2:begin
                    audio_right =(16'h800);
                end
                3:begin
                    audio_right =(16'h1000);
                end
                4:begin
                    audio_right =(16'h2000);
                end
                5:begin
                    audio_right =(16'h4000);
                end
                default:begin
                    audio_right =(16'h1000);
                end
            endcase
        end
    end

    // assign audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
    //                             (b_clk == 1'b0) ? 16'hE000 : 16'h1000;
    // assign audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
    //                             (c_clk == 1'b0) ? 16'hE000 : 16'h1000;


endmodule