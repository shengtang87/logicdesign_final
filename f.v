module f(
    input clk,
    input rst,
    
	inout wire PS2_DATA,
	inout wire PS2_CLK,

    output IN1,
    output IN2,
    output IN3, 
    output IN4,
    output left_pwm,
    output right_pwm,


    output reg [15:0] led,

    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,

    output reg space,
    output reg enter,

    input player1,
    input player2,
    input homerun,
    input break
    );

    onepulse p1(.pb_debounced(player1),.clk(clk),.pb_1pulse(player11));
    onepulse p2(.pb_debounced(player2),.clk(clk),.pb_1pulse(player21));
    onepulse h1(.pb_debounced(homerun),.clk(clk),.pb_1pulse(homerun1));
    onepulse b1(.pb_debounced(break),.clk(clk),.pb_1pulse(break1));
    
    wire clk21;
    clock_divider #(.n(21)) clock21(.clk(clk), .clk_div(clk21));  
    
    wire [15:0] audio_in_left, audio_in_right;
    wire [11:0] ibeatNum;               
    wire [31:0] freqL, freqR;           
    wire [21:0] freq_outL, freq_outR;
    wire [11:0] len;

    reg [2:0] music,musicnxt;
    always @(posedge clk or posedge rst) begin
        if(rst)begin
            music<=3;
        end
        else begin
            music<=musicnxt;
        end
    end

    always @(*) begin
        if(rst)begin
            musicnxt=3;
        end
        else begin
            musicnxt=music;
            if(player11) musicnxt=0;
            else if(player21) musicnxt=1;
            else if(break1) musicnxt=2;
            else if(homerun1) musicnxt=3;
            else musicnxt=music;
        end
    end

    assign len=(music==0)?1000:
    (music==1)?448:
    (music==2)?272:
    (music==3)?156:156;
    assign freq_outL =50000000 / freqL;
    assign freq_outR =50000000 / freqR;   

    player_control playerCtrl_00 ( 
        .clk(clk21),
        ._music(music),
        .reset(rst),
        .ibeat(ibeatNum),
        .len(len)
    );
    music_example music_00 (
        ._music(music),
        .ibeatNum(ibeatNum),
        .en(1),
        .toneL(freqL),
        .toneR(freqR),
        .clk(clk),
        .rst(rst)
    );

    note_gen noteGen_00(
        .clk(clk), 
        .rst(rst), 
        .volume(5),
        .note_div_left(freq_outL), 
        .note_div_right(freq_outR), 
        .audio_left(audio_in_left),     // left sound audio
        .audio_right(audio_in_right)    // right sound audio
    );
    speaker_control sc(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );

    reg [1:0] hitmode,hitmodenxt;
    parameter hitidle =0 ;
    parameter hithit =1 ;
    parameter hitwait =2 ;
    parameter hitreturn =3 ;
    reg [25:0] clk_divider;
    reg [25:0] clk_divider2;

    reg [1:0] throwmode,throwmodenxt;
    parameter throwidle =0 ;
    parameter throwthrow =1 ;
    
    reg [26:0] clk25; 
    reg [26:0] clk252;  
    reg [26:0] clk253;
    reg [26:0] clk254;
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
            clk25<=0;
            clk252<=0;
            clk253<=0;
            clk254<=0;        
    	end
        else begin
            clk25<=0;
            clk252<=0;
            clk253<=0;
            case(hitmode)
            hithit:begin
                clk25<=clk25+1;    
            end
            hitwait:begin
                clk252<=clk252+1;
            end
            hitreturn:begin
                clk253<=clk253+1;
            end
            default:begin
                clk25<=0;
                clk252<=0;
                clk253<=0;                
            end
            endcase
            if(throwmode==throwthrow) clk254<=clk254+1;
            else clk254<=0;
        end
    end
    
    // always @ (posedge clk, posedge rst) begin
    // 	if (rst) begin
    // 		clk_divider2 <= 0;
    // 	end 
    //     else begin
    // 		if(hitmode==hitreturn)begin
    //             clk_divider2 <= clk_divider2 + 1;
    //         end
    //         else begin
    //             clk_divider2<=0;
    //         end
    // 	end
    // end
    
    
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;


	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);


    motor A(
        .clk(clk),
        .rst(rst),
        .hitmode(hitmode),
        .throw(throwmode),
        .pwm({left_pwm, right_pwm}),
        .l_IN({IN1, IN2}),
        .r_IN({IN3, IN4})
    );



    always @(posedge clk or posedge rst) begin//hitmotor
        if(rst)begin
            hitmode<=hitidle;
        end
        else begin
            hitmode<=hitmodenxt;
        end
    end
    always @(*) begin
        if(rst)begin
            hitmodenxt=hitidle;
        end
        else begin
            case(hitmode)
                hitidle:begin
                    if (been_ready && key_down[last_change] == 1'b1) begin
                        if(player1&&last_change== 9'h12)begin
                            hitmodenxt=hithit;
                        end
                        else if(player2&&last_change== 9'h59)begin
                            hitmodenxt=hithit;
                        end
                        else hitmodenxt=hitidle;
                    end
                    else begin
                        hitmodenxt=hitidle;
                    end
                end
                hithit:begin
                    if(clk25[23])begin
                        hitmodenxt=hitwait;
                    end
                    else begin
                        hitmodenxt=hithit;
                    end
                end
                hitwait:begin
                    if(clk252[26])begin
                        hitmodenxt=hitreturn;
                    end
                    else begin
                        hitmodenxt=hitwait;
                    end
                end
                hitreturn:begin
                    if(clk253[23])begin
                        hitmodenxt=hitidle;
                    end
                    else begin
                        hitmodenxt=hitreturn;
                    end
                end
                default:begin
                    hitmodenxt=hitidle;
                end
            endcase 
        end
    end
     
     
    always @(posedge clk or posedge rst) begin//throwmotor
        if(rst)begin
            throwmode<=throwidle;
        end
        else begin
            throwmode<=throwmodenxt;
        end
    end
    always @(*) begin
        if(rst)begin
            throwmodenxt=throwidle;
        end
        else begin
            case(throwmode)
                throwidle:begin
                    if (been_ready && key_down[last_change] == 1'b1) begin
                        if(player1&&last_change==9'h59)begin
                            throwmodenxt=throwthrow;
                        end
                        else if(player2&&last_change==9'h12)begin
                            throwmodenxt=throwthrow;
                        end
                        else throwmodenxt=throwidle;
                    end
                    else begin
                        throwmodenxt=throwidle;
                    end
                end
                throwthrow:begin
                    if(clk254[23])begin
                        throwmodenxt=throwidle;
                    end
                    else begin
                        throwmodenxt=throwthrow;
                    end
                end
            endcase
        end
    end
    
    always @(*) begin//enterspace
        if(rst)begin
               space=0;
               enter=0; 
        end
        else begin
            if (key_down[last_change] == 1'b1 &&  last_change==9'h5A) begin
                enter=1;
                space=0;
            end
            else if(key_down[last_change] == 1'b1 &&  last_change==9'h29)begin
                space=1;
                enter=0;
            end
            else begin
               space=0;
               enter=0; 
            end
        end
    end
    
    always @(*) begin//led
        if(rst)begin
            led=0;
        end
        else begin
            case(hitmode)
                hitidle:begin
                    led=16'b0000_0000_0000_1111;
                end
                hithit:begin
                    led=16'b0000_0000_1111_1111;
                end
                hitwait:begin
                    led=16'b0000_1111_1111_1111;
                end
                hitreturn:begin
                    led=16'b1111_1111_1111_1111;
                end
                default:begin
                    led=0;
                end
            endcase
        end
    end

    
    // always @(*) begin//led
    //     if(rst)begin
    //         led=0;
    //     end
    //     else begin
    //         case(throw)
    //             0:begin
    //                 led=16'b0000_0000_0000_1111;
    //             end
    //             1:begin
    //                 led=16'b0000_0000_1111_1111;
    //             end
    //             default:begin
    //                 led=0;
    //             end
    //         endcase
    //     end
    // end

endmodule



module clock_divider(clk, clk_div);   
    parameter n = 21;     
    input clk;   
    output clk_div;   
    
    reg [n-1:0] num;
    wire [n-1:0] next_num;
    
    always@(posedge clk)begin
    	num<=next_num;
    end
    
    assign next_num = num +1;
    assign clk_div = num[n-1];
    
endmodule

module onepulse (
    input pb_debounced,
    input clk,
    output reg pb_1pulse
);

reg pb_debounced_delay;
always @(posedge clk) begin
    if (pb_debounced == 1'b1 & pb_debounced_delay == 1'b0) pb_1pulse <= 1'b1;
    else pb_1pulse <= 1'b0;
    pb_debounced_delay <= pb_debounced;
end endmodule