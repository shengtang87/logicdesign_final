`define E5b  32'd622   // E5b
`define B4b  32'd466   // B4bb
`define A4b 32'd415

`define E3b  32'd155   // E3b
`define B2b  32'd117   // B2b
`define A2b  32'd104  // B2b




`define C6  32'd1048

`define C5  32'd524   // C5
`define D5  32'd588   // D5
`define E5  32'd660   // E5
`define F5  32'd698   // F5
`define G5  32'd784   // G5
`define A5   32'd880   // A5
`define B5   32'd988   // B5

`define C4   32'd262   // C4
`define D4   32'd294   // D4
`define E4   32'd330   // E4
`define F4   32'd349   // F4
`define G4   32'd392   // G4
`define A4   32'd440   // A4b
`define B4   32'd494   // B4b

`define C3  32'd131  // C3
`define D3  32'd147   // D3
`define E3  32'd165   // E3
`define F3  32'd174   // F3
`define G3  32'd196   // G3
`define A3   32'd220   // A3
`define B3   32'd247   // B3

`define C2  32'd65  // C2
`define D2  32'd73   // D2
`define E2  32'd82   // E2
`define F2  32'd87   // F2
`define G2  32'd97   // G2
`define A2   32'd110   // A2
`define B2   32'd123   // B2

`define sil   32'd50000000 // slience

// module SevenSegment(
// 	output reg [6:0] DISPLAY,
// 	output reg [3:0] DIGIT,
//     input [31:0] displaynote,
// 	input wire rst,
// 	input wire clk
//     );
    
//     reg [15:0] clk_divider;
    
//     always @ (posedge clk, posedge rst) begin
//     	if (rst) begin
//     		clk_divider <= 15'b0;
//     	end else begin
//     		clk_divider <= clk_divider + 15'b1;
//     	end
//     end
    
//     always @ (posedge clk_divider[15], posedge rst) begin
//     	if (rst) begin
//     		DISPLAY <= 7'b0111111;
//     		DIGIT <= 4'b1111;
//     	end else begin
//     		case (DIGIT)
//     			4'b1110 : begin
//                         if(displaynote==`E5b||displaynote==`B4bb)begin
//                             DISPLAY <= 7'b0000011;
//                         end
//                         else DISPLAY <= 7'b0111111;
//     					DIGIT <= 4'b1101;
//     				end
//     			4'b1101 : begin
// 						DISPLAY <= 7'b0111111;
// 						DIGIT <= 4'b1011;
// 					end
//     			4'b1011 : begin
// 						DISPLAY <= 7'b0111111;
// 						DIGIT <= 4'b0111;
// 					end
//     			4'b0111 : begin
//                         if(displaynote==`C5||displaynote==`C4||displaynote==`C3||displaynote==`C2)begin
//                             DISPLAY <= 7'b0100111;
//                         end
//                         else if(displaynote==`D5||displaynote==`D4||displaynote==`D3||displaynote==`D2)begin
//                             DISPLAY <= 7'b0100001;
//                         end
//                         else if(displaynote==`E5||displaynote==`E4||displaynote==`E3||displaynote==`E2||displaynote==`E5b||displaynote==`E3b)begin
//                             DISPLAY <= 7'b0000110;
//                         end
//                         else if(displaynote==`F5||displaynote==`F4||displaynote==`F3||displaynote==`F2)begin
//                             DISPLAY <= 7'b0001110;
//                         end
//                         else if(displaynote==`G5||displaynote==`G4||displaynote==`G3||displaynote==`G2)begin
//                             DISPLAY <= 7'b1000010;
//                         end
//                         else if(displaynote==`A5||displaynote==`A4b||displaynote==`A3||displaynote==`A2)begin
//                             DISPLAY <= 7'b0100000;
//                         end
//                         else if(displaynote==`B5||displaynote==`B4b||displaynote==`B3||displaynote==`B2||displaynote==`B4bb||displaynote==`B2b)begin
//                             DISPLAY <= 7'b0000011;
//                         end
//                         else DISPLAY <= 7'b0111111;
// 						DIGIT <= 4'b1110;
// 					end
//     			default : begin
// 						DISPLAY <= 7'b0111111;
// 						DIGIT <= 4'b1110;
// 					end				
//     		endcase
//     	end
//     end

    
// endmodule


module music_example (
	input [11:0] ibeatNum,
	input en,
    input [2:0]_music,
    input clk,
    input rst,
	output reg [31:0] toneL,
    output reg [31:0] toneR
    );

    // SevenSegment s(
    //     .DISPLAY(DISPLAY),
    //     .DIGIT(DIGIT),
    //     .displaynote(toneR),
    //     .rst(rst),
    //     .clk(clk)
    // );


    // parameter [8:0] KEY_CODES [0:6] = {
	// 	9'h1C,
	// 	9'h1B,
	// 	9'h23,
	// 	9'h2B,
	// 	9'h34,
	// 	9'h33,
	// 	9'h3B
	// };

    always @* begin
        if(en == 1) begin
            case(_music)
                0:begin
                    case(ibeatNum)
                        // --- Measure 1 ---
                        12'd0:  toneR = `sil;     12'd1:  toneR = `sil; // HG (half-beat)
                        12'd2:  toneR = `sil;     12'd3:  toneR = `sil;
                        12'd4:  toneR = `sil;     12'd5:  toneR = `sil;
                        12'd6:  toneR = `sil;     12'd7:  toneR = `sil;
                        12'd8:  toneR = `sil;     12'd9:  toneR = `sil; // HE (half-beat)
                        12'd10: toneR = `sil;     12'd11: toneR = `sil;
                        12'd12: toneR = `sil;     12'd13: toneR = `sil;
                        12'd14: toneR = `sil;     12'd15: toneR = `sil; // (Short break for repetitive notes: high E)

                        12'd16: toneR = `G4;     12'd17: toneR = `G4; // HE (one-beat)
                        12'd18: toneR = `G4;     12'd19: toneR = `G4;
                        12'd20: toneR = `G4;     12'd21: toneR = `G4;
                        12'd22: toneR = `G4;     12'd23: toneR = `sil;
                        12'd24: toneR = `G4;     12'd25: toneR = `G4;
                        12'd26: toneR = `G4;     12'd27: toneR = `G4;
                        12'd28: toneR = `G4;     12'd29: toneR = `G4;
                        12'd30: toneR = `G4;     12'd31: toneR = `G4;

                        12'd32: toneR = `B4b;     12'd33: toneR = `B4b; // HF (half-beat)
                        12'd34: toneR = `B4b;     12'd35: toneR = `B4b;
                        12'd36: toneR = `B4b;     12'd37: toneR = `B4b;
                        12'd38: toneR = `B4b;     12'd39: toneR = `B4b;
                        12'd40: toneR = `D5;     12'd41: toneR = `D5; // HD (half-beat)
                        12'd42: toneR = `D5;     12'd43: toneR = `D5;
                        12'd44: toneR = `D5;     12'd45: toneR = `D5;
                        12'd46: toneR = `D5;     12'd47: toneR = `D5; // (Short break for repetitive notes: high D)

                        12'd48: toneR = `D5;     12'd49: toneR =`D5; // HD (one-beat)
                        12'd50: toneR = `D5;     12'd51: toneR =`D5;
                        12'd52: toneR = `D5;     12'd53: toneR =`D5;
                        12'd54: toneR = `D5;     12'd55: toneR =`D5;
                        12'd56: toneR = `C5;     12'd57: toneR =`C5;
                        12'd58: toneR = `C5;     12'd59: toneR =`C5;
                        12'd60: toneR = `C5;     12'd61: toneR =`C5;
                        12'd62: toneR = `C5;     12'd63: toneR =`C5;

                        // --- Measure 2 ---
                        12'd64: toneR = `C5;     12'd65: toneR = `C5; // HC (half-beat)
                        12'd66: toneR = `C5;     12'd67: toneR = `C5;
                        12'd68: toneR = `C5;     12'd69: toneR = `C5;
                        12'd70: toneR = `C5;     12'd71: toneR = `C5;
                        12'd72: toneR = `C5;     12'd73: toneR = `C5; // HD (half-beat)
                        12'd74: toneR = `C5;     12'd75: toneR = `C5;
                        12'd76: toneR = `C5;     12'd77: toneR = `C5;
                        12'd78: toneR = `C5;     12'd79: toneR = `C5;

                        12'd80: toneR = `C5;     12'd81: toneR = `C5; // HE (half-beat)
                        12'd82: toneR = `C5;     12'd83: toneR = `C5;
                        12'd84: toneR = `C5;     12'd85: toneR = `C5;
                        12'd86: toneR = `C5;     12'd87: toneR = `C5;
                        12'd88: toneR = `G4;     12'd89: toneR = `G4; // HF (half-beat)
                        12'd90: toneR = `G4;     12'd91: toneR = `G4;
                        12'd92: toneR = `G4;     12'd93: toneR = `G4;
                        12'd94: toneR = `G4;     12'd95: toneR = `G4;

                        12'd96:  toneR = `G4;     12'd97: toneR =`G4;// HG (half-beat)
                        12'd98:  toneR = `G4;     12'd99: toneR =`G4;
                        12'd100: toneR = `G4;    12'd101: toneR =`G4;
                        12'd102: toneR = `G4;    12'd103: toneR =`G4;// (Short break for repetitive notes: high D)
                        12'd104: toneR = `G4;    12'd105: toneR =`G4; // HG (half-beat)
                        12'd106: toneR = `G4;    12'd107: toneR =`G4;
                        12'd108: toneR = `G4;    12'd109: toneR =`G4;
                        12'd110: toneR = `G4;    12'd111: toneR =`G4; // (Short break for repetitive notes: high D)

                        12'd112: toneR = `G4;    12'd113: toneR = `G4; // HG (one-beat)
                        12'd114: toneR = `G4;    12'd115: toneR = `G4;
                        12'd116: toneR = `G4;    12'd117: toneR = `G4;
                        12'd118: toneR = `G4;    12'd119: toneR = `G4;
                        12'd120: toneR = `G4;    12'd121: toneR = `G4;
                        12'd122: toneR = `G4;    12'd123: toneR = `G4;
                        12'd124: toneR = `G4;    12'd125: toneR = `G4;
                        12'd126: toneR = `G4;    12'd127: toneR = `G4;

                        // --- Measure 3 ---
                        12'd128: toneR = `sil;    12'd129: toneR = `sil;
                        12'd130: toneR = `sil;    12'd131: toneR = `sil;
                        12'd132: toneR = `sil;    12'd133: toneR = `sil;
                        12'd134: toneR = `sil;    12'd135: toneR = `sil;
                        12'd136: toneR = `sil;    12'd137: toneR = `sil;
                        12'd138: toneR = `sil;    12'd139: toneR = `sil;
                        12'd140: toneR = `sil;    12'd141: toneR = `sil;
                        12'd142: toneR = `sil;    12'd143: toneR = `sil;

                        12'd144: toneR = `G4;    12'd145: toneR = `G4;
                        12'd146: toneR = `G4;    12'd147: toneR = `G4;
                        12'd148: toneR = `G4;    12'd149: toneR = `G4;
                        12'd150: toneR = `G4;    12'd151: toneR = `sil;
                        12'd152: toneR = `G4;    12'd153: toneR = `G4;
                        12'd154: toneR = `G4;    12'd155: toneR = `G4;
                        12'd156: toneR = `G4;    12'd157: toneR = `G4;
                        12'd158: toneR = `G4;    12'd159: toneR = `sil;

                        12'd160: toneR = `F4;    12'd161: toneR = `F4;
                        12'd162: toneR = `F4;    12'd163: toneR = `F4;
                        12'd164: toneR = `F4;    12'd165: toneR = `F4;
                        12'd166: toneR = `F4;    12'd167: toneR = `F4;
                        12'd168: toneR = `B4b;    12'd169: toneR = `B4b;
                        12'd170: toneR = `B4b;    12'd171: toneR = `B4b;
                        12'd172: toneR = `B4b;    12'd173: toneR = `B4b;
                        12'd174: toneR = `B4b;    12'd175: toneR = `B4b;

                        12'd176: toneR = `B4b;    12'd177: toneR = `B4b;
                        12'd178: toneR = `B4b;    12'd179: toneR = `B4b;
                        12'd180: toneR = `B4b;    12'd181: toneR = `B4b;
                        12'd182: toneR = `B4b;    12'd183: toneR = `B4b;
                        12'd184: toneR = `G4;    12'd185: toneR = `G4;
                        12'd186: toneR = `G4;    12'd187: toneR = `G4;
                        12'd188: toneR = `G4;    12'd189: toneR = `G4;
                        12'd190: toneR = `G4;    12'd191: toneR = `G4;
                        // --- Measure 4 ---
                        12'd192: toneR = `G4;  12'd193: toneR = `G4;
                        12'd194: toneR = `G4;  12'd195: toneR = `G4;
                        12'd196: toneR = `G4;  12'd197: toneR = `G4;
                        12'd198: toneR = `G4;  12'd199: toneR = `G4;
                        12'd200: toneR = `G4;  12'd201: toneR = `G4;
                        12'd202: toneR = `G4;  12'd203: toneR = `G4;
                        12'd204: toneR = `G4;  12'd205: toneR = `G4;
                        12'd206: toneR = `G4;  12'd207: toneR = `G4;

                        12'd208: toneR = `G4;   12'd209: toneR = `G4;
                        12'd210: toneR = `G4;   12'd211: toneR = `G4;
                        12'd212: toneR = `G4;   12'd213: toneR = `G4;
                        12'd214: toneR = `G4;   12'd215: toneR = `G4;
                        12'd216: toneR = `G4;   12'd217: toneR = `G4;
                        12'd218: toneR = `G4;   12'd219: toneR = `G4;
                        12'd220: toneR = `G4;   12'd221: toneR = `G4;
                        12'd222: toneR = `G4;   12'd223: toneR = `G4;

                        12'd224: toneR = `G4;   12'd225: toneR = `G4;
                        12'd226: toneR = `G4;   12'd227: toneR = `G4;
                        12'd228: toneR = `G4;   12'd229: toneR = `G4;
                        12'd230: toneR = `G4;   12'd231: toneR = `G4;
                        12'd232: toneR =  `G4;  12'd233: toneR = `G4;
                        12'd234: toneR =  `G4;  12'd235: toneR = `G4;
                        12'd236: toneR =  `G4;  12'd237: toneR = `G4;
                        12'd238: toneR =  `G4;  12'd239: toneR = `G4;

                        12'd240: toneR = `G4;   12'd241:toneR = `G4;
                        12'd242: toneR = `G4;   12'd243:toneR = `G4;
                        12'd244: toneR = `G4;   12'd245:toneR = `G4;
                        12'd246: toneR = `G4;   12'd247:toneR = `G4;
                        12'd248: toneR = `G4;   12'd249:toneR = `G4;
                        12'd250: toneR = `G4;   12'd251:toneR = `G4;
                        12'd252: toneR = `G4;   12'd253:toneR = `G4;
                        12'd254: toneR = `G4;   12'd255:toneR = `G4;
                        // --- Measure 5 ---
                        12'd256: toneR = `sil;    12'd257: toneR = `sil;
                        12'd258: toneR = `sil;    12'd259: toneR = `sil;
                        12'd260: toneR = `sil;    12'd261: toneR = `sil;
                        12'd262: toneR = `sil;    12'd263: toneR = `sil;
                        12'd264: toneR = `sil;    12'd265: toneR = `sil;
                        12'd266: toneR = `sil;    12'd267: toneR = `sil;
                        12'd268: toneR = `sil;    12'd269: toneR = `sil;
                        12'd270: toneR = `sil;    12'd271: toneR = `sil;

                        12'd272: toneR = `G4;    12'd273: toneR = `G4;
                        12'd274: toneR = `G4;    12'd275: toneR = `G4;
                        12'd276: toneR = `G4;    12'd277: toneR = `G4;
                        12'd278: toneR = `G4;    12'd279: toneR = `sil;
                        12'd280: toneR = `G4;    12'd281: toneR = `G4;
                        12'd282: toneR = `G4;    12'd283: toneR = `G4;
                        12'd284: toneR = `G4;    12'd285: toneR = `G4;
                        12'd286: toneR = `G4;    12'd287: toneR = `G4;

                        12'd288: toneR = `B4b;    12'd289: toneR = `B4b;
                        12'd290: toneR = `B4b;    12'd291: toneR = `B4b;
                        12'd292: toneR = `B4b;    12'd293: toneR = `B4b;
                        12'd294: toneR = `B4b;    12'd295: toneR = `B4b;
                        12'd296: toneR = `D5;   12'd297: toneR = `D5;
                        12'd298: toneR = `D5;   12'd299: toneR = `D5;
                        12'd300: toneR = `D5;   12'd301: toneR = `D5;
                        12'd302: toneR = `D5;   12'd303: toneR = `D5;

                        12'd304: toneR = `D5;    12'd305: toneR = `D5;
                        12'd306: toneR = `D5;    12'd307: toneR = `D5;
                        12'd308: toneR = `D5;    12'd309: toneR = `D5;
                        12'd310: toneR = `D5;    12'd311: toneR = `D5;
                        12'd312: toneR = `C5;    12'd313: toneR = `C5;
                        12'd314: toneR = `C5;    12'd315: toneR = `C5;
                        12'd316: toneR = `C5;    12'd317: toneR = `C5;
                        12'd318: toneR = `C5;    12'd319: toneR = `C5;
                        // --- Measure 6 ---
                        12'd320: toneR = `C5;    12'd321: toneR = `C5;
                        12'd322: toneR = `C5;    12'd323: toneR = `C5;
                        12'd324: toneR = `C5;    12'd325: toneR = `C5;
                        12'd326: toneR = `C5;    12'd327: toneR = `C5;
                        12'd328: toneR = `C5;    12'd329: toneR = `C5;
                        12'd330: toneR = `C5;    12'd331: toneR = `C5;
                        12'd332: toneR = `C5;    12'd333: toneR = `C5;
                        12'd334: toneR = `C5;    12'd335: toneR = `C5;

                        12'd336: toneR = `C5;    12'd337: toneR = `C5;
                        12'd338: toneR = `C5;    12'd339: toneR = `C5;
                        12'd340: toneR = `C5;    12'd341: toneR = `C5;
                        12'd342: toneR = `C5;    12'd343: toneR = `C5;
                        12'd344: toneR = `G5;    12'd345: toneR = `G5;
                        12'd346: toneR = `G5;    12'd347: toneR = `G5;
                        12'd348: toneR = `G5;    12'd349: toneR = `G5;
                        12'd350: toneR = `G5;    12'd351: toneR = `G5;

                        12'd352: toneR = `G5;    12'd353: toneR = `G5;
                        12'd354: toneR = `G5;    12'd355: toneR = `G5;
                        12'd356: toneR = `G5;    12'd357: toneR = `G5;
                        12'd358: toneR = `G5;    12'd359: toneR = `G5;
                        12'd360: toneR = `G5;    12'd361: toneR = `G5;
                        12'd362: toneR = `G5;    12'd363: toneR = `G5;
                        12'd364: toneR = `G5;    12'd365: toneR = `G5;
                        12'd366: toneR = `G5;    12'd367: toneR = `G5;

                        12'd368: toneR = `G5;    12'd369: toneR = `G5;
                        12'd370: toneR = `G5;    12'd371: toneR = `G5;
                        12'd372: toneR = `G5;    12'd373: toneR = `G5;
                        12'd374: toneR = `G5;    12'd375: toneR = `G5;
                        12'd376: toneR = `G5;    12'd377: toneR = `G5;
                        12'd378: toneR = `G5;    12'd379: toneR = `G5;
                        12'd380: toneR = `G5;    12'd381: toneR = `G5;
                        12'd382: toneR = `G5;    12'd383: toneR = `G5;
                        // --- Measure 7 ---
                        12'd384: toneR = `sil;    12'd385: toneR = `sil;
                        12'd386: toneR = `sil;    12'd387: toneR = `sil;
                        12'd388: toneR = `sil;    12'd389: toneR = `sil;
                        12'd390: toneR = `sil;    12'd391: toneR = `sil;
                        12'd392: toneR = `sil;    12'd393: toneR = `sil;
                        12'd394: toneR = `sil;    12'd395: toneR = `sil;
                        12'd396: toneR = `sil;    12'd397: toneR = `sil;
                        12'd398: toneR = `sil;    12'd399: toneR = `sil;

                        12'd400: toneR = `F5;    12'd401: toneR = `F5;
                        12'd402: toneR = `F5;    12'd403: toneR = `F5;
                        12'd404: toneR = `F5;    12'd405: toneR = `F5;
                        12'd406: toneR = `F5;    12'd407: toneR = `sil;
                        12'd408: toneR = `F5;    12'd409: toneR = `F5;
                        12'd410: toneR = `F5;    12'd411: toneR = `F5;
                        12'd412: toneR = `F5;    12'd413: toneR = `F5;
                        12'd414: toneR = `F5;    12'd415: toneR = `F5;

                        12'd416: toneR = `D5;    12'd417: toneR = `D5;
                        12'd418: toneR = `D5;    12'd419: toneR = `D5;
                        12'd420: toneR = `D5;    12'd421: toneR = `D5;
                        12'd422: toneR = `D5;    12'd423: toneR = `D5;
                        12'd424: toneR = `B4b;    12'd425: toneR = `B4b;
                        12'd426: toneR = `B4b;    12'd427: toneR = `B4b;
                        12'd428: toneR = `B4b;    12'd429: toneR = `B4b;
                        12'd430: toneR = `B4b;    12'd431: toneR = `B4b;

                        12'd432: toneR = `B4b;    12'd433: toneR = `B4b;
                        12'd434: toneR = `B4b;    12'd435: toneR = `B4b;
                        12'd436: toneR = `B4b;    12'd437: toneR = `B4b;
                        12'd438: toneR = `B4b;    12'd439: toneR = `B4b;
                        12'd440: toneR = `G5;    12'd441: toneR = `G5;
                        12'd442: toneR = `G5;    12'd443: toneR = `G5;
                        12'd444: toneR = `G5;    12'd445: toneR = `G5;
                        12'd446: toneR = `G5;    12'd447: toneR = `G5;
                        // --- Measure 8 ---
                        12'd448: toneR = `G5;    12'd449: toneR = `G5;
                        12'd450: toneR = `G5;    12'd451: toneR = `G5;
                        12'd452: toneR = `G5;    12'd453: toneR = `G5;
                        12'd454: toneR = `G5;    12'd455: toneR = `G5;
                        12'd456: toneR = `G5;    12'd457: toneR = `G5;
                        12'd458: toneR = `G5;    12'd459: toneR = `G5;
                        12'd460: toneR = `G5;    12'd461: toneR = `G5;
                        12'd462: toneR = `G5;    12'd463: toneR = `G5;

                        12'd464: toneR = `G5;    12'd465: toneR = `G5;
                        12'd466: toneR = `G5;    12'd467: toneR = `G5;
                        12'd468: toneR = `G5;    12'd469: toneR = `G5;
                        12'd470: toneR = `G5;    12'd471: toneR = `G5;
                        12'd472: toneR = `G5;    12'd473: toneR = `G5;
                        12'd474: toneR = `G5;    12'd475: toneR = `G5;
                        12'd476: toneR = `G5;    12'd477: toneR = `G5;
                        12'd478: toneR = `G5;    12'd479: toneR = `G5;

                        12'd480: toneR = `G5;    12'd481: toneR = `G5;
                        12'd482: toneR = `G5;    12'd483: toneR = `G5;
                        12'd484: toneR = `G5;    12'd485: toneR = `G5;
                        12'd486: toneR = `G5;    12'd487: toneR = `G5;
                        12'd488: toneR = `G5;    12'd489: toneR = `G5;
                        12'd490: toneR = `G5;    12'd491: toneR = `G5;
                        12'd492: toneR = `G5;    12'd493: toneR = `G5;
                        12'd494: toneR = `G5;    12'd495: toneR = `G5;

                        12'd496: toneR = `G5;    12'd497: toneR = `G5;
                        12'd498: toneR = `G5;    12'd499: toneR = `G5;
                        12'd500: toneR = `G5;    12'd501: toneR = `G5;
                        12'd502: toneR = `G5;    12'd503: toneR = `G5;
                        12'd504: toneR = `G5;    12'd505: toneR = `G5;
                        12'd506: toneR = `G5;    12'd507: toneR = `G5;
                        12'd508: toneR = `G5;    12'd509: toneR = `G5;
                        12'd510: toneR = `G5;    12'd511: toneR = `G5;
                        // --- Measure 9 ---
                        12'd512 : toneR =`G5;    12'd513 : toneR =`G5;
                        12'd514 : toneR =`G5;    12'd515 : toneR =`G5;
                        12'd516 : toneR =`G5;    12'd517 : toneR =`G5;
                        12'd518 : toneR =`G5;    12'd519 : toneR =`G5;
                        12'd520 : toneR =`G5;    12'd521 : toneR =`G5;
                        12'd522 : toneR =`G5;    12'd523 : toneR =`G5;
                        12'd524 : toneR =`G5;    12'd525 : toneR =`G5;
                        12'd526 : toneR =`G5;    12'd527 : toneR =`G5;

                        12'd528 : toneR =`G5;    12'd529 : toneR =`G5;
                        12'd530 : toneR =`G5;    12'd531 : toneR =`G5;
                        12'd532 : toneR =`G5;    12'd533 : toneR =`G5;
                        12'd534 : toneR =`G5;    12'd535 : toneR =`G5;
                        12'd536 : toneR =`G5;    12'd537 : toneR =`G5;
                        12'd538 : toneR =`G5;    12'd539 : toneR =`G5;
                        12'd540 : toneR =`G5;    12'd541 : toneR =`G5;
                        12'd542 : toneR =`G5;    12'd543 : toneR =`G5;

                        12'd544 : toneR =`G5;    12'd545 : toneR =`G5;
                        12'd546 : toneR =`G5;    12'd547 : toneR =`G5;
                        12'd548 : toneR =`G5;    12'd549 : toneR =`G5;
                        12'd550 : toneR =`G5;    12'd551 : toneR =`G5;
                        12'd552 : toneR =`G5;    12'd553 : toneR =`G5;
                        12'd554 : toneR =`G5;    12'd555 : toneR =`G5;
                        12'd556 : toneR =`G5;    12'd557 : toneR =`G5;
                        12'd558 : toneR =`G5;    12'd559 : toneR =`G5;

                        12'd560 : toneR =`G5;    12'd561 : toneR =`G5;
                        12'd562 : toneR =`G5;    12'd563 : toneR =`G5;
                        12'd564 : toneR =`G5;    12'd565 : toneR =`G5;
                        12'd566 : toneR =`G5;    12'd567 : toneR =`G5;
                        12'd568 : toneR =`G5;    12'd569 : toneR =`G5;
                        12'd570 : toneR =`G5;    12'd571 : toneR =`G5;
                        12'd572 : toneR =`G5;    12'd573 : toneR =`G5;
                        12'd574 : toneR =`G5;    12'd575 : toneR =`G5;

                        // --- Measure 10 ---
                        12'd576 : toneR =`sil;    12'd577 : toneR =`sil;
                        12'd578 : toneR =`sil;    12'd579 : toneR =`sil;
                        12'd580 : toneR =`sil;    12'd581 : toneR =`sil;
                        12'd582 : toneR =`sil;    12'd583 : toneR =`sil;
                        12'd584 : toneR =`sil;    12'd585 : toneR =`sil;
                        12'd586 : toneR =`sil;    12'd587 : toneR =`sil;
                        12'd588 : toneR =`sil;    12'd589 : toneR =`sil;
                        12'd590 : toneR =`sil;    12'd591 : toneR =`sil;

                        12'd592 : toneR =`B5;    12'd593 : toneR =`B5;
                        12'd594 : toneR =`B5;    12'd595 : toneR =`B5;
                        12'd596 : toneR =`B5;    12'd597 : toneR =`B5;
                        12'd598 : toneR =`B5;    12'd599 : toneR =`B5;
                        12'd600 : toneR =`B5;    12'd601 : toneR =`B5;
                        12'd602 : toneR =`B5;    12'd603 : toneR =`B5;
                        12'd604 : toneR =`B5;    12'd605 : toneR =`B5;
                        12'd606 : toneR =`B5;    12'd607 : toneR =`B5;

                        12'd608 : toneR =`G5;    12'd609 : toneR =`G5;
                        12'd610 : toneR =`G5;    12'd611 : toneR =`G5;
                        12'd612 : toneR =`G5;    12'd613 : toneR =`G5;
                        12'd614 : toneR =`G5;    12'd615 : toneR =`G5;
                        12'd616 : toneR =`F5;    12'd617 : toneR =`F5;
                        12'd618 : toneR =`F5;    12'd619 : toneR =`F5;
                        12'd620 : toneR =`F5;    12'd621 : toneR =`F5;
                        12'd622 : toneR =`F5;    12'd623 : toneR =`F5;

                        12'd624 : toneR =`E5;    12'd625 : toneR =`E5;
                        12'd626 : toneR =`E5;    12'd627 : toneR =`E5;
                        12'd628 : toneR =`E5;    12'd629 : toneR =`E5;
                        12'd630 : toneR =`E5;    12'd631 : toneR =`E5;
                        12'd632 : toneR =`C5;    12'd633 : toneR =`C5;
                        12'd634 : toneR =`C5;    12'd635 : toneR =`C5;
                        12'd636 : toneR =`C5;    12'd637 : toneR =`C5;
                        12'd638 : toneR =`C5;    12'd639 : toneR =`C5;

                        // --- Measure 11 ---
                        12'd640 : toneR =`G4;    12'd641 : toneR =`G4;
                        12'd642 : toneR =`G4;    12'd643 : toneR =`G4;
                        12'd644 : toneR =`G4;    12'd645 : toneR =`G4;
                        12'd646 : toneR =`G4;    12'd647 : toneR =`G4;
                        12'd648 : toneR =`F4;    12'd649 : toneR =`F4;
                        12'd650 : toneR =`F4;    12'd651 : toneR =`F4;
                        12'd652 : toneR =`F4;    12'd653 : toneR =`F4;
                        12'd654 : toneR =`F4;    12'd655 : toneR =`F4;

                        12'd656 : toneR =`E4;    12'd657 : toneR =`E4;
                        12'd658 : toneR =`E4;    12'd659 : toneR =`E4;
                        12'd660 : toneR =`E4;    12'd661 : toneR =`E4;
                        12'd662 : toneR =`E4;    12'd663 : toneR =`E4;
                        12'd664 : toneR =`C4;    12'd665 : toneR =`C4;
                        12'd666 : toneR =`C4;    12'd667 : toneR =`C4;
                        12'd668 : toneR =`C4;    12'd669 : toneR =`C4;
                        12'd670 : toneR =`C4;    12'd671 : toneR =`C4;

                        12'd672 : toneR =`C4;    12'd673 : toneR =`C4;
                        12'd674 : toneR =`C4;    12'd675 : toneR =`C4;
                        12'd676 : toneR =`C4;    12'd677 : toneR =`C4;
                        12'd678 : toneR =`C4;    12'd679 : toneR =`C4;
                        12'd680 : toneR =`C4;    12'd681 : toneR =`C4;
                        12'd682 : toneR =`C4;    12'd683 : toneR =`C4;
                        12'd684 : toneR =`C4;    12'd685 : toneR =`C4;
                        12'd686 : toneR =`C4;    12'd687 : toneR =`C4;

                        12'd688 : toneR =`C4;    12'd689 : toneR =`C4;
                        12'd690 : toneR =`C4;    12'd691 : toneR =`C4;
                        12'd692 : toneR =`C4;    12'd693 : toneR =`C4;
                        12'd694 : toneR =`C4;    12'd695 : toneR =`C4;
                        12'd696 : toneR =`C4;    12'd697 : toneR =`C4;
                        12'd698 : toneR =`C4;    12'd699 : toneR =`C4;
                        12'd700 : toneR =`C4;    12'd701 : toneR =`C4;
                        12'd702 : toneR =`C4;    12'd703 : toneR =`C4;

                        // --- Measure 12 ---
                        12'd704 : toneR =`sil;    12'd705 : toneR =`sil;
                        12'd706 : toneR =`sil;    12'd707 : toneR =`sil;
                        12'd708 : toneR =`sil;    12'd709 : toneR =`sil;
                        12'd710 : toneR =`sil;    12'd711 : toneR =`sil;
                        12'd712 : toneR =`sil;    12'd713 : toneR =`sil;
                        12'd714 : toneR =`sil;    12'd715 : toneR =`sil;
                        12'd716 : toneR =`sil;    12'd717 : toneR =`sil;
                        12'd718 : toneR =`sil;    12'd719 : toneR =`sil;

                        12'd720 : toneR =`C6;    12'd721 : toneR =`C6;
                        12'd722 : toneR =`C6;    12'd723 : toneR =`C6;
                        12'd724 : toneR =`C6;    12'd725 : toneR =`C6;
                        12'd726 : toneR =`C6;    12'd727 : toneR =`C6;
                        12'd728 : toneR =`C6;    12'd729 : toneR =`C6;
                        12'd730 : toneR =`C6;    12'd731 : toneR =`C6;
                        12'd732 : toneR =`C6;    12'd733 : toneR =`C6;
                        12'd734 : toneR =`C6;    12'd735 : toneR =`C6;

                        12'd736 : toneR =`A5;    12'd737 : toneR =`A5;
                        12'd738 : toneR =`A5;    12'd739 : toneR =`A5;
                        12'd740 : toneR =`A5;    12'd741 : toneR =`A5;
                        12'd742 : toneR =`A5;    12'd743 : toneR =`A5;
                        12'd744 : toneR =`G5;    12'd745 : toneR =`G5;
                        12'd746 : toneR =`G5;    12'd747 : toneR =`G5;
                        12'd748 : toneR =`G5;    12'd749 : toneR =`G5;
                        12'd750 : toneR =`G5;    12'd751 : toneR =`G5;

                        12'd752 : toneR =`F5;    12'd753 : toneR =`F5;
                        12'd754 : toneR =`F5;    12'd755 : toneR =`F5;
                        12'd756 : toneR =`F5;    12'd757 : toneR =`F5;
                        12'd758 : toneR =`F5;    12'd759 : toneR =`F5;
                        12'd760 : toneR =`D5;    12'd761 : toneR =`D5;
                        12'd762 : toneR =`D5;    12'd763 : toneR =`D5;
                        12'd764 : toneR =`D5;    12'd765 : toneR =`D5;
                        12'd766 : toneR =`D5;    12'd767 : toneR =`D5;

                        // --- Measure 13 ---
                        12'd768 : toneR =`C5;    12'd769 : toneR =`C5;
                        12'd770 : toneR =`C5;    12'd771 : toneR =`C5;
                        12'd772 : toneR =`C5;    12'd773 : toneR =`C5;
                        12'd774 : toneR =`C5;    12'd775 : toneR =`C5;
                        12'd776 : toneR =`B4b;    12'd777 : toneR =`B4b;
                        12'd778 : toneR =`B4b;    12'd779 : toneR =`B4b;
                        12'd780 : toneR =`B4b;    12'd781 : toneR =`B4b;
                        12'd782 : toneR =`B4b;    12'd783 : toneR =`B4b;

                        12'd784 : toneR =`A4b;    12'd785 : toneR =`A4b;
                        12'd786 : toneR =`A4b;    12'd787 : toneR =`A4b;
                        12'd788 : toneR =`A4b;    12'd789 : toneR =`A4b;
                        12'd790 : toneR =`A4b;    12'd791 : toneR =`A4b;
                        12'd792 : toneR =`B4b;    12'd793 : toneR =`B4b;
                        12'd794 : toneR =`B4b;    12'd795 : toneR =`B4b;
                        12'd796 : toneR =`B4b;    12'd797 : toneR =`B4b;
                        12'd798 : toneR =`B4b;    12'd799 : toneR =`B4b;

                        12'd800 : toneR =`B4b;    12'd801 : toneR =`B4b;
                        12'd802 : toneR =`B4b;    12'd803 : toneR =`B4b;
                        12'd804 : toneR =`B4b;    12'd805 : toneR =`B4b;
                        12'd806 : toneR =`B4b;    12'd807 : toneR =`B4b;
                        12'd808 : toneR =`C5;    12'd809 : toneR =`C5;
                        12'd810 : toneR =`C5;    12'd811 : toneR =`C5;
                        12'd812 : toneR =`C5;    12'd813 : toneR =`C5;
                        12'd814 : toneR =`C5;    12'd815 : toneR =`C5;

                        12'd816 : toneR =`D5;    12'd817 : toneR =`D5;
                        12'd818 : toneR =`D5;    12'd819 : toneR =`D5;
                        12'd820 : toneR =`D5;    12'd821 : toneR =`D5;
                        12'd822 : toneR =`D5;    12'd823 : toneR =`D5;
                        12'd824 : toneR =`D5;    12'd825 : toneR =`D5;
                        12'd826 : toneR =`D5;    12'd827 : toneR =`D5;
                        12'd828 : toneR =`D5;    12'd829 : toneR =`D5;
                        12'd830 : toneR =`D5;    12'd831 : toneR =`D5;

                        // --- Measure 14 ---
                        12'd832 : toneR =`C5;    12'd833 : toneR =`C5;
                        12'd834 : toneR =`C5;    12'd835 : toneR =`C5;
                        12'd836 : toneR =`C5;    12'd837 : toneR =`C5;
                        12'd838 : toneR =`C5;    12'd839 : toneR =`C5;
                        12'd840 : toneR =`C5;    12'd841 : toneR =`C5;
                        12'd842 : toneR =`C5;    12'd843 : toneR =`C5;
                        12'd844 : toneR =`C5;    12'd845 : toneR =`C5;
                        12'd846 : toneR =`C5;    12'd847 : toneR =`C5;

                        12'd848 : toneR =`C5;    12'd849 : toneR =`C5;
                        12'd850 : toneR =`C5;    12'd851 : toneR =`C5;
                        12'd852 : toneR =`C5;    12'd853 : toneR =`C5;
                        12'd854 : toneR =`C5;    12'd855 : toneR =`C5;
                        12'd856 : toneR =`G5;    12'd857 : toneR =`G5;
                        12'd858 : toneR =`G5;    12'd859 : toneR =`G5;
                        12'd860 : toneR =`G5;    12'd861 : toneR =`G5;
                        12'd862 : toneR =`G5;    12'd863 : toneR =`G5;

                        12'd864 : toneR =`G5;    12'd865 : toneR =`G5;
                        12'd866 : toneR =`G5;    12'd867 : toneR =`G5;
                        12'd868 : toneR =`G5;    12'd869 : toneR =`G5;
                        12'd870 : toneR =`G5;    12'd871 : toneR =`G5;
                        12'd872 : toneR =`G5;    12'd873 : toneR =`G5;
                        12'd874 : toneR =`G5;    12'd875 : toneR =`G5;
                        12'd876 : toneR =`G5;    12'd877 : toneR =`G5;
                        12'd878 : toneR =`G5;    12'd879 : toneR =`G5;

                        12'd880 : toneR =`G5;    12'd881 : toneR =`G5;
                        12'd882 : toneR =`G5;    12'd883 : toneR =`G5;
                        12'd884 : toneR =`G5;    12'd885 : toneR =`G5;
                        12'd886 : toneR =`G5;    12'd887 : toneR =`G5;
                        12'd888 : toneR =`G5;    12'd889 : toneR =`G5;
                        12'd890 : toneR =`G5;    12'd891 : toneR =`G5;
                        12'd892 : toneR =`G5;    12'd893 : toneR =`G5;
                        12'd894 : toneR =`G5;    12'd895 : toneR =`G5;

                        // --- Measure 15 ---
                        12'd896 : toneR =`sil;    12'd897 : toneR =`sil;
                        12'd898 : toneR =`sil;    12'd899 : toneR =`sil;
                        12'd900 : toneR =`sil;    12'd901 : toneR =`sil;
                        12'd902 : toneR =`sil;    12'd903 : toneR =`sil;
                        12'd904 : toneR =`sil;    12'd905 : toneR =`sil;
                        12'd906 : toneR =`sil;    12'd907 : toneR =`sil;
                        12'd908 : toneR =`sil;    12'd909 : toneR =`sil;
                        12'd910 : toneR =`sil;    12'd911 : toneR =`sil;

                        12'd912 : toneR =`F5;    12'd913 : toneR =`F5;
                        12'd914 : toneR =`F5;    12'd915 : toneR =`F5;
                        12'd916 : toneR =`F5;    12'd917 : toneR =`F5;
                        12'd918 : toneR =`F5;    12'd919 : toneR =`sil;
                        12'd920 : toneR =`F5;    12'd921 : toneR =`F5;
                        12'd922 : toneR =`F5;    12'd923 : toneR =`F5;
                        12'd924 : toneR =`F5;    12'd925 : toneR =`F5;
                        12'd926 : toneR =`F5;    12'd927 : toneR =`F5;

                        12'd928 : toneR =`D5;    12'd929 : toneR =`D5;
                        12'd930 : toneR =`D5;    12'd931 : toneR =`D5;
                        12'd932 : toneR =`D5;    12'd933 : toneR =`D5;
                        12'd934 : toneR =`D5;    12'd935 : toneR =`D5;
                        12'd936 : toneR =`B4b;    12'd937 : toneR =`B4b;
                        12'd938 : toneR =`B4b;    12'd939 : toneR =`B4b;
                        12'd940 : toneR =`B4b;    12'd941 : toneR =`B4b;
                        12'd942 : toneR =`B4b;    12'd943 : toneR =`B4b;

                        12'd944 : toneR =`B4b;    12'd945 : toneR =`B4b;
                        12'd946 : toneR =`B4b;    12'd947 : toneR =`B4b;
                        12'd948 : toneR =`B4b;    12'd949 : toneR =`B4b;
                        12'd950 : toneR =`B4b;    12'd951 : toneR =`B4b;
                        12'd952 : toneR =`C5;    12'd953 : toneR =`C5;
                        12'd954 : toneR =`C5;    12'd955 : toneR =`C5;
                        12'd956 : toneR =`C5;    12'd957 : toneR =`C5;
                        12'd958 : toneR =`C5;    12'd959 : toneR =`C5;

                        // --- Measure 16 ---
                        12'd960 : toneR =`C5;    12'd961 : toneR =`C5;
                        12'd962 : toneR =`C5;    12'd963 : toneR =`C5;
                        12'd964 : toneR =`C5;    12'd965 : toneR =`C5;
                        12'd966 : toneR =`C5;    12'd967 : toneR =`C5;
                        12'd968 : toneR =`C5;    12'd969 : toneR =`C5;
                        12'd970 : toneR =`C5;    12'd971 : toneR =`C5;
                        12'd972 : toneR =`C5;    12'd973 : toneR =`C5;
                        12'd974 : toneR =`C5;    12'd975 : toneR =`C5;

                        12'd976 : toneR =`C5;   12'd977 : toneR =`C5;
                        12'd978 : toneR =`C5;   12'd979 : toneR =`C5;
                        12'd980 : toneR =`C5;   12'd981 : toneR =`C5;
                        12'd982 : toneR =`C5;   12'd983 : toneR =`C5;
                        12'd984 : toneR =`C5;   12'd985 : toneR =`C5;
                        12'd986 : toneR =`C5;   12'd987 : toneR =`C5;
                        12'd988 : toneR =`C5;   12'd989 : toneR =`C5;
                        12'd990 : toneR =`C5;   12'd991 : toneR =`C5;

                        12'd992 : toneR =`sil;    12'd993 : toneR =`sil;
                        12'd994 : toneR =`sil;    12'd995 : toneR =`sil;
                        12'd996 : toneR =`sil;    12'd997 : toneR =`sil;
                        12'd998 : toneR =`sil;    12'd999 : toneR =`sil;
                        // 12'd1000: toneR =`C5;    12'd1001: toneR =`C5;
                        // 12'd1002: toneR =`C5;    12'd1003: toneR =`C5;
                        // 12'd1004: toneR =`C5;    12'd1005: toneR =`C5;
                        // 12'd1006: toneR =`C5;    12'd1007: toneR =`sil;

                        // 12'd1008: toneR =`C5;    12'd1009: toneR =`C5;
                        // 12'd1010: toneR =`C5;    12'd1011: toneR =`C5;
                        // 12'd1012: toneR =`C5;    12'd1013: toneR =`C5;
                        // 12'd1014: toneR =`C5;    12'd1015: toneR =`C5;
                        // 12'd1016: toneR =`A4b;    12'd1017: toneR =`A4b;
                        // 12'd1018: toneR =`A4b;    12'd1019: toneR =`A4b;
                        // 12'd1020: toneR =`A4b;    12'd1021: toneR =`A4b;
                        // 12'd1022: toneR =`A4b;    12'd1023: toneR =`A4b;
                        default: toneR = `sil;
                    endcase
                end
                1:begin
                    case(ibeatNum)
                        // --- Measure 1 ---
                        12'd0   : toneR = `E5b;    12'd1   : toneR = `E5b;
                        12'd2   : toneR = `E5b;    12'd3   : toneR = `E5b;
                        12'd4   : toneR = `E5b;    12'd5   : toneR = `E5b;
                        12'd6   : toneR = `E5b;    12'd7   : toneR = `E5b;
                        12'd8   : toneR = `E5b;    12'd9   : toneR = `E5b;
                        12'd10  : toneR = `E5b;    12'd11  : toneR = `E5b;
                        12'd12  : toneR = `E5b;    12'd13  : toneR = `E5b;
                        12'd14  : toneR = `E5b;    12'd15  : toneR = `E5b;

                        12'd16  : toneR = `A4b;    12'd17  : toneR = `A4b;
                        12'd18  : toneR = `A4b;    12'd19  : toneR = `A4b;
                        12'd20  : toneR = `A4b;    12'd21  : toneR = `A4b;
                        12'd22  : toneR = `A4b;    12'd23  : toneR = `A4b;
                        12'd24  : toneR = `A4b;    12'd25  : toneR = `A4b;
                        12'd26  : toneR = `A4b;    12'd27  : toneR = `A4b;
                        12'd28  : toneR = `A4b;    12'd29  : toneR = `A4b;
                        12'd30  : toneR = `A4b;    12'd31  : toneR = `A4b;

                        12'd32  : toneR = `C5;    12'd33  : toneR = `C5;  
                        12'd34  : toneR = `C5;    12'd35  : toneR = `C5;  
                        12'd36  : toneR = `C5;    12'd37  : toneR = `C5;  
                        12'd38  : toneR = `C5;    12'd39  : toneR = `C5;
                        12'd40  : toneR = `E5b;    12'd41  : toneR = `E5b;
                        12'd42  : toneR = `E5b;    12'd43  : toneR = `E5b;
                        12'd44  : toneR = `E5b;    12'd45  : toneR = `E5b;
                        12'd46  : toneR = `E5b;    12'd47  : toneR = `E5b;

                        12'd48  : toneR = `E5b;    12'd49  : toneR = `E5b;
                        12'd50  : toneR = `E5b;    12'd51  : toneR = `E5b;
                        12'd52  : toneR = `E5b;    12'd53  : toneR = `E5b;
                        12'd54  : toneR = `E5b;    12'd55  : toneR = `E5b;
                        12'd56  : toneR = `D5;    12'd57  : toneR = `D5;
                        12'd58  : toneR = `D5;    12'd59  : toneR = `D5;
                        12'd60  : toneR = `D5;    12'd61  : toneR = `D5;
                        12'd62  : toneR = `D5;    12'd63  : toneR = `D5;

                        // --- Measure 2 ---
                        12'd64  : toneR = `D5;    12'd65  : toneR = `D5;
                        12'd66  : toneR = `D5;    12'd67  : toneR = `D5;
                        12'd68  : toneR = `D5;    12'd69  : toneR = `D5;
                        12'd70  : toneR = `D5;    12'd71  : toneR = `D5;
                        12'd72  : toneR = `D5;    12'd73  : toneR = `D5;
                        12'd74  : toneR = `D5;    12'd75  : toneR = `D5;
                        12'd76  : toneR = `D5;    12'd77  : toneR = `D5;
                        12'd78  : toneR = `D5;    12'd79  : toneR = `D5;

                        12'd80  : toneR = `D5;    12'd81  : toneR = `D5;
                        12'd82  : toneR = `D5;    12'd83  : toneR = `D5;
                        12'd84  : toneR = `D5;    12'd85  : toneR = `D5;
                        12'd86  : toneR = `D5;    12'd87  : toneR = `D5;
                        12'd88  : toneR = `D5;    12'd89  : toneR = `D5;
                        12'd90  : toneR = `D5;    12'd91  : toneR = `D5;
                        12'd92  : toneR = `D5;    12'd93  : toneR = `D5;
                        12'd94  : toneR = `D5;    12'd95  : toneR = `D5;

                        12'd96  : toneR = `sil;    12'd97  : toneR = `sil;
                        12'd98  : toneR = `sil;    12'd99  : toneR = `sil;
                        12'd100 : toneR = `sil;    12'd101 : toneR = `sil;
                        12'd102 : toneR = `sil;    12'd103 : toneR = `sil;
                        12'd104 : toneR = `B4b;    12'd105 : toneR = `B4b;
                        12'd106 : toneR = `B4b;    12'd107 : toneR = `B4b;
                        12'd108 : toneR = `B4b;    12'd109 : toneR = `B4b;
                        12'd110 : toneR = `B4b;    12'd111 : toneR = `sil;

                        12'd112 : toneR = `B4b;    12'd113 : toneR = `B4b;
                        12'd114 : toneR = `B4b;    12'd115 : toneR = `B4b;
                        12'd116 : toneR = `B4b;    12'd117 : toneR = `B4b;
                        12'd118 : toneR = `B4b;    12'd119 : toneR = `B4b;
                        12'd120 : toneR = `C5;    12'd121 : toneR = `C5;
                        12'd122 : toneR = `C5;    12'd123 : toneR = `C5;
                        12'd124 : toneR = `C5;    12'd125 : toneR = `C5;
                        12'd126 : toneR = `C5;    12'd127 : toneR = `C5;

                        // --- Measure 3 ---
                        12'd128 : toneR = `D5;    12'd129 : toneR = `D5;
                        12'd130 : toneR = `D5;    12'd131 : toneR = `D5;
                        12'd132 : toneR = `D5;    12'd133 : toneR = `D5;
                        12'd134 : toneR = `D5;    12'd135 : toneR = `D5;
                        12'd136 : toneR = `D5;    12'd137 : toneR = `D5;
                        12'd138 : toneR = `D5;    12'd139 : toneR = `D5;
                        12'd140 : toneR = `D5;    12'd141 : toneR = `D5;
                        12'd142 : toneR = `D5;    12'd143 : toneR = `D5;

                        12'd144 : toneR = `G4;    12'd145 : toneR = `G4;
                        12'd146 : toneR = `G4;    12'd147 : toneR = `G4;
                        12'd148 : toneR = `G4;    12'd149 : toneR = `G4;
                        12'd150 : toneR = `G4;    12'd151 : toneR = `G4;
                        12'd152 : toneR = `G4;    12'd153 : toneR = `G4;
                        12'd154 : toneR = `G4;    12'd155 : toneR = `G4;
                        12'd156 : toneR = `G4;    12'd157 : toneR = `G4;
                        12'd158 : toneR = `G4;    12'd159 : toneR = `G4;

                        12'd160 : toneR = `B4b;    12'd161 : toneR = `B4b;
                        12'd162 : toneR = `B4b;    12'd163 : toneR = `B4b;
                        12'd164 : toneR = `B4b;    12'd165 : toneR = `B4b;
                        12'd166 : toneR = `B4b;    12'd167 : toneR = `B4b;
                        12'd168 : toneR = `D5;    12'd169 : toneR = `D5;
                        12'd170 : toneR = `D5;    12'd171 : toneR = `D5;
                        12'd172 : toneR = `D5;    12'd173 : toneR = `D5;
                        12'd174 : toneR = `D5;    12'd175 : toneR = `D5;

                        12'd176 : toneR = `D5;    12'd177 : toneR = `D5;
                        12'd178 : toneR = `D5;    12'd179 : toneR = `D5;
                        12'd180 : toneR = `D5;    12'd181 : toneR = `D5;
                        12'd182 : toneR = `D5;    12'd183 : toneR = `sil;
                        12'd184 : toneR = `D5;    12'd185 : toneR = `D5;
                        12'd186 : toneR = `D5;    12'd187 : toneR = `D5;
                        12'd188 : toneR = `D5;    12'd189 : toneR = `D5;
                        12'd190 : toneR = `D5;    12'd191 : toneR = `D5;

                        // --- Measure 4 ---
                        12'd192 : toneR = `D5;    12'd193 : toneR = `D5;
                        12'd194 : toneR = `D5;    12'd195 : toneR = `D5;
                        12'd196 : toneR = `D5;    12'd197 : toneR = `D5;
                        12'd198 : toneR = `D5;    12'd199 : toneR = `D5;
                        12'd200 : toneR = `E5b;    12'd201 : toneR = `E5b;
                        12'd202 : toneR = `E5b;    12'd203 : toneR = `E5b;
                        12'd204 : toneR = `E5b;    12'd205 : toneR = `E5b;
                        12'd206 : toneR = `E5b;    12'd207 : toneR = `E5b;

                        12'd208 : toneR = `D5;    12'd209 : toneR = `D5;
                        12'd210 : toneR = `D5;    12'd211 : toneR = `D5;
                        12'd212 : toneR = `D5;    12'd213 : toneR = `D5;
                        12'd214 : toneR = `D5;    12'd215 : toneR = `D5;
                        12'd216 : toneR = `C5;    12'd217 : toneR = `C5;
                        12'd218 : toneR = `C5;    12'd219 : toneR = `C5;
                        12'd220 : toneR = `C5;    12'd221 : toneR = `C5;
                        12'd222 : toneR = `C5;    12'd223 : toneR = `C5;

                        12'd224 : toneR = `C5;    12'd225 : toneR = `C5;
                        12'd226 : toneR = `C5;    12'd227 : toneR = `C5;
                        12'd228 : toneR = `C5;    12'd229 : toneR = `C5;
                        12'd230 : toneR = `C5;    12'd231 : toneR = `C5;
                        12'd232 : toneR = `sil;    12'd233 : toneR = `sil;
                        12'd234 : toneR = `sil;    12'd235 : toneR = `sil;
                        12'd236 : toneR = `sil;    12'd237 : toneR = `sil;
                        12'd238 : toneR = `sil;    12'd239 : toneR = `sil;

                        12'd240 : toneR = `C5;    12'd241 : toneR = `C5;
                        12'd242 : toneR = `C5;    12'd243 : toneR = `C5;
                        12'd244 : toneR = `C5;    12'd245 : toneR = `C5;
                        12'd246 : toneR = `C5;    12'd247 : toneR = `C5;
                        12'd248 : toneR = `D5;    12'd249 : toneR = `D5;
                        12'd250 : toneR = `D5;    12'd251 : toneR = `D5;
                        12'd252 : toneR = `D5;    12'd253 : toneR = `D5;
                        12'd254 : toneR = `D5;    12'd255 : toneR = `D5;

                        // --- Measure 5 ---
                        12'd256 : toneR = `E5b;    12'd257 : toneR = `E5b;
                        12'd258 : toneR = `E5b;    12'd259 : toneR = `E5b;
                        12'd260 : toneR = `E5b;    12'd261 : toneR = `E5b;
                        12'd262 : toneR = `E5b;    12'd263 : toneR = `E5b;
                        12'd264 : toneR = `E5b;    12'd265 : toneR = `E5b;
                        12'd266 : toneR = `E5b;    12'd267 : toneR = `E5b;
                        12'd268 : toneR = `E5b;    12'd269 : toneR = `E5b;
                        12'd270 : toneR = `E5b;    12'd271 : toneR = `E5b;

                        12'd272 : toneR = `A4b;    12'd273 : toneR = `A4b;
                        12'd274 : toneR = `A4b;    12'd275 : toneR = `A4b;
                        12'd276 : toneR = `A4b;    12'd277 : toneR = `A4b;
                        12'd278 : toneR = `A4b;    12'd279 : toneR = `A4b;
                        12'd280 : toneR = `A4b;    12'd281 : toneR = `A4b;
                        12'd282 : toneR = `A4b;    12'd283 : toneR = `A4b;
                        12'd284 : toneR = `A4b;    12'd285 : toneR = `A4b;
                        12'd286 : toneR = `A4b;    12'd287 : toneR = `sil;

                        12'd288 : toneR = `A4b;    12'd289 : toneR = `A4b;
                        12'd290 : toneR = `A4b;    12'd291 : toneR = `A4b;
                        12'd292 : toneR = `A4b;    12'd293 : toneR = `A4b;
                        12'd294 : toneR = `A4b;    12'd295 : toneR = `A4b;
                        12'd296 : toneR = `C5;    12'd297 : toneR = `C5;
                        12'd298 : toneR = `C5;    12'd299 : toneR = `C5;
                        12'd300 : toneR = `C5;    12'd301 : toneR = `C5;
                        12'd302 : toneR = `C5;    12'd303 : toneR = `C5;

                        12'd304 : toneR = `C5;    12'd305 : toneR = `C5;
                        12'd306 : toneR = `C5;    12'd307 : toneR = `C5;
                        12'd308 : toneR = `C5;    12'd309 : toneR = `C5;
                        12'd310 : toneR = `C5;    12'd311 : toneR = `C5;
                        12'd312 : toneR = `E5b;    12'd313 : toneR = `E5b;
                        12'd314 : toneR = `E5b;    12'd315 : toneR = `E5b;
                        12'd316 : toneR = `E5b;    12'd317 : toneR = `E5b;
                        12'd318 : toneR = `E5b;    12'd319 : toneR = `E5b;

                        // --- Measure 6 ---
                        12'd320 : toneR = `F5;    12'd321 : toneR = `F5;
                        12'd322 : toneR = `F5;    12'd323 : toneR = `F5;
                        12'd324 : toneR = `F5;    12'd325 : toneR = `F5;
                        12'd326 : toneR = `F5;    12'd327 : toneR = `F5;
                        12'd328 : toneR = `F5;    12'd329 : toneR = `F5;
                        12'd330 : toneR = `F5;    12'd331 : toneR = `F5;
                        12'd332 : toneR = `F5;    12'd333 : toneR = `F5;
                        12'd334 : toneR = `F5;    12'd335 : toneR = `F5;

                        12'd336 : toneR = `F5;    12'd337 : toneR = `F5;
                        12'd338 : toneR = `F5;    12'd339 : toneR = `F5;
                        12'd340 : toneR = `F5;    12'd341 : toneR = `F5;
                        12'd342 : toneR = `F5;    12'd343 : toneR = `F5;
                        12'd344 : toneR = `F5;    12'd345 : toneR = `F5;
                        12'd346 : toneR = `F5;    12'd347 : toneR = `F5;
                        12'd348 : toneR = `F5;    12'd349 : toneR = `F5;
                        12'd350 : toneR = `F5;    12'd351 : toneR = `sil;

                        12'd352 : toneR = `F5;    12'd353 : toneR = `F5;
                        12'd354 : toneR = `F5;    12'd355 : toneR = `F5;
                        12'd356 : toneR = `F5;    12'd357 : toneR = `F5;
                        12'd358 : toneR = `F5;    12'd359 : toneR = `F5;
                        12'd360 : toneR = `E5b;    12'd361 : toneR = `E5b;
                        12'd362 : toneR = `E5b;    12'd363 : toneR = `E5b;
                        12'd364 : toneR = `E5b;    12'd365 : toneR = `E5b;
                        12'd366 : toneR = `E5b;    12'd367 : toneR = `E5b;

                        12'd368 : toneR = `E5b;    12'd369 : toneR = `E5b;
                        12'd370 : toneR = `E5b;    12'd371 : toneR = `E5b;
                        12'd372 : toneR = `E5b;    12'd373 : toneR = `E5b;
                        12'd374 : toneR = `E5b;    12'd375 : toneR = `E5b;
                        12'd376 : toneR = `D5;    12'd377 : toneR = `D5;
                        12'd378 : toneR = `D5;    12'd379 : toneR = `D5;
                        12'd380 : toneR = `D5;    12'd381 : toneR = `D5;
                        12'd382 : toneR = `D5;    12'd383 : toneR = `D5;

                        // --- Measure 7 ---
                        12'd384 : toneR = `E5b;    12'd385 : toneR = `E5b;
                        12'd386 : toneR = `E5b;    12'd387 : toneR = `E5b;
                        12'd388 : toneR = `E5b;    12'd389 : toneR = `E5b;
                        12'd390 : toneR = `E5b;    12'd391 : toneR = `E5b;
                        12'd392 : toneR = `E5b;    12'd393 : toneR = `E5b;
                        12'd394 : toneR = `E5b;    12'd395 : toneR = `E5b;
                        12'd396 : toneR = `E5b;    12'd397 : toneR = `E5b;
                        12'd398 : toneR = `E5b;    12'd399 : toneR = `E5b;

                        12'd400 : toneR = `E5b;    12'd401 : toneR = `E5b;
                        12'd402 : toneR = `E5b;    12'd403 : toneR = `E5b;
                        12'd404 : toneR = `E5b;    12'd405 : toneR = `E5b;
                        12'd406 : toneR = `E5b;    12'd407 : toneR = `E5b;
                        12'd408 : toneR = `E5b;    12'd409 : toneR = `E5b;
                        12'd410 : toneR = `E5b;    12'd411 : toneR = `E5b;
                        12'd412 : toneR = `E5b;    12'd413 : toneR = `E5b;
                        12'd414 : toneR = `E5b;    12'd415 : toneR = `E5b;

                        12'd416 : toneR = `E5b;    12'd417 : toneR = `E5b;
                        12'd418 : toneR = `E5b;    12'd419 : toneR = `E5b;
                        12'd420 : toneR = `E5b;    12'd421 : toneR = `E5b;
                        12'd422 : toneR = `E5b;    12'd423 : toneR = `E5b;
                        12'd424 : toneR = `E5b;    12'd425 : toneR = `E5b;
                        12'd426 : toneR = `E5b;    12'd427 : toneR = `E5b;
                        12'd428 : toneR = `E5b;    12'd429 : toneR = `E5b;
                        12'd430 : toneR = `E5b;    12'd431 : toneR = `E5b;

                        12'd432 : toneR = `sil;    12'd433 : toneR = `sil;
                        12'd434 : toneR = `sil;    12'd435 : toneR = `sil;
                        12'd436 : toneR = `sil;    12'd437 : toneR = `sil;
                        12'd438 : toneR = `sil;    12'd439 : toneR = `sil;
                        12'd440 : toneR = `sil;    12'd441 : toneR = `sil;
                        12'd442 : toneR = `sil;    12'd443 : toneR = `sil;
                        12'd444 : toneR = `sil;    12'd445 : toneR = `sil;
                        12'd446 : toneR = `sil;    12'd447 : toneR = `sil;
                        default: toneR = `sil;
                    endcase
                end
                2:begin
                    case(ibeatNum)
                    // --- Measure 1 ---
                        12'd0   : toneR = `C4;    12'd1   : toneR = `C4;
                        12'd2   : toneR = `C4;    12'd3   : toneR = `C4;
                        12'd4   : toneR = `C4;    12'd5   : toneR = `C4;
                        12'd6   : toneR = `C4;    12'd7   : toneR = `C4;
                        12'd8   : toneR = `D4;    12'd9   : toneR = `D4;
                        12'd10  : toneR = `D4;    12'd11  : toneR = `D4;
                        12'd12  : toneR = `D4;    12'd13  : toneR = `D4;
                        12'd14  : toneR = `D4;    12'd15  : toneR = `D4;

                        12'd16  : toneR = `C4;    12'd17  : toneR = `C4;
                        12'd18  : toneR = `C4;    12'd19  : toneR = `C4;
                        12'd20  : toneR = `C4;    12'd21  : toneR = `C4;
                        12'd22  : toneR = `C4;    12'd23  : toneR = `C4;
                        12'd24  : toneR = `E4;    12'd25  : toneR = `E4;
                        12'd26  : toneR = `E4;    12'd27  : toneR = `E4;
                        12'd28  : toneR = `E4;    12'd29  : toneR = `E4;
                        12'd30  : toneR = `E4;    12'd31  : toneR = `E4;

                        12'd32  : toneR = `E4;    12'd33  : toneR = `E4;
                        12'd34  : toneR = `E4;    12'd35  : toneR = `E4; 
                        12'd36  : toneR = `E4;    12'd37  : toneR = `E4; 
                        12'd38  : toneR = `E4;    12'd39  : toneR = `sil;
                        12'd40  : toneR = `E4;    12'd41  : toneR = `E4; 
                        12'd42  : toneR = `E4;    12'd43  : toneR = `E4; 
                        12'd44  : toneR = `E4;    12'd45  : toneR = `E4;
                        12'd46  : toneR = `E4;    12'd47  : toneR = `E4;

                        12'd48  : toneR = `E4;    12'd49  : toneR = `E4;
                        12'd50  : toneR = `E4;    12'd51  : toneR = `E4;
                        12'd52  : toneR = `E4;    12'd53  : toneR = `E4;
                        12'd54  : toneR = `E4;    12'd55  : toneR = `E4;
                        12'd56  : toneR = `D4;    12'd57  : toneR = `D4;
                        12'd58  : toneR = `D4;    12'd59  : toneR = `D4;
                        12'd60  : toneR = `D4;    12'd61  : toneR = `D4;
                        12'd62  : toneR = `D4;    12'd63  : toneR = `D4;

                        // --- Measure 2 ---
                        12'd64  : toneR = `C4;    12'd65  : toneR = `C4;
                        12'd66  : toneR = `C4;    12'd67  : toneR = `C4;
                        12'd68  : toneR = `C4;    12'd69  : toneR = `C4;
                        12'd70  : toneR = `C4;    12'd71  : toneR = `C4;
                        12'd72  : toneR = `C4;    12'd73  : toneR = `C4;
                        12'd74  : toneR = `C4;    12'd75  : toneR = `C4;
                        12'd76  : toneR = `C4;    12'd77  : toneR = `C4;
                        12'd78  : toneR = `C4;    12'd79  : toneR = `C4;

                        12'd80  : toneR = `D4;    12'd81  : toneR = `D4;
                        12'd82  : toneR = `D4;    12'd83  : toneR = `D4;
                        12'd84  : toneR = `D4;    12'd85  : toneR = `D4;
                        12'd86  : toneR = `D4;    12'd87  : toneR = `D4;
                        12'd88  : toneR = `D4;    12'd89  : toneR = `D4;
                        12'd90  : toneR = `D4;    12'd91  : toneR = `D4;
                        12'd92  : toneR = `D4;    12'd93  : toneR = `D4;
                        12'd94  : toneR = `D4;    12'd95  : toneR = `D4;

                        12'd96  : toneR = `G4;    12'd97  : toneR = `G4;
                        12'd98  : toneR = `G4;    12'd99  : toneR = `G4;
                        12'd100 : toneR = `G4;    12'd101 : toneR = `G4;
                        12'd102 : toneR = `G4;    12'd103 : toneR = `sil;
                        12'd104 : toneR = `G4;    12'd105 : toneR = `G4;
                        12'd106 : toneR = `G4;    12'd107 : toneR = `G4;
                        12'd108 : toneR = `G4;    12'd109 : toneR = `G4;
                        12'd110 : toneR = `G4;    12'd111 : toneR = `G4;

                        12'd112 : toneR = `G4;    12'd113 : toneR = `G4;
                        12'd114 : toneR = `G4;    12'd115 : toneR = `G4;
                        12'd116 : toneR = `G4;    12'd117 : toneR = `G4;
                        12'd118 : toneR = `G4;    12'd119 : toneR = `G4;
                        12'd120 : toneR = `D4;    12'd121 : toneR = `D4;
                        12'd122 : toneR = `D4;    12'd123 : toneR = `D4;
                        12'd124 : toneR = `D4;    12'd125 : toneR = `D4;
                        12'd126 : toneR = `D4;    12'd127 : toneR = `D4;

                        // --- Measure 3 ---
                        12'd128 : toneR = `E4;    12'd129 : toneR = `E4;
                        12'd130 : toneR = `E4;    12'd131 : toneR = `E4;
                        12'd132 : toneR = `E4;    12'd133 : toneR = `E4;
                        12'd134 : toneR = `E4;    12'd135 : toneR = `E4;
                        12'd136 : toneR = `F4;    12'd137 : toneR = `F4;
                        12'd138 : toneR = `F4;    12'd139 : toneR = `F4;
                        12'd140 : toneR = `F4;    12'd141 : toneR = `F4;
                        12'd142 : toneR = `F4;    12'd143 : toneR = `sil;

                        12'd144 : toneR = `F4;    12'd145 : toneR = `F4;
                        12'd146 : toneR = `F4;    12'd147 : toneR = `F4;
                        12'd148 : toneR = `F4;    12'd149 : toneR = `F4;
                        12'd150 : toneR = `F4;    12'd151 : toneR = `F4;
                        12'd152 : toneR = `F4;    12'd153 : toneR = `F4;
                        12'd154 : toneR = `F4;    12'd155 : toneR = `F4;
                        12'd156 : toneR = `F4;    12'd157 : toneR = `F4;
                        12'd158 : toneR = `F4;    12'd159 : toneR = `sil;

                        12'd160 : toneR = `F4;    12'd161 : toneR = `F4;
                        12'd162 : toneR = `F4;    12'd163 : toneR = `F4;
                        12'd164 : toneR = `F4;    12'd165 : toneR = `F4;
                        12'd166 : toneR = `F4;    12'd167 : toneR = `F4;
                        12'd168 : toneR = `F4;    12'd169 : toneR = `F4;
                        12'd170 : toneR = `F4;    12'd171 : toneR = `F4;
                        12'd172 : toneR = `F4;    12'd173 : toneR = `F4;
                        12'd174 : toneR = `F4;    12'd175 : toneR = `F4;

                        12'd176 : toneR = `G4;    12'd177 : toneR = `G4;
                        12'd178 : toneR = `G4;    12'd179 : toneR = `G4;
                        12'd180 : toneR = `G4;    12'd181 : toneR = `G4;
                        12'd182 : toneR = `G4;    12'd183 : toneR = `G4;
                        12'd184 : toneR = `A4;    12'd185 : toneR = `A4;
                        12'd186 : toneR = `A4;    12'd187 : toneR = `A4;
                        12'd188 : toneR = `A4;    12'd189 : toneR = `A4;
                        12'd190 : toneR = `A4;    12'd191 : toneR = `A4;

                        // --- Measure 4 ---
                        12'd192 : toneR = `A4;    12'd193 : toneR = `A4;
                        12'd194 : toneR = `A4;    12'd195 : toneR = `A4;
                        12'd196 : toneR = `A4;    12'd197 : toneR = `A4;
                        12'd198 : toneR = `A4;    12'd199 : toneR = `A4;
                        12'd200 : toneR = `G4;    12'd201 : toneR = `G4;
                        12'd202 : toneR = `G4;    12'd203 : toneR = `G4;
                        12'd204 : toneR = `G4;    12'd205 : toneR = `G4;
                        12'd206 : toneR = `G4;    12'd207 : toneR = `sil;

                        12'd208 : toneR = `G4;    12'd209 : toneR = `G4;
                        12'd210 : toneR = `G4;    12'd211 : toneR = `G4;
                        12'd212 : toneR = `G4;    12'd213 : toneR = `G4;
                        12'd214 : toneR = `G4;    12'd215 : toneR = `G4;
                        12'd216 : toneR = `G4;    12'd217 : toneR = `G4;
                        12'd218 : toneR = `G4;    12'd219 : toneR = `G4;
                        12'd220 : toneR = `G4;    12'd221 : toneR = `G4;
                        12'd222 : toneR = `G4;    12'd223 : toneR = `G4;

                        12'd224 : toneR = `G4;    12'd225 : toneR = `G4;
                        12'd226 : toneR = `G4;    12'd227 : toneR = `G4;
                        12'd228 : toneR = `G4;    12'd229 : toneR = `G4;
                        12'd230 : toneR = `G4;    12'd231 : toneR = `G4;
                        12'd232 : toneR = `G4;    12'd233 : toneR = `G4;
                        12'd234 : toneR = `G4;    12'd235 : toneR = `G4;
                        12'd236 : toneR = `G4;    12'd237 : toneR = `G4;
                        12'd238 : toneR = `G4;    12'd239 : toneR = `G4;

                        12'd240 : toneR = `G4;    12'd241 : toneR = `G4;
                        12'd242 : toneR = `G4;    12'd243 : toneR = `G4;
                        12'd244 : toneR = `G4;    12'd245 : toneR = `G4;
                        12'd246 : toneR = `G4;    12'd247 : toneR = `G4;
                        12'd248 : toneR = `G4;    12'd249 : toneR = `G4;
                        12'd250 : toneR = `G4;    12'd251 : toneR = `G4;
                        12'd252 : toneR = `G4;    12'd253 : toneR = `G4;
                        12'd254 : toneR = `G4;    12'd255 : toneR = `G4;

                        // --- Measure 5 ---
                        12'd256 : toneR = `G4;    12'd257 : toneR = `G4;
                        12'd258 : toneR = `G4;    12'd259 : toneR = `G4;
                        12'd260 : toneR = `G4;    12'd261 : toneR = `G4;
                        12'd262 : toneR = `G4;    12'd263 : toneR = `G4;
                        12'd264 : toneR = `G4;    12'd265 : toneR = `G4;
                        12'd266 : toneR = `G4;    12'd267 : toneR = `G4;
                        12'd268 : toneR = `G4;    12'd269 : toneR = `G4;
                        12'd270 : toneR = `G4;    12'd271 : toneR = `G4;
                        default: toneR = `sil;
                    endcase
                end
                3:begin
                    case(ibeatNum)
                    // --- Measure 1 ---
                        12'd0   : toneR = `D5;    12'd1   : toneR = `D5;
                        12'd2   : toneR = `D5;    12'd3   : toneR = `D5;
                        12'd4   : toneR = `D5;    12'd5   : toneR = `D5;
                        12'd6   : toneR = `D5;    12'd7   : toneR = `D5;
                        12'd8   : toneR = `D5;    12'd9   : toneR = `D5;
                        12'd10  : toneR = `D5;    12'd11  : toneR = `D5;
                        12'd12  : toneR = `E5;    12'd13  : toneR = `E5;
                        12'd14  : toneR = `E5;    12'd15  : toneR = `E5;

                        12'd16  : toneR = `E5;    12'd17  : toneR = `E5;
                        12'd18  : toneR = `E5;    12'd19  : toneR = `E5;
                        12'd20  : toneR = `C5;    12'd21  : toneR = `C5;
                        12'd22  : toneR = `C5;    12'd23  : toneR = `C5;
                        12'd24  : toneR = `C5;    12'd25  : toneR = `C5;
                        12'd26  : toneR = `C5;    12'd27  : toneR = `C5;
                        12'd28  : toneR = `C5;    12'd29  : toneR = `C5;
                        12'd30  : toneR = `C5;    12'd31  : toneR = `C5;

                        12'd32  : toneR = `E5;    12'd33  : toneR = `E5;
                        12'd34  : toneR = `E5;    12'd35  : toneR = `E5;
                        12'd36  : toneR = `E5;    12'd37  : toneR = `E5;
                        12'd38  : toneR = `E5;    12'd39  : toneR = `E5;
                        12'd40  : toneR = `B4;    12'd41  : toneR = `B4;
                        12'd42  : toneR = `B4;    12'd43  : toneR = `B4;
                        12'd44  : toneR = `B4;    12'd45  : toneR = `B4;
                        12'd46  : toneR = `B4;    12'd47  : toneR = `B4;

                        12'd48  : toneR = `B4;    12'd49  : toneR = `B4;
                        12'd50  : toneR = `B4;    12'd51  : toneR = `B4;
                        12'd52  : toneR = `E5;    12'd53  : toneR = `E5;
                        12'd54  : toneR = `E5;    12'd55  : toneR = `E5;
                        12'd56  : toneR = `E5;    12'd57  : toneR = `E5;
                        12'd58  : toneR = `E5;    12'd59  : toneR = `E5;
                        12'd60  : toneR = `A4;    12'd61  : toneR = `A4;
                        12'd62  : toneR = `A4;    12'd63  : toneR = `A4;

                        // --- Measure 2 ---
                        12'd64  : toneR = `A4;    12'd65  : toneR = `A4;
                        12'd66  : toneR = `A4;    12'd67  : toneR = `A4;
                        12'd68  : toneR = `A4;    12'd69  : toneR = `A4;
                        12'd70  : toneR = `A4;    12'd71  : toneR = `A4;
                        12'd72  : toneR = `E5;    12'd73  : toneR = `E5;
                        12'd74  : toneR = `E5;    12'd75  : toneR = `E5;
                        12'd76  : toneR = `E5;    12'd77  : toneR = `E5;
                        12'd78  : toneR = `E5;    12'd79  : toneR = `E5;

                        12'd80  : toneR = `D5;    12'd81  : toneR = `D5;
                        12'd82  : toneR = `D5;    12'd83  : toneR = `D5;
                        12'd84  : toneR = `D5;    12'd85  : toneR = `D5;
                        12'd86  : toneR = `D5;    12'd87  : toneR = `D5;
                        12'd88  : toneR = `D5;    12'd89  : toneR = `D5;
                        12'd90  : toneR = `D5;    12'd91  : toneR = `D5;
                        12'd92  : toneR = `E5;    12'd93  : toneR = `E5;
                        12'd94  : toneR = `E5;    12'd95  : toneR = `E5;

                        12'd96  : toneR = `E5;    12'd97  : toneR = `E5;
                        12'd98  : toneR = `E5;    12'd99  : toneR = `E5;
                        12'd100 : toneR = `C5;    12'd101 : toneR = `C5;
                        12'd102 : toneR = `C5;    12'd103 : toneR = `C5;
                        12'd104 : toneR = `C5;    12'd105 : toneR = `C5;
                        12'd106 : toneR = `C5;    12'd107 : toneR = `C5;
                        12'd108 : toneR = `C5;    12'd109 : toneR = `C5;
                        12'd110 : toneR = `C5;    12'd111 : toneR = `C5;

                        12'd112 : toneR = `E5;    12'd113 : toneR = `E5;
                        12'd114 : toneR = `E5;    12'd115 : toneR = `E5;
                        12'd116 : toneR = `E5;    12'd117 : toneR = `E5;
                        12'd118 : toneR = `E5;    12'd119 : toneR = `E5;
                        12'd120 : toneR = `B4;    12'd121 : toneR = `B4;
                        12'd122 : toneR = `B4;    12'd123 : toneR = `B4;
                        12'd124 : toneR = `B4;    12'd125 : toneR = `B4;
                        12'd126 : toneR = `B4;    12'd127 : toneR = `B4;

                        // --- Measure 3 ---
                        12'd128 : toneR = `B4;    12'd129 : toneR = `B4;
                        12'd130 : toneR = `B4;    12'd131 : toneR = `B4;
                        12'd132 : toneR = `E5;    12'd133 : toneR = `E5;
                        12'd134 : toneR = `E5;    12'd135 : toneR = `E5;
                        12'd136 : toneR = `E5;    12'd137 : toneR = `E5;
                        12'd138 : toneR = `E5;    12'd139 : toneR = `E5;
                        12'd140 : toneR = `A4;    12'd141 : toneR = `A4;
                        12'd142 : toneR = `A4;    12'd143 : toneR = `A4;

                        12'd144 : toneR = `A4;    12'd145 : toneR = `A4;
                        12'd146 : toneR = `A4;    12'd147 : toneR = `A4;
                        12'd148 : toneR = `A4;    12'd149 : toneR = `A4;
                        12'd150 : toneR = `A4;    12'd151 : toneR = `A4;
                        12'd152 : toneR = `A4;    12'd153 : toneR = `A4;
                        12'd154 : toneR = `A4;    12'd155 : toneR = `A4;
                        default: toneR = `sil;
                    endcase
                end
                default:begin
                    toneR = `sil;
                end
            endcase
        end
        else begin
            toneR = `sil;
        end
    end


    always @* begin
        if(en == 1) begin
            case(_music)
                0:begin
                    case(ibeatNum)
                        // --- Measure 1 ---
                        12'd0:  toneL = `sil;     12'd1:  toneL = `sil; // HG (half-beat)
                        12'd2:  toneL = `sil;     12'd3:  toneL = `sil;
                        12'd4:  toneL = `sil;     12'd5:  toneL = `sil;
                        12'd6:  toneL = `sil;     12'd7:  toneL = `sil;
                        12'd8:  toneL = `sil;     12'd9:  toneL = `sil; // HE (half-beat)
                        12'd10: toneL = `sil;     12'd11: toneL = `sil;
                        12'd12: toneL = `sil;     12'd13: toneL = `sil;
                        12'd14: toneL = `sil;     12'd15: toneL = `sil; // (Short break for repetitive notes: high E)

                        12'd16: toneL = `G4;     12'd17: toneL = `G4; // HE (one-beat)
                        12'd18: toneL = `G4;     12'd19: toneL = `G4;
                        12'd20: toneL = `G4;     12'd21: toneL = `G4;
                        12'd22: toneL = `G4;     12'd23: toneL = `sil;
                        12'd24: toneL = `G4;     12'd25: toneL = `G4;
                        12'd26: toneL = `G4;     12'd27: toneL = `G4;
                        12'd28: toneL = `G4;     12'd29: toneL = `G4;
                        12'd30: toneL = `G4;     12'd31: toneL = `G4;

                        12'd32: toneL = `B4b;     12'd33: toneL = `B4b; // HF (half-beat)
                        12'd34: toneL = `B4b;     12'd35: toneL = `B4b;
                        12'd36: toneL = `B4b;     12'd37: toneL = `B4b;
                        12'd38: toneL = `B4b;     12'd39: toneL = `B4b;
                        12'd40: toneL = `D5;     12'd41: toneL = `D5; // HD (half-beat)
                        12'd42: toneL = `D5;     12'd43: toneL = `D5;
                        12'd44: toneL = `D5;     12'd45: toneL = `D5;
                        12'd46: toneL = `D5;     12'd47: toneL = `D5; // (Short break for repetitive notes: high D)

                        12'd48: toneL = `D5;     12'd49: toneL =`D5; // HD (one-beat)
                        12'd50: toneL = `D5;     12'd51: toneL =`D5;
                        12'd52: toneL = `D5;     12'd53: toneL =`D5;
                        12'd54: toneL = `D5;     12'd55: toneL =`D5;
                        12'd56: toneL = `C5;     12'd57: toneL =`C5;
                        12'd58: toneL = `C5;     12'd59: toneL =`C5;
                        12'd60: toneL = `C5;     12'd61: toneL =`C5;
                        12'd62: toneL = `C5;     12'd63: toneL =`C5;

                        // --- Measure 2 ---
                        12'd64: toneL = `C5;     12'd65: toneL = `C5; // HC (half-beat)
                        12'd66: toneL = `C5;     12'd67: toneL = `C5;
                        12'd68: toneL = `C5;     12'd69: toneL = `C5;
                        12'd70: toneL = `C5;     12'd71: toneL = `C5;
                        12'd72: toneL = `C5;     12'd73: toneL = `C5; // HD (half-beat)
                        12'd74: toneL = `C5;     12'd75: toneL = `C5;
                        12'd76: toneL = `C5;     12'd77: toneL = `C5;
                        12'd78: toneL = `C5;     12'd79: toneL = `C5;

                        12'd80: toneL = `C5;     12'd81: toneL = `C5; // HE (half-beat)
                        12'd82: toneL = `C5;     12'd83: toneL = `C5;
                        12'd84: toneL = `C5;     12'd85: toneL = `C5;
                        12'd86: toneL = `C5;     12'd87: toneL = `C5;
                        12'd88: toneL = `G4;     12'd89: toneL = `G4; // HF (half-beat)
                        12'd90: toneL = `G4;     12'd91: toneL = `G4;
                        12'd92: toneL = `G4;     12'd93: toneL = `G4;
                        12'd94: toneL = `G4;     12'd95: toneL = `G4;

                        12'd96:  toneL = `G4;     12'd97: toneL =`G4;// HG (half-beat)
                        12'd98:  toneL = `G4;     12'd99: toneL =`G4;
                        12'd100: toneL = `G4;    12'd101: toneL =`G4;
                        12'd102: toneL = `G4;    12'd103: toneL =`G4;// (Short break for repetitive notes: high D)
                        12'd104: toneL = `G4;    12'd105: toneL =`G4; // HG (half-beat)
                        12'd106: toneL = `G4;    12'd107: toneL =`G4;
                        12'd108: toneL = `G4;    12'd109: toneL =`G4;
                        12'd110: toneL = `G4;    12'd111: toneL =`G4; // (Short break for repetitive notes: high D)

                        12'd112: toneL = `G4;    12'd113: toneL = `G4; // HG (one-beat)
                        12'd114: toneL = `G4;    12'd115: toneL = `G4;
                        12'd116: toneL = `G4;    12'd117: toneL = `G4;
                        12'd118: toneL = `G4;    12'd119: toneL = `G4;
                        12'd120: toneL = `G4;    12'd121: toneL = `G4;
                        12'd122: toneL = `G4;    12'd123: toneL = `G4;
                        12'd124: toneL = `G4;    12'd125: toneL = `G4;
                        12'd126: toneL = `G4;    12'd127: toneL = `G4;

                        // --- Measure 3 ---
                        12'd128: toneL = `sil;    12'd129: toneL = `sil;
                        12'd130: toneL = `sil;    12'd131: toneL = `sil;
                        12'd132: toneL = `sil;    12'd133: toneL = `sil;
                        12'd134: toneL = `sil;    12'd135: toneL = `sil;
                        12'd136: toneL = `sil;    12'd137: toneL = `sil;
                        12'd138: toneL = `sil;    12'd139: toneL = `sil;
                        12'd140: toneL = `sil;    12'd141: toneL = `sil;
                        12'd142: toneL = `sil;    12'd143: toneL = `sil;

                        12'd144: toneL = `G4;    12'd145: toneL = `G4;
                        12'd146: toneL = `G4;    12'd147: toneL = `G4;
                        12'd148: toneL = `G4;    12'd149: toneL = `G4;
                        12'd150: toneL = `G4;    12'd151: toneL = `sil;
                        12'd152: toneL = `G4;    12'd153: toneL = `G4;
                        12'd154: toneL = `G4;    12'd155: toneL = `G4;
                        12'd156: toneL = `G4;    12'd157: toneL = `G4;
                        12'd158: toneL = `G4;    12'd159: toneL = `sil;

                        12'd160: toneL = `F4;    12'd161: toneL = `F4;
                        12'd162: toneL = `F4;    12'd163: toneL = `F4;
                        12'd164: toneL = `F4;    12'd165: toneL = `F4;
                        12'd166: toneL = `F4;    12'd167: toneL = `F4;
                        12'd168: toneL = `B4b;    12'd169: toneL = `B4b;
                        12'd170: toneL = `B4b;    12'd171: toneL = `B4b;
                        12'd172: toneL = `B4b;    12'd173: toneL = `B4b;
                        12'd174: toneL = `B4b;    12'd175: toneL = `B4b;

                        12'd176: toneL = `B4b;    12'd177: toneL = `B4b;
                        12'd178: toneL = `B4b;    12'd179: toneL = `B4b;
                        12'd180: toneL = `B4b;    12'd181: toneL = `B4b;
                        12'd182: toneL = `B4b;    12'd183: toneL = `B4b;
                        12'd184: toneL = `G4;    12'd185: toneL = `G4;
                        12'd186: toneL = `G4;    12'd187: toneL = `G4;
                        12'd188: toneL = `G4;    12'd189: toneL = `G4;
                        12'd190: toneL = `G4;    12'd191: toneL = `G4;
                        // --- Measure 4 ---
                        12'd192: toneL = `G4;  12'd193: toneL = `G4;
                        12'd194: toneL = `G4;  12'd195: toneL = `G4;
                        12'd196: toneL = `G4;  12'd197: toneL = `G4;
                        12'd198: toneL = `G4;  12'd199: toneL = `G4;
                        12'd200: toneL = `G4;  12'd201: toneL = `G4;
                        12'd202: toneL = `G4;  12'd203: toneL = `G4;
                        12'd204: toneL = `G4;  12'd205: toneL = `G4;
                        12'd206: toneL = `G4;  12'd207: toneL = `G4;

                        12'd208: toneL = `G4;   12'd209: toneL = `G4;
                        12'd210: toneL = `G4;   12'd211: toneL = `G4;
                        12'd212: toneL = `G4;   12'd213: toneL = `G4;
                        12'd214: toneL = `G4;   12'd215: toneL = `G4;
                        12'd216: toneL = `G4;   12'd217: toneL = `G4;
                        12'd218: toneL = `G4;   12'd219: toneL = `G4;
                        12'd220: toneL = `G4;   12'd221: toneL = `G4;
                        12'd222: toneL = `G4;   12'd223: toneL = `G4;

                        12'd224: toneL = `G4;   12'd225: toneL = `G4;
                        12'd226: toneL = `G4;   12'd227: toneL = `G4;
                        12'd228: toneL = `G4;   12'd229: toneL = `G4;
                        12'd230: toneL = `G4;   12'd231: toneL = `G4;
                        12'd232: toneL =  `G4;  12'd233: toneL = `G4;
                        12'd234: toneL =  `G4;  12'd235: toneL = `G4;
                        12'd236: toneL =  `G4;  12'd237: toneL = `G4;
                        12'd238: toneL =  `G4;  12'd239: toneL = `G4;

                        12'd240: toneL = `G4;   12'd241:toneL = `G4;
                        12'd242: toneL = `G4;   12'd243:toneL = `G4;
                        12'd244: toneL = `G4;   12'd245:toneL = `G4;
                        12'd246: toneL = `G4;   12'd247:toneL = `G4;
                        12'd248: toneL = `G4;   12'd249:toneL = `G4;
                        12'd250: toneL = `G4;   12'd251:toneL = `G4;
                        12'd252: toneL = `G4;   12'd253:toneL = `G4;
                        12'd254: toneL = `G4;   12'd255:toneL = `G4;
                        // --- Measure 5 ---
                        12'd256: toneL = `sil;    12'd257: toneL = `sil;
                        12'd258: toneL = `sil;    12'd259: toneL = `sil;
                        12'd260: toneL = `sil;    12'd261: toneL = `sil;
                        12'd262: toneL = `sil;    12'd263: toneL = `sil;
                        12'd264: toneL = `sil;    12'd265: toneL = `sil;
                        12'd266: toneL = `sil;    12'd267: toneL = `sil;
                        12'd268: toneL = `sil;    12'd269: toneL = `sil;
                        12'd270: toneL = `sil;    12'd271: toneL = `sil;

                        12'd272: toneL = `G4;    12'd273: toneL = `G4;
                        12'd274: toneL = `G4;    12'd275: toneL = `G4;
                        12'd276: toneL = `G4;    12'd277: toneL = `G4;
                        12'd278: toneL = `G4;    12'd279: toneL = `sil;
                        12'd280: toneL = `G4;    12'd281: toneL = `G4;
                        12'd282: toneL = `G4;    12'd283: toneL = `G4;
                        12'd284: toneL = `G4;    12'd285: toneL = `G4;
                        12'd286: toneL = `G4;    12'd287: toneL = `G4;

                        12'd288: toneL = `B4b;    12'd289: toneL = `B4b;
                        12'd290: toneL = `B4b;    12'd291: toneL = `B4b;
                        12'd292: toneL = `B4b;    12'd293: toneL = `B4b;
                        12'd294: toneL = `B4b;    12'd295: toneL = `B4b;
                        12'd296: toneL = `D5;   12'd297: toneL = `D5;
                        12'd298: toneL = `D5;   12'd299: toneL = `D5;
                        12'd300: toneL = `D5;   12'd301: toneL = `D5;
                        12'd302: toneL = `D5;   12'd303: toneL = `D5;

                        12'd304: toneL = `D5;    12'd305: toneL = `D5;
                        12'd306: toneL = `D5;    12'd307: toneL = `D5;
                        12'd308: toneL = `D5;    12'd309: toneL = `D5;
                        12'd310: toneL = `D5;    12'd311: toneL = `D5;
                        12'd312: toneL = `C5;    12'd313: toneL = `C5;
                        12'd314: toneL = `C5;    12'd315: toneL = `C5;
                        12'd316: toneL = `C5;    12'd317: toneL = `C5;
                        12'd318: toneL = `C5;    12'd319: toneL = `C5;
                        // --- Measure 6 ---
                        12'd320: toneL = `C5;    12'd321: toneL = `C5;
                        12'd322: toneL = `C5;    12'd323: toneL = `C5;
                        12'd324: toneL = `C5;    12'd325: toneL = `C5;
                        12'd326: toneL = `C5;    12'd327: toneL = `C5;
                        12'd328: toneL = `C5;    12'd329: toneL = `C5;
                        12'd330: toneL = `C5;    12'd331: toneL = `C5;
                        12'd332: toneL = `C5;    12'd333: toneL = `C5;
                        12'd334: toneL = `C5;    12'd335: toneL = `C5;

                        12'd336: toneL = `C5;    12'd337: toneL = `C5;
                        12'd338: toneL = `C5;    12'd339: toneL = `C5;
                        12'd340: toneL = `C5;    12'd341: toneL = `C5;
                        12'd342: toneL = `C5;    12'd343: toneL = `C5;
                        12'd344: toneL = `G5;    12'd345: toneL = `G5;
                        12'd346: toneL = `G5;    12'd347: toneL = `G5;
                        12'd348: toneL = `G5;    12'd349: toneL = `G5;
                        12'd350: toneL = `G5;    12'd351: toneL = `G5;

                        12'd352: toneL = `G5;    12'd353: toneL = `G5;
                        12'd354: toneL = `G5;    12'd355: toneL = `G5;
                        12'd356: toneL = `G5;    12'd357: toneL = `G5;
                        12'd358: toneL = `G5;    12'd359: toneL = `G5;
                        12'd360: toneL = `G5;    12'd361: toneL = `G5;
                        12'd362: toneL = `G5;    12'd363: toneL = `G5;
                        12'd364: toneL = `G5;    12'd365: toneL = `G5;
                        12'd366: toneL = `G5;    12'd367: toneL = `G5;

                        12'd368: toneL = `G5;    12'd369: toneL = `G5;
                        12'd370: toneL = `G5;    12'd371: toneL = `G5;
                        12'd372: toneL = `G5;    12'd373: toneL = `G5;
                        12'd374: toneL = `G5;    12'd375: toneL = `G5;
                        12'd376: toneL = `G5;    12'd377: toneL = `G5;
                        12'd378: toneL = `G5;    12'd379: toneL = `G5;
                        12'd380: toneL = `G5;    12'd381: toneL = `G5;
                        12'd382: toneL = `G5;    12'd383: toneL = `G5;
                        // --- Measure 7 ---
                        12'd384: toneL = `sil;    12'd385: toneL = `sil;
                        12'd386: toneL = `sil;    12'd387: toneL = `sil;
                        12'd388: toneL = `sil;    12'd389: toneL = `sil;
                        12'd390: toneL = `sil;    12'd391: toneL = `sil;
                        12'd392: toneL = `sil;    12'd393: toneL = `sil;
                        12'd394: toneL = `sil;    12'd395: toneL = `sil;
                        12'd396: toneL = `sil;    12'd397: toneL = `sil;
                        12'd398: toneL = `sil;    12'd399: toneL = `sil;

                        12'd400: toneL = `F5;    12'd401: toneL = `F5;
                        12'd402: toneL = `F5;    12'd403: toneL = `F5;
                        12'd404: toneL = `F5;    12'd405: toneL = `F5;
                        12'd406: toneL = `F5;    12'd407: toneL = `sil;
                        12'd408: toneL = `F5;    12'd409: toneL = `F5;
                        12'd410: toneL = `F5;    12'd411: toneL = `F5;
                        12'd412: toneL = `F5;    12'd413: toneL = `F5;
                        12'd414: toneL = `F5;    12'd415: toneL = `F5;

                        12'd416: toneL = `D5;    12'd417: toneL = `D5;
                        12'd418: toneL = `D5;    12'd419: toneL = `D5;
                        12'd420: toneL = `D5;    12'd421: toneL = `D5;
                        12'd422: toneL = `D5;    12'd423: toneL = `D5;
                        12'd424: toneL = `B4b;    12'd425: toneL = `B4b;
                        12'd426: toneL = `B4b;    12'd427: toneL = `B4b;
                        12'd428: toneL = `B4b;    12'd429: toneL = `B4b;
                        12'd430: toneL = `B4b;    12'd431: toneL = `B4b;

                        12'd432: toneL = `B4b;    12'd433: toneL = `B4b;
                        12'd434: toneL = `B4b;    12'd435: toneL = `B4b;
                        12'd436: toneL = `B4b;    12'd437: toneL = `B4b;
                        12'd438: toneL = `B4b;    12'd439: toneL = `B4b;
                        12'd440: toneL = `G5;    12'd441: toneL = `G5;
                        12'd442: toneL = `G5;    12'd443: toneL = `G5;
                        12'd444: toneL = `G5;    12'd445: toneL = `G5;
                        12'd446: toneL = `G5;    12'd447: toneL = `G5;
                        // --- Measure 8 ---
                        12'd448: toneL = `G5;    12'd449: toneL = `G5;
                        12'd450: toneL = `G5;    12'd451: toneL = `G5;
                        12'd452: toneL = `G5;    12'd453: toneL = `G5;
                        12'd454: toneL = `G5;    12'd455: toneL = `G5;
                        12'd456: toneL = `G5;    12'd457: toneL = `G5;
                        12'd458: toneL = `G5;    12'd459: toneL = `G5;
                        12'd460: toneL = `G5;    12'd461: toneL = `G5;
                        12'd462: toneL = `G5;    12'd463: toneL = `G5;

                        12'd464: toneL = `G5;    12'd465: toneL = `G5;
                        12'd466: toneL = `G5;    12'd467: toneL = `G5;
                        12'd468: toneL = `G5;    12'd469: toneL = `G5;
                        12'd470: toneL = `G5;    12'd471: toneL = `G5;
                        12'd472: toneL = `G5;    12'd473: toneL = `G5;
                        12'd474: toneL = `G5;    12'd475: toneL = `G5;
                        12'd476: toneL = `G5;    12'd477: toneL = `G5;
                        12'd478: toneL = `G5;    12'd479: toneL = `G5;

                        12'd480: toneL = `G5;    12'd481: toneL = `G5;
                        12'd482: toneL = `G5;    12'd483: toneL = `G5;
                        12'd484: toneL = `G5;    12'd485: toneL = `G5;
                        12'd486: toneL = `G5;    12'd487: toneL = `G5;
                        12'd488: toneL = `G5;    12'd489: toneL = `G5;
                        12'd490: toneL = `G5;    12'd491: toneL = `G5;
                        12'd492: toneL = `G5;    12'd493: toneL = `G5;
                        12'd494: toneL = `G5;    12'd495: toneL = `G5;

                        12'd496: toneL = `G5;    12'd497: toneL = `G5;
                        12'd498: toneL = `G5;    12'd499: toneL = `G5;
                        12'd500: toneL = `G5;    12'd501: toneL = `G5;
                        12'd502: toneL = `G5;    12'd503: toneL = `G5;
                        12'd504: toneL = `G5;    12'd505: toneL = `G5;
                        12'd506: toneL = `G5;    12'd507: toneL = `G5;
                        12'd508: toneL = `G5;    12'd509: toneL = `G5;
                        12'd510: toneL = `G5;    12'd511: toneL = `G5;
                        // --- Measure 9 ---
                        12'd512 : toneL =`G5;    12'd513 : toneL =`G5;
                        12'd514 : toneL =`G5;    12'd515 : toneL =`G5;
                        12'd516 : toneL =`G5;    12'd517 : toneL =`G5;
                        12'd518 : toneL =`G5;    12'd519 : toneL =`G5;
                        12'd520 : toneL =`G5;    12'd521 : toneL =`G5;
                        12'd522 : toneL =`G5;    12'd523 : toneL =`G5;
                        12'd524 : toneL =`G5;    12'd525 : toneL =`G5;
                        12'd526 : toneL =`G5;    12'd527 : toneL =`G5;

                        12'd528 : toneL =`G5;    12'd529 : toneL =`G5;
                        12'd530 : toneL =`G5;    12'd531 : toneL =`G5;
                        12'd532 : toneL =`G5;    12'd533 : toneL =`G5;
                        12'd534 : toneL =`G5;    12'd535 : toneL =`G5;
                        12'd536 : toneL =`G5;    12'd537 : toneL =`G5;
                        12'd538 : toneL =`G5;    12'd539 : toneL =`G5;
                        12'd540 : toneL =`G5;    12'd541 : toneL =`G5;
                        12'd542 : toneL =`G5;    12'd543 : toneL =`G5;

                        12'd544 : toneL =`G5;    12'd545 : toneL =`G5;
                        12'd546 : toneL =`G5;    12'd547 : toneL =`G5;
                        12'd548 : toneL =`G5;    12'd549 : toneL =`G5;
                        12'd550 : toneL =`G5;    12'd551 : toneL =`G5;
                        12'd552 : toneL =`G5;    12'd553 : toneL =`G5;
                        12'd554 : toneL =`G5;    12'd555 : toneL =`G5;
                        12'd556 : toneL =`G5;    12'd557 : toneL =`G5;
                        12'd558 : toneL =`G5;    12'd559 : toneL =`G5;

                        12'd560 : toneL =`G5;    12'd561 : toneL =`G5;
                        12'd562 : toneL =`G5;    12'd563 : toneL =`G5;
                        12'd564 : toneL =`G5;    12'd565 : toneL =`G5;
                        12'd566 : toneL =`G5;    12'd567 : toneL =`G5;
                        12'd568 : toneL =`G5;    12'd569 : toneL =`G5;
                        12'd570 : toneL =`G5;    12'd571 : toneL =`G5;
                        12'd572 : toneL =`G5;    12'd573 : toneL =`G5;
                        12'd574 : toneL =`G5;    12'd575 : toneL =`G5;

                        // --- Measure 10 ---
                        12'd576 : toneL =`sil;    12'd577 : toneL =`sil;
                        12'd578 : toneL =`sil;    12'd579 : toneL =`sil;
                        12'd580 : toneL =`sil;    12'd581 : toneL =`sil;
                        12'd582 : toneL =`sil;    12'd583 : toneL =`sil;
                        12'd584 : toneL =`sil;    12'd585 : toneL =`sil;
                        12'd586 : toneL =`sil;    12'd587 : toneL =`sil;
                        12'd588 : toneL =`sil;    12'd589 : toneL =`sil;
                        12'd590 : toneL =`sil;    12'd591 : toneL =`sil;

                        12'd592 : toneL =`B5;    12'd593 : toneL =`B5;
                        12'd594 : toneL =`B5;    12'd595 : toneL =`B5;
                        12'd596 : toneL =`B5;    12'd597 : toneL =`B5;
                        12'd598 : toneL =`B5;    12'd599 : toneL =`B5;
                        12'd600 : toneL =`B5;    12'd601 : toneL =`B5;
                        12'd602 : toneL =`B5;    12'd603 : toneL =`B5;
                        12'd604 : toneL =`B5;    12'd605 : toneL =`B5;
                        12'd606 : toneL =`B5;    12'd607 : toneL =`B5;

                        12'd608 : toneL =`G5;    12'd609 : toneL =`G5;
                        12'd610 : toneL =`G5;    12'd611 : toneL =`G5;
                        12'd612 : toneL =`G5;    12'd613 : toneL =`G5;
                        12'd614 : toneL =`G5;    12'd615 : toneL =`G5;
                        12'd616 : toneL =`F5;    12'd617 : toneL =`F5;
                        12'd618 : toneL =`F5;    12'd619 : toneL =`F5;
                        12'd620 : toneL =`F5;    12'd621 : toneL =`F5;
                        12'd622 : toneL =`F5;    12'd623 : toneL =`F5;

                        12'd624 : toneL =`E5;    12'd625 : toneL =`E5;
                        12'd626 : toneL =`E5;    12'd627 : toneL =`E5;
                        12'd628 : toneL =`E5;    12'd629 : toneL =`E5;
                        12'd630 : toneL =`E5;    12'd631 : toneL =`E5;
                        12'd632 : toneL =`C5;    12'd633 : toneL =`C5;
                        12'd634 : toneL =`C5;    12'd635 : toneL =`C5;
                        12'd636 : toneL =`C5;    12'd637 : toneL =`C5;
                        12'd638 : toneL =`C5;    12'd639 : toneL =`C5;

                        // --- Measure 11 ---
                        12'd640 : toneL =`G4;    12'd641 : toneL =`G4;
                        12'd642 : toneL =`G4;    12'd643 : toneL =`G4;
                        12'd644 : toneL =`G4;    12'd645 : toneL =`G4;
                        12'd646 : toneL =`G4;    12'd647 : toneL =`G4;
                        12'd648 : toneL =`F4;    12'd649 : toneL =`F4;
                        12'd650 : toneL =`F4;    12'd651 : toneL =`F4;
                        12'd652 : toneL =`F4;    12'd653 : toneL =`F4;
                        12'd654 : toneL =`F4;    12'd655 : toneL =`F4;

                        12'd656 : toneL =`E4;    12'd657 : toneL =`E4;
                        12'd658 : toneL =`E4;    12'd659 : toneL =`E4;
                        12'd660 : toneL =`E4;    12'd661 : toneL =`E4;
                        12'd662 : toneL =`E4;    12'd663 : toneL =`E4;
                        12'd664 : toneL =`C4;    12'd665 : toneL =`C4;
                        12'd666 : toneL =`C4;    12'd667 : toneL =`C4;
                        12'd668 : toneL =`C4;    12'd669 : toneL =`C4;
                        12'd670 : toneL =`C4;    12'd671 : toneL =`C4;

                        12'd672 : toneL =`C4;    12'd673 : toneL =`C4;
                        12'd674 : toneL =`C4;    12'd675 : toneL =`C4;
                        12'd676 : toneL =`C4;    12'd677 : toneL =`C4;
                        12'd678 : toneL =`C4;    12'd679 : toneL =`C4;
                        12'd680 : toneL =`C4;    12'd681 : toneL =`C4;
                        12'd682 : toneL =`C4;    12'd683 : toneL =`C4;
                        12'd684 : toneL =`C4;    12'd685 : toneL =`C4;
                        12'd686 : toneL =`C4;    12'd687 : toneL =`C4;

                        12'd688 : toneL =`C4;    12'd689 : toneL =`C4;
                        12'd690 : toneL =`C4;    12'd691 : toneL =`C4;
                        12'd692 : toneL =`C4;    12'd693 : toneL =`C4;
                        12'd694 : toneL =`C4;    12'd695 : toneL =`C4;
                        12'd696 : toneL =`C4;    12'd697 : toneL =`C4;
                        12'd698 : toneL =`C4;    12'd699 : toneL =`C4;
                        12'd700 : toneL =`C4;    12'd701 : toneL =`C4;
                        12'd702 : toneL =`C4;    12'd703 : toneL =`C4;

                        // --- Measure 12 ---
                        12'd704 : toneL =`sil;    12'd705 : toneL =`sil;
                        12'd706 : toneL =`sil;    12'd707 : toneL =`sil;
                        12'd708 : toneL =`sil;    12'd709 : toneL =`sil;
                        12'd710 : toneL =`sil;    12'd711 : toneL =`sil;
                        12'd712 : toneL =`sil;    12'd713 : toneL =`sil;
                        12'd714 : toneL =`sil;    12'd715 : toneL =`sil;
                        12'd716 : toneL =`sil;    12'd717 : toneL =`sil;
                        12'd718 : toneL =`sil;    12'd719 : toneL =`sil;

                        12'd720 : toneL =`C6;    12'd721 : toneL =`C6;
                        12'd722 : toneL =`C6;    12'd723 : toneL =`C6;
                        12'd724 : toneL =`C6;    12'd725 : toneL =`C6;
                        12'd726 : toneL =`C6;    12'd727 : toneL =`C6;
                        12'd728 : toneL =`C6;    12'd729 : toneL =`C6;
                        12'd730 : toneL =`C6;    12'd731 : toneL =`C6;
                        12'd732 : toneL =`C6;    12'd733 : toneL =`C6;
                        12'd734 : toneL =`C6;    12'd735 : toneL =`C6;

                        12'd736 : toneL =`A5;    12'd737 : toneL =`A5;
                        12'd738 : toneL =`A5;    12'd739 : toneL =`A5;
                        12'd740 : toneL =`A5;    12'd741 : toneL =`A5;
                        12'd742 : toneL =`A5;    12'd743 : toneL =`A5;
                        12'd744 : toneL =`G5;    12'd745 : toneL =`G5;
                        12'd746 : toneL =`G5;    12'd747 : toneL =`G5;
                        12'd748 : toneL =`G5;    12'd749 : toneL =`G5;
                        12'd750 : toneL =`G5;    12'd751 : toneL =`G5;

                        12'd752 : toneL =`F5;    12'd753 : toneL =`F5;
                        12'd754 : toneL =`F5;    12'd755 : toneL =`F5;
                        12'd756 : toneL =`F5;    12'd757 : toneL =`F5;
                        12'd758 : toneL =`F5;    12'd759 : toneL =`F5;
                        12'd760 : toneL =`D5;    12'd761 : toneL =`D5;
                        12'd762 : toneL =`D5;    12'd763 : toneL =`D5;
                        12'd764 : toneL =`D5;    12'd765 : toneL =`D5;
                        12'd766 : toneL =`D5;    12'd767 : toneL =`D5;

                        // --- Measure 13 ---
                        12'd768 : toneL =`C5;    12'd769 : toneL =`C5;
                        12'd770 : toneL =`C5;    12'd771 : toneL =`C5;
                        12'd772 : toneL =`C5;    12'd773 : toneL =`C5;
                        12'd774 : toneL =`C5;    12'd775 : toneL =`C5;
                        12'd776 : toneL =`B4b;    12'd777 : toneL =`B4b;
                        12'd778 : toneL =`B4b;    12'd779 : toneL =`B4b;
                        12'd780 : toneL =`B4b;    12'd781 : toneL =`B4b;
                        12'd782 : toneL =`B4b;    12'd783 : toneL =`B4b;

                        12'd784 : toneL =`A4b;    12'd785 : toneL =`A4b;
                        12'd786 : toneL =`A4b;    12'd787 : toneL =`A4b;
                        12'd788 : toneL =`A4b;    12'd789 : toneL =`A4b;
                        12'd790 : toneL =`A4b;    12'd791 : toneL =`A4b;
                        12'd792 : toneL =`B4b;    12'd793 : toneL =`B4b;
                        12'd794 : toneL =`B4b;    12'd795 : toneL =`B4b;
                        12'd796 : toneL =`B4b;    12'd797 : toneL =`B4b;
                        12'd798 : toneL =`B4b;    12'd799 : toneL =`B4b;

                        12'd800 : toneL =`B4b;    12'd801 : toneL =`B4b;
                        12'd802 : toneL =`B4b;    12'd803 : toneL =`B4b;
                        12'd804 : toneL =`B4b;    12'd805 : toneL =`B4b;
                        12'd806 : toneL =`B4b;    12'd807 : toneL =`B4b;
                        12'd808 : toneL =`C5;    12'd809 : toneL =`C5;
                        12'd810 : toneL =`C5;    12'd811 : toneL =`C5;
                        12'd812 : toneL =`C5;    12'd813 : toneL =`C5;
                        12'd814 : toneL =`C5;    12'd815 : toneL =`C5;

                        12'd816 : toneL =`D5;    12'd817 : toneL =`D5;
                        12'd818 : toneL =`D5;    12'd819 : toneL =`D5;
                        12'd820 : toneL =`D5;    12'd821 : toneL =`D5;
                        12'd822 : toneL =`D5;    12'd823 : toneL =`D5;
                        12'd824 : toneL =`D5;    12'd825 : toneL =`D5;
                        12'd826 : toneL =`D5;    12'd827 : toneL =`D5;
                        12'd828 : toneL =`D5;    12'd829 : toneL =`D5;
                        12'd830 : toneL =`D5;    12'd831 : toneL =`D5;

                        // --- Measure 14 ---
                        12'd832 : toneL =`C5;    12'd833 : toneL =`C5;
                        12'd834 : toneL =`C5;    12'd835 : toneL =`C5;
                        12'd836 : toneL =`C5;    12'd837 : toneL =`C5;
                        12'd838 : toneL =`C5;    12'd839 : toneL =`C5;
                        12'd840 : toneL =`C5;    12'd841 : toneL =`C5;
                        12'd842 : toneL =`C5;    12'd843 : toneL =`C5;
                        12'd844 : toneL =`C5;    12'd845 : toneL =`C5;
                        12'd846 : toneL =`C5;    12'd847 : toneL =`C5;

                        12'd848 : toneL =`C5;    12'd849 : toneL =`C5;
                        12'd850 : toneL =`C5;    12'd851 : toneL =`C5;
                        12'd852 : toneL =`C5;    12'd853 : toneL =`C5;
                        12'd854 : toneL =`C5;    12'd855 : toneL =`C5;
                        12'd856 : toneL =`G5;    12'd857 : toneL =`G5;
                        12'd858 : toneL =`G5;    12'd859 : toneL =`G5;
                        12'd860 : toneL =`G5;    12'd861 : toneL =`G5;
                        12'd862 : toneL =`G5;    12'd863 : toneL =`G5;

                        12'd864 : toneL =`G5;    12'd865 : toneL =`G5;
                        12'd866 : toneL =`G5;    12'd867 : toneL =`G5;
                        12'd868 : toneL =`G5;    12'd869 : toneL =`G5;
                        12'd870 : toneL =`G5;    12'd871 : toneL =`G5;
                        12'd872 : toneL =`G5;    12'd873 : toneL =`G5;
                        12'd874 : toneL =`G5;    12'd875 : toneL =`G5;
                        12'd876 : toneL =`G5;    12'd877 : toneL =`G5;
                        12'd878 : toneL =`G5;    12'd879 : toneL =`G5;

                        12'd880 : toneL =`G5;    12'd881 : toneL =`G5;
                        12'd882 : toneL =`G5;    12'd883 : toneL =`G5;
                        12'd884 : toneL =`G5;    12'd885 : toneL =`G5;
                        12'd886 : toneL =`G5;    12'd887 : toneL =`G5;
                        12'd888 : toneL =`G5;    12'd889 : toneL =`G5;
                        12'd890 : toneL =`G5;    12'd891 : toneL =`G5;
                        12'd892 : toneL =`G5;    12'd893 : toneL =`G5;
                        12'd894 : toneL =`G5;    12'd895 : toneL =`G5;

                        // --- Measure 15 ---
                        12'd896 : toneL =`sil;    12'd897 : toneL =`sil;
                        12'd898 : toneL =`sil;    12'd899 : toneL =`sil;
                        12'd900 : toneL =`sil;    12'd901 : toneL =`sil;
                        12'd902 : toneL =`sil;    12'd903 : toneL =`sil;
                        12'd904 : toneL =`sil;    12'd905 : toneL =`sil;
                        12'd906 : toneL =`sil;    12'd907 : toneL =`sil;
                        12'd908 : toneL =`sil;    12'd909 : toneL =`sil;
                        12'd910 : toneL =`sil;    12'd911 : toneL =`sil;

                        12'd912 : toneL =`F5;    12'd913 : toneL =`F5;
                        12'd914 : toneL =`F5;    12'd915 : toneL =`F5;
                        12'd916 : toneL =`F5;    12'd917 : toneL =`F5;
                        12'd918 : toneL =`F5;    12'd919 : toneL =`sil;
                        12'd920 : toneL =`F5;    12'd921 : toneL =`F5;
                        12'd922 : toneL =`F5;    12'd923 : toneL =`F5;
                        12'd924 : toneL =`F5;    12'd925 : toneL =`F5;
                        12'd926 : toneL =`F5;    12'd927 : toneL =`F5;

                        12'd928 : toneL =`D5;    12'd929 : toneL =`D5;
                        12'd930 : toneL =`D5;    12'd931 : toneL =`D5;
                        12'd932 : toneL =`D5;    12'd933 : toneL =`D5;
                        12'd934 : toneL =`D5;    12'd935 : toneL =`D5;
                        12'd936 : toneL =`B4b;    12'd937 : toneL =`B4b;
                        12'd938 : toneL =`B4b;    12'd939 : toneL =`B4b;
                        12'd940 : toneL =`B4b;    12'd941 : toneL =`B4b;
                        12'd942 : toneL =`B4b;    12'd943 : toneL =`B4b;

                        12'd944 : toneL =`B4b;    12'd945 : toneL =`B4b;
                        12'd946 : toneL =`B4b;    12'd947 : toneL =`B4b;
                        12'd948 : toneL =`B4b;    12'd949 : toneL =`B4b;
                        12'd950 : toneL =`B4b;    12'd951 : toneL =`B4b;
                        12'd952 : toneL =`C5;    12'd953 : toneL =`C5;
                        12'd954 : toneL =`C5;    12'd955 : toneL =`C5;
                        12'd956 : toneL =`C5;    12'd957 : toneL =`C5;
                        12'd958 : toneL =`C5;    12'd959 : toneL =`C5;

                        // --- Measure 16 ---
                        12'd960 : toneL =`C5;    12'd961 : toneL =`C5;
                        12'd962 : toneL =`C5;    12'd963 : toneL =`C5;
                        12'd964 : toneL =`C5;    12'd965 : toneL =`C5;
                        12'd966 : toneL =`C5;    12'd967 : toneL =`C5;
                        12'd968 : toneL =`C5;    12'd969 : toneL =`C5;
                        12'd970 : toneL =`C5;    12'd971 : toneL =`C5;
                        12'd972 : toneL =`C5;    12'd973 : toneL =`C5;
                        12'd974 : toneL =`C5;    12'd975 : toneL =`C5;

                        12'd976 : toneL =`C5;   12'd977 : toneL =`C5;
                        12'd978 : toneL =`C5;   12'd979 : toneL =`C5;
                        12'd980 : toneL =`C5;   12'd981 : toneL =`C5;
                        12'd982 : toneL =`C5;   12'd983 : toneL =`C5;
                        12'd984 : toneL =`C5;   12'd985 : toneL =`C5;
                        12'd986 : toneL =`C5;   12'd987 : toneL =`C5;
                        12'd988 : toneL =`C5;   12'd989 : toneL =`C5;
                        12'd990 : toneL =`C5;   12'd991 : toneL =`C5;

                        12'd992 : toneL =`sil;    12'd993 : toneL =`sil;
                        12'd994 : toneL =`sil;    12'd995 : toneL =`sil;
                        12'd996 : toneL =`sil;    12'd997 : toneL =`sil;
                        12'd998 : toneL =`sil;    12'd999 : toneL =`sil;
                        // 12'd1000: toneL =`C5;    12'd1001: toneL =`C5;
                        // 12'd1002: toneL =`C5;    12'd1003: toneL =`C5;
                        // 12'd1004: toneL =`C5;    12'd1005: toneL =`C5;
                        // 12'd1006: toneL =`C5;    12'd1007: toneL =`sil;

                        // 12'd1008: toneL =`C5;    12'd1009: toneL =`C5;
                        // 12'd1010: toneL =`C5;    12'd1011: toneL =`C5;
                        // 12'd1012: toneL =`C5;    12'd1013: toneL =`C5;
                        // 12'd1014: toneL =`C5;    12'd1015: toneL =`C5;
                        // 12'd1016: toneL =`A4b;    12'd1017: toneL =`A4b;
                        // 12'd1018: toneL =`A4b;    12'd1019: toneL =`A4b;
                        // 12'd1020: toneL =`A4b;    12'd1021: toneL =`A4b;
                        // 12'd1022: toneL =`A4b;    12'd1023: toneL =`A4b;
                        default: toneL = `sil;
                    endcase
                end
                1:begin
                    case(ibeatNum)
                        // --- Measure 1 ---
                        12'd0   : toneL = `A2b;    12'd1   : toneL = `A2b;
                        12'd2   : toneL = `A2b;    12'd3   : toneL = `A2b;
                        12'd4   : toneL = `A2b;    12'd5   : toneL = `A2b;
                        12'd6   : toneL = `A2b;    12'd7   : toneL = `A2b;
                        12'd8   : toneL = `A2b;    12'd9   : toneL = `A2b;
                        12'd10  : toneL = `A2b;    12'd11  : toneL = `A2b;
                        12'd12  : toneL = `A2b;    12'd13  : toneL = `A2b;
                        12'd14  : toneL = `A2b;    12'd15  : toneL = `A2b;

                        12'd16  : toneL = `E3b;    12'd17  : toneL = `E3b;
                        12'd18  : toneL = `E3b;    12'd19  : toneL = `E3b;
                        12'd20  : toneL = `E3b;    12'd21  : toneL = `E3b;
                        12'd22  : toneL = `E3b;    12'd23  : toneL = `E3b;
                        12'd24  : toneL = `E3b;    12'd25  : toneL = `E3b;
                        12'd26  : toneL = `E3b;    12'd27  : toneL = `E3b;
                        12'd28  : toneL = `E3b;    12'd29  : toneL = `E3b;
                        12'd30  : toneL = `E3b;    12'd31  : toneL = `E3b;

                        12'd32  : toneL = `A3;    12'd33  : toneL = `A3;
                        12'd34  : toneL = `A3;    12'd35  : toneL = `A3;
                        12'd36  : toneL = `A3;    12'd37  : toneL = `A3;
                        12'd38  : toneL = `A3;    12'd39  : toneL = `A3;
                        12'd40  : toneL = `A3;    12'd41  : toneL = `A3;
                        12'd42  : toneL = `A3;    12'd43  : toneL = `A3;
                        12'd44  : toneL = `A3;    12'd45  : toneL = `A3;
                        12'd46  : toneL = `A3;    12'd47  : toneL = `A3;

                        12'd48  : toneL = `E3b;    12'd49  : toneL = `E3b;
                        12'd50  : toneL = `E3b;    12'd51  : toneL = `E3b;
                        12'd52  : toneL = `E3b;    12'd53  : toneL = `E3b;
                        12'd54  : toneL = `E3b;    12'd55  : toneL = `E3b;
                        12'd56  : toneL = `E3b;    12'd57  : toneL = `E3b;
                        12'd58  : toneL = `E3b;    12'd59  : toneL = `E3b;
                        12'd60  : toneL = `E3b;    12'd61  : toneL = `E3b;
                        12'd62  : toneL = `E3b;    12'd63  : toneL = `E3b;

                        // --- Measure 2 ---
                        12'd64  : toneL = `B2b;    12'd65  : toneL = `B2b;
                        12'd66  : toneL = `B2b;    12'd67  : toneL = `B2b;
                        12'd68  : toneL = `B2b;    12'd69  : toneL = `B2b;
                        12'd70  : toneL = `B2b;    12'd71  : toneL = `B2b;
                        12'd72  : toneL = `B2b;    12'd73  : toneL = `B2b;
                        12'd74  : toneL = `B2b;    12'd75  : toneL = `B2b;
                        12'd76  : toneL = `B2b;    12'd77  : toneL = `B2b;
                        12'd78  : toneL = `B2b;    12'd79  : toneL = `B2b;

                        12'd80  : toneL = `F3;    12'd81  : toneL = `F3;
                        12'd82  : toneL = `F3;    12'd83  : toneL = `F3;
                        12'd84  : toneL = `F3;    12'd85  : toneL = `F3;
                        12'd86  : toneL = `F3;    12'd87  : toneL = `F3;
                        12'd88  : toneL = `F3;    12'd89  : toneL = `F3;
                        12'd90  : toneL = `F3;    12'd91  : toneL = `F3;
                        12'd92  : toneL = `F3;    12'd93  : toneL = `F3;
                        12'd94  : toneL = `F3;    12'd95  : toneL = `F3;

                        12'd96  : toneL = `B3;    12'd97  : toneL = `B3;
                        12'd98  : toneL = `B3;    12'd99  : toneL = `B3;
                        12'd100 : toneL = `B3;    12'd101 : toneL = `B3;
                        12'd102 : toneL = `B3;    12'd103 : toneL = `B3;
                        12'd104 : toneL = `B3;    12'd105 : toneL = `B3;
                        12'd106 : toneL = `B3;    12'd107 : toneL = `B3;
                        12'd108 : toneL = `B3;    12'd109 : toneL = `B3;
                        12'd110 : toneL = `B3;    12'd111 : toneL = `B3;

                        12'd112 : toneL = `B3;    12'd113 : toneL = `B3;
                        12'd114 : toneL = `B3;    12'd115 : toneL = `B3;
                        12'd116 : toneL = `B3;    12'd117 : toneL = `B3;
                        12'd118 : toneL = `B3;    12'd119 : toneL = `B3;
                        12'd120 : toneL = `B3;    12'd121 : toneL = `B3;
                        12'd122 : toneL = `B3;    12'd123 : toneL = `B3;
                        12'd124 : toneL = `B3;    12'd125 : toneL = `B3;
                        12'd126 : toneL = `B3;    12'd127 : toneL = `B3;

                        // --- Measure 3 ---
                        12'd128 : toneL = `G2;    12'd129 : toneL = `G2;
                        12'd130 : toneL = `G2;    12'd131 : toneL = `G2;
                        12'd132 : toneL = `G2;    12'd133 : toneL = `G2;
                        12'd134 : toneL = `G2;    12'd135 : toneL = `G2;
                        12'd136 : toneL = `G2;    12'd137 : toneL = `G2;
                        12'd138 : toneL = `G2;    12'd139 : toneL = `G2;
                        12'd140 : toneL = `G2;    12'd141 : toneL = `G2;
                        12'd142 : toneL = `G2;    12'd143 : toneL = `G2;

                        12'd144 : toneL = `D3;    12'd145 : toneL = `D3;
                        12'd146 : toneL = `D3;    12'd147 : toneL = `D3;
                        12'd148 : toneL = `D3;    12'd149 : toneL = `D3;
                        12'd150 : toneL = `D3;    12'd151 : toneL = `D3;
                        12'd152 : toneL = `D3;    12'd153 : toneL = `D3;
                        12'd154 : toneL = `D3;    12'd155 : toneL = `D3;
                        12'd156 : toneL = `D3;    12'd157 : toneL = `D3;
                        12'd158 : toneL = `D3;    12'd159 : toneL = `D3;

                        12'd160 : toneL = `G3;    12'd161 : toneL = `G3;
                        12'd162 : toneL = `G3;    12'd163 : toneL = `G3;
                        12'd164 : toneL = `G3;    12'd165 : toneL = `G3;
                        12'd166 : toneL = `G3;    12'd167 : toneL = `G3;
                        12'd168 : toneL = `G3;    12'd169 : toneL = `G3;
                        12'd170 : toneL = `G3;    12'd171 : toneL = `G3;
                        12'd172 : toneL = `G3;    12'd173 : toneL = `G3;
                        12'd174 : toneL = `G3;    12'd175 : toneL = `G3;

                        12'd176 : toneL = `G3;    12'd177 : toneL = `G3;
                        12'd178 : toneL = `G3;    12'd179 : toneL = `G3;
                        12'd180 : toneL = `G3;    12'd181 : toneL = `G3;
                        12'd182 : toneL = `G3;    12'd183 : toneL = `G3;
                        12'd184 : toneL = `G3;    12'd185 : toneL = `G3;
                        12'd186 : toneL = `G3;    12'd187 : toneL = `G3;
                        12'd188 : toneL = `G3;    12'd189 : toneL = `G3;
                        12'd190 : toneL = `G3;    12'd191 : toneL = `G3;

                        // --- Measure 4 ---
                        12'd192 : toneL = `C2;    12'd193 : toneL = `C2;
                        12'd194 : toneL = `C2;    12'd195 : toneL = `C2;
                        12'd196 : toneL = `C2;    12'd197 : toneL = `C2;
                        12'd198 : toneL = `C2;    12'd199 : toneL = `C2;
                        12'd200 : toneL = `C2;    12'd201 : toneL = `C2;
                        12'd202 : toneL = `C2;    12'd203 : toneL = `C2;
                        12'd204 : toneL = `C2;    12'd205 : toneL = `C2;
                        12'd206 : toneL = `C2;    12'd207 : toneL = `C2;

                        12'd208 : toneL = `G2;    12'd209 : toneL = `G2;
                        12'd210 : toneL = `G2;    12'd211 : toneL = `G2;
                        12'd212 : toneL = `G2;    12'd213 : toneL = `G2;
                        12'd214 : toneL = `G2;    12'd215 : toneL = `G2;
                        12'd216 : toneL = `G2;    12'd217 : toneL = `G2;
                        12'd218 : toneL = `G2;    12'd219 : toneL = `G2;
                        12'd220 : toneL = `G2;    12'd221 : toneL = `G2;
                        12'd222 : toneL = `G2;    12'd223 : toneL = `G2;

                        12'd224 : toneL = `C3;    12'd225 : toneL = `C3;
                        12'd226 : toneL = `C3;    12'd227 : toneL = `C3;
                        12'd228 : toneL = `C3;    12'd229 : toneL = `C3;
                        12'd230 : toneL = `C3;    12'd231 : toneL = `C3;
                        12'd232 : toneL = `C3;    12'd233 : toneL = `C3;
                        12'd234 : toneL = `C3;    12'd235 : toneL = `C3;
                        12'd236 : toneL = `C3;    12'd237 : toneL = `C3;
                        12'd238 : toneL = `C3;    12'd239 : toneL = `C3;

                        12'd240 : toneL = `C3;    12'd241 : toneL = `C3;
                        12'd242 : toneL = `C3;    12'd243 : toneL = `C3;
                        12'd244 : toneL = `C3;    12'd245 : toneL = `C3;
                        12'd246 : toneL = `C3;    12'd247 : toneL = `C3;
                        12'd248 : toneL = `C3;    12'd249 : toneL = `C3;
                        12'd250 : toneL = `C3;    12'd251 : toneL = `C3;
                        12'd252 : toneL = `C3;    12'd253 : toneL = `C3;
                        12'd254 : toneL = `C3;    12'd255 : toneL = `C3;

                        // --- Measure 5 ---
                        12'd256 : toneL = `A2b;    12'd257 : toneL = `A2b;
                        12'd258 : toneL = `A2b;    12'd259 : toneL = `A2b;
                        12'd260 : toneL = `A2b;    12'd261 : toneL = `A2b;
                        12'd262 : toneL = `A2b;    12'd263 : toneL = `A2b;
                        12'd264 : toneL = `A2b;    12'd265 : toneL = `A2b;
                        12'd266 : toneL = `A2b;    12'd267 : toneL = `A2b;
                        12'd268 : toneL = `A2b;    12'd269 : toneL = `A2b;
                        12'd270 : toneL = `A2b;    12'd271 : toneL = `A2b;

                        12'd272 : toneL = `E3b;    12'd273 : toneL = `E3b;
                        12'd274 : toneL = `E3b;    12'd275 : toneL = `E3b;
                        12'd276 : toneL = `E3b;    12'd277 : toneL = `E3b;
                        12'd278 : toneL = `E3b;    12'd279 : toneL = `E3b;
                        12'd280 : toneL = `E3b;    12'd281 : toneL = `E3b;
                        12'd282 : toneL = `E3b;    12'd283 : toneL = `E3b;
                        12'd284 : toneL = `E3b;    12'd285 : toneL = `E3b;
                        12'd286 : toneL = `E3b;    12'd287 : toneL = `E3b;

                        12'd288 : toneL = `A3;    12'd289 : toneL = `A3;
                        12'd290 : toneL = `A3;    12'd291 : toneL = `A3;
                        12'd292 : toneL = `A3;    12'd293 : toneL = `A3;
                        12'd294 : toneL = `A3;    12'd295 : toneL = `A3;
                        12'd296 : toneL = `A3;    12'd297 : toneL = `A3;
                        12'd298 : toneL = `A3;    12'd299 : toneL = `A3;
                        12'd300 : toneL = `A3;    12'd301 : toneL = `A3;
                        12'd302 : toneL = `A3;    12'd303 : toneL = `A3;

                        12'd304 : toneL = `A3;    12'd305 : toneL = `A3;
                        12'd306 : toneL = `A3;    12'd307 : toneL = `A3;
                        12'd308 : toneL = `A3;    12'd309 : toneL = `A3;
                        12'd310 : toneL = `A3;    12'd311 : toneL = `A3;
                        12'd312 : toneL = `A3;    12'd313 : toneL = `A3;
                        12'd314 : toneL = `A3;    12'd315 : toneL = `A3;
                        12'd316 : toneL = `A3;    12'd317 : toneL = `A3;
                        12'd318 : toneL = `A3;    12'd319 : toneL = `A3;

                        // --- Measure 6 ---
                        12'd320 : toneL = `B2b;    12'd321 : toneL = `B2b;
                        12'd322 : toneL = `B2b;    12'd323 : toneL = `B2b;
                        12'd324 : toneL = `B2b;    12'd325 : toneL = `B2b;
                        12'd326 : toneL = `B2b;    12'd327 : toneL = `B2b;
                        12'd328 : toneL = `B2b;    12'd329 : toneL = `B2b;
                        12'd330 : toneL = `B2b;    12'd331 : toneL = `B2b;
                        12'd332 : toneL = `B2b;    12'd333 : toneL = `B2b;
                        12'd334 : toneL = `B2b;    12'd335 : toneL = `B2b;

                        12'd336 : toneL = `F3;    12'd337 : toneL = `F3;
                        12'd338 : toneL = `F3;    12'd339 : toneL = `F3;
                        12'd340 : toneL = `F3;    12'd341 : toneL = `F3;
                        12'd342 : toneL = `F3;    12'd343 : toneL = `F3;
                        12'd344 : toneL = `F3;    12'd345 : toneL = `F3;
                        12'd346 : toneL = `F3;    12'd347 : toneL = `F3;
                        12'd348 : toneL = `F3;    12'd349 : toneL = `F3;
                        12'd350 : toneL = `F3;    12'd351 : toneL = `F3;

                        12'd352 : toneL = `B3;    12'd353 : toneL = `B3;
                        12'd354 : toneL = `B3;    12'd355 : toneL = `B3;
                        12'd356 : toneL = `B3;    12'd357 : toneL = `B3;
                        12'd358 : toneL = `B3;    12'd359 : toneL = `B3;
                        12'd360 : toneL = `B3;    12'd361 : toneL = `B3;
                        12'd362 : toneL = `B3;    12'd363 : toneL = `B3;
                        12'd364 : toneL = `B3;    12'd365 : toneL = `B3;
                        12'd366 : toneL = `B3;    12'd367 : toneL = `B3;

                        12'd368 : toneL = `B3;    12'd369 : toneL = `B3;
                        12'd370 : toneL = `B3;    12'd371 : toneL = `B3;
                        12'd372 : toneL = `B3;    12'd373 : toneL = `B3;
                        12'd374 : toneL = `B3;    12'd375 : toneL = `B3;
                        12'd376 : toneL = `B3;    12'd377 : toneL = `B3;
                        12'd378 : toneL = `B3;    12'd379 : toneL = `B3;
                        12'd380 : toneL = `B3;    12'd381 : toneL = `B3;
                        12'd382 : toneL = `B3;    12'd383 : toneL = `B3;

                        // --- Measure 7 ---
                        12'd384 : toneL = `E2;    12'd385 : toneL = `E2;
                        12'd386 : toneL = `E2;    12'd387 : toneL = `E2;
                        12'd388 : toneL = `E2;    12'd389 : toneL = `E2;
                        12'd390 : toneL = `E2;    12'd391 : toneL = `E2;
                        12'd392 : toneL = `E2;    12'd393 : toneL = `E2;
                        12'd394 : toneL = `E2;    12'd395 : toneL = `E2;
                        12'd396 : toneL = `E2;    12'd397 : toneL = `E2;
                        12'd398 : toneL = `E2;    12'd399 : toneL = `E2;

                        12'd400 : toneL = `B2b;    12'd401 : toneL = `B2b;
                        12'd402 : toneL = `B2b;    12'd403 : toneL = `B2b;
                        12'd404 : toneL = `B2b;    12'd405 : toneL = `B2b;
                        12'd406 : toneL = `B2b;    12'd407 : toneL = `B2b;
                        12'd408 : toneL = `B2b;    12'd409 : toneL = `B2b;
                        12'd410 : toneL = `B2b;    12'd411 : toneL = `B2b;
                        12'd412 : toneL = `B2b;    12'd413 : toneL = `B2b;
                        12'd414 : toneL = `B2b;    12'd415 : toneL = `B2b;

                        12'd416 : toneL = `E3b;    12'd417 : toneL = `E3b;
                        12'd418 : toneL = `E3b;    12'd419 : toneL = `E3b;
                        12'd420 : toneL = `E3b;    12'd421 : toneL = `E3b;
                        12'd422 : toneL = `E3b;    12'd423 : toneL = `E3b;
                        12'd424 : toneL = `E3b;    12'd425 : toneL = `E3b;
                        12'd426 : toneL = `E3b;    12'd427 : toneL = `E3b;
                        12'd428 : toneL = `E3b;    12'd429 : toneL = `E3b;
                        12'd430 : toneL = `E3b;    12'd431 : toneL = `E3b;

                        12'd432 : toneL = `G3;    12'd433 : toneL = `G3;
                        12'd434 : toneL = `G3;    12'd435 : toneL = `G3;
                        12'd436 : toneL = `G3;    12'd437 : toneL = `G3;
                        12'd438 : toneL = `G3;    12'd439 : toneL = `G3;
                        12'd440 : toneL = `G3;    12'd441 : toneL = `G3;
                        12'd442 : toneL = `G3;    12'd443 : toneL = `G3;
                        12'd444 : toneL = `G3;    12'd445 : toneL = `G3;
                        12'd446 : toneL = `G3;    12'd447 : toneL = `G3;
                        default: toneL = `sil;
                    endcase
                end
                2:begin
                    case(ibeatNum)
                    // --- Measure 1 ---
                        12'd0   : toneL = `sil;    12'd1   : toneL = `sil;
                        12'd2   : toneL = `sil;    12'd3   : toneL = `sil;
                        12'd4   : toneL = `sil;    12'd5   : toneL = `sil;
                        12'd6   : toneL = `sil;    12'd7   : toneL = `sil;
                        12'd8   : toneL = `sil;    12'd9   : toneL = `sil;
                        12'd10  : toneL = `sil;    12'd11  : toneL = `sil;
                        12'd12  : toneL = `sil;    12'd13  : toneL = `sil;
                        12'd14  : toneL = `sil;    12'd15  : toneL = `sil;

                        12'd16  : toneL = `sil;    12'd17  : toneL = `sil;
                        12'd18  : toneL = `sil;    12'd19  : toneL = `sil;
                        12'd20  : toneL = `sil;    12'd21  : toneL = `sil;
                        12'd22  : toneL = `sil;    12'd23  : toneL = `sil;
                        12'd24  : toneL = `C3;    12'd25  : toneL = `C3;  
                        12'd26  : toneL = `C3;    12'd27  : toneL = `C3;  
                        12'd28  : toneL = `C3;    12'd29  : toneL = `C3;  
                        12'd30  : toneL = `C3;    12'd31  : toneL = `C3;  

                        12'd32  : toneL = `C3;    12'd33  : toneL = `C3;  
                        12'd34  : toneL = `C3;    12'd35  : toneL = `C3;  
                        12'd36  : toneL = `C3;    12'd37  : toneL = `C3;
                        12'd38  : toneL = `C3;    12'd39  : toneL = `C3;
                        12'd40  : toneL = `G2;    12'd41  : toneL = `G2;
                        12'd42  : toneL = `G2;    12'd43  : toneL = `G2;
                        12'd44  : toneL = `G2;    12'd45  : toneL = `G2;
                        12'd46  : toneL = `G2;    12'd47  : toneL = `G2;

                        12'd48  : toneL = `G2;    12'd49  : toneL = `G2;
                        12'd50  : toneL = `G2;    12'd51  : toneL = `G2;
                        12'd52  : toneL = `G2;    12'd53  : toneL = `G2;
                        12'd54  : toneL = `G2;    12'd55  : toneL = `G2;
                        12'd56  : toneL = `C3;    12'd57  : toneL = `C3;
                        12'd58  : toneL = `C3;    12'd59  : toneL = `C3;
                        12'd60  : toneL = `C3;    12'd61  : toneL = `C3;
                        12'd62  : toneL = `C3;    12'd63  : toneL = `C3;

                        // --- Measure 2 ---
                        12'd64  : toneL = `C3;    12'd65  : toneL = `C3;
                        12'd66  : toneL = `C3;    12'd67  : toneL = `C3;
                        12'd68  : toneL = `C3;    12'd69  : toneL = `C3;
                        12'd70  : toneL = `C3;    12'd71  : toneL = `C3;
                        12'd72  : toneL = `G2;    12'd73  : toneL = `G2;
                        12'd74  : toneL = `G2;    12'd75  : toneL = `G2;
                        12'd76  : toneL = `G2;    12'd77  : toneL = `G2;
                        12'd78  : toneL = `G2;    12'd79  : toneL = `G2;

                        12'd80  : toneL = `G2;    12'd81  : toneL = `G2;
                        12'd82  : toneL = `G2;    12'd83  : toneL = `G2;
                        12'd84  : toneL = `G2;    12'd85  : toneL = `G2;
                        12'd86  : toneL = `G2;    12'd87  : toneL = `G2;
                        12'd88  : toneL = `D3;    12'd89  : toneL = `D3;
                        12'd90  : toneL = `D3;    12'd91  : toneL = `D3;
                        12'd92  : toneL = `D3;    12'd93  : toneL = `D3;
                        12'd94  : toneL = `D3;    12'd95  : toneL = `D3;

                        12'd96  : toneL = `D3;    12'd97  : toneL = `D3;
                        12'd98  : toneL = `D3;    12'd99  : toneL = `D3;
                        12'd100 : toneL = `D3;    12'd101 : toneL = `D3;
                        12'd102 : toneL = `D3;    12'd103 : toneL = `D3;
                        12'd104 : toneL = `G2;    12'd105 : toneL = `G2;
                        12'd106 : toneL = `G2;    12'd107 : toneL = `G2;
                        12'd108 : toneL = `G2;    12'd109 : toneL = `G2;
                        12'd110 : toneL = `G2;    12'd111 : toneL = `G2;

                        12'd112 : toneL = `G2;    12'd113 : toneL = `G2;
                        12'd114 : toneL = `G2;    12'd115 : toneL = `G2;
                        12'd116 : toneL = `G2;    12'd117 : toneL = `G2;
                        12'd118 : toneL = `G2;    12'd119 : toneL = `G2;
                        12'd120 : toneL = `D3;    12'd121 : toneL = `D3;
                        12'd122 : toneL = `D3;    12'd123 : toneL = `D3;
                        12'd124 : toneL = `D3;    12'd125 : toneL = `D3;
                        12'd126 : toneL = `D3;    12'd127 : toneL = `D3;

                        // --- Measure 3 ---
                        12'd128 : toneL = `D3;    12'd129 : toneL = `D3;
                        12'd130 : toneL = `D3;    12'd131 : toneL = `D3;
                        12'd132 : toneL = `D3;    12'd133 : toneL = `D3;
                        12'd134 : toneL = `D3;    12'd135 : toneL = `D3;
                        12'd136 : toneL = `G2;    12'd137 : toneL = `G2;
                        12'd138 : toneL = `G2;    12'd139 : toneL = `G2;
                        12'd140 : toneL = `G2;    12'd141 : toneL = `G2;
                        12'd142 : toneL = `G2;    12'd143 : toneL = `G2;

                        12'd144 : toneL = `G2;    12'd145 : toneL = `G2;
                        12'd146 : toneL = `G2;    12'd147 : toneL = `G2;
                        12'd148 : toneL = `G2;    12'd149 : toneL = `G2;
                        12'd150 : toneL = `G2;    12'd151 : toneL = `G2;
                        12'd152 : toneL = `F3;    12'd153 : toneL = `F3;
                        12'd154 : toneL = `F3;    12'd155 : toneL = `F3;
                        12'd156 : toneL = `F3;    12'd157 : toneL = `F3;
                        12'd158 : toneL = `F3;    12'd159 : toneL = `F3;

                        12'd160 : toneL = `F3;    12'd161 : toneL = `F3;
                        12'd162 : toneL = `F3;    12'd163 : toneL = `F3;
                        12'd164 : toneL = `F3;    12'd165 : toneL = `F3;
                        12'd166 : toneL = `F3;    12'd167 : toneL = `F3;
                        12'd168 : toneL = `C3;    12'd169 : toneL = `C3;
                        12'd170 : toneL = `C3;    12'd171 : toneL = `C3;
                        12'd172 : toneL = `C3;    12'd173 : toneL = `C3;
                        12'd174 : toneL = `C3;    12'd175 : toneL = `C3;

                        12'd176 : toneL = `C3;    12'd177 : toneL = `C3;
                        12'd178 : toneL = `C3;    12'd179 : toneL = `C3;
                        12'd180 : toneL = `C3;    12'd181 : toneL = `C3;
                        12'd182 : toneL = `C3;    12'd183 : toneL = `C3;
                        12'd184 : toneL = `F3;    12'd185 : toneL = `F3;
                        12'd186 : toneL = `F3;    12'd187 : toneL = `F3;
                        12'd188 : toneL = `F3;    12'd189 : toneL = `F3;
                        12'd190 : toneL = `F3;    12'd191 : toneL = `F3;

                        // --- Measure 4 ---
                        12'd192 : toneL = `F3;    12'd193 : toneL = `F3;
                        12'd194 : toneL = `F3;    12'd195 : toneL = `F3;
                        12'd196 : toneL = `F3;    12'd197 : toneL = `F3;
                        12'd198 : toneL = `F3;    12'd199 : toneL = `F3;
                        12'd200 : toneL = `C3;    12'd201 : toneL = `C3;
                        12'd202 : toneL = `C3;    12'd203 : toneL = `C3;
                        12'd204 : toneL = `C3;    12'd205 : toneL = `C3;
                        12'd206 : toneL = `C3;    12'd207 : toneL = `C3;

                        12'd208 : toneL = `C3;    12'd209 : toneL = `C3;
                        12'd210 : toneL = `C3;    12'd211 : toneL = `C3;
                        12'd212 : toneL = `C3;    12'd213 : toneL = `C3;
                        12'd214 : toneL = `C3;    12'd215 : toneL = `sil;
                        12'd216 : toneL = `C3;    12'd217 : toneL = `C3;
                        12'd218 : toneL = `C3;    12'd219 : toneL = `C3;
                        12'd220 : toneL = `C3;    12'd221 : toneL = `C3;
                        12'd222 : toneL = `C3;    12'd223 : toneL = `C3;

                        12'd224 : toneL = `C3;    12'd225 : toneL = `C3;
                        12'd226 : toneL = `C3;    12'd227 : toneL = `C3;
                        12'd228 : toneL = `C3;    12'd229 : toneL = `C3;
                        12'd230 : toneL = `C3;    12'd231 : toneL = `C3;
                        12'd232 : toneL = `C3;    12'd233 : toneL = `C3;
                        12'd234 : toneL = `C3;    12'd235 : toneL = `C3;
                        12'd236 : toneL = `C3;    12'd237 : toneL = `C3;
                        12'd238 : toneL = `C3;    12'd239 : toneL = `C3;

                        12'd240 : toneL = `C3;    12'd241 : toneL = `C3;
                        12'd242 : toneL = `C3;    12'd243 : toneL = `C3;
                        12'd244 : toneL = `C3;    12'd245 : toneL = `C3;
                        12'd246 : toneL = `C3;    12'd247 : toneL = `C3;
                        12'd248 : toneL = `C3;    12'd249 : toneL = `C3;
                        12'd250 : toneL = `C3;    12'd251 : toneL = `C3;
                        12'd252 : toneL = `C3;    12'd253 : toneL = `C3;
                        12'd254 : toneL = `C3;    12'd255 : toneL = `C3;

                        // --- Measure 5 ---
                        12'd256 : toneL = `C3;    12'd257 : toneL = `C3;
                        12'd258 : toneL = `C3;    12'd259 : toneL = `C3;
                        12'd260 : toneL = `C3;    12'd261 : toneL = `C3;
                        12'd262 : toneL = `C3;    12'd263 : toneL = `C3;
                        12'd264 : toneL = `C3;    12'd265 : toneL = `C3;
                        12'd266 : toneL = `C3;    12'd267 : toneL = `C3;
                        12'd268 : toneL = `C3;    12'd269 : toneL = `C3;
                        12'd270 : toneL = `C3;    12'd271 : toneL = `C3;
                        default: toneL = `sil;
                    endcase
                end
                3:begin
                    case(ibeatNum)
                    // --- Measure 1 ---
                        12'd0   : toneL = `D5;    12'd1   : toneL = `D5;
                        12'd2   : toneL = `D5;    12'd3   : toneL = `D5;
                        12'd4   : toneL = `D5;    12'd5   : toneL = `D5;
                        12'd6   : toneL = `D5;    12'd7   : toneL = `D5;
                        12'd8   : toneL = `D5;    12'd9   : toneL = `D5;
                        12'd10  : toneL = `D5;    12'd11  : toneL = `D5;
                        12'd12  : toneL = `E5;    12'd13  : toneL = `E5;
                        12'd14  : toneL = `E5;    12'd15  : toneL = `E5;

                        12'd16  : toneL = `E5;    12'd17  : toneL = `E5;
                        12'd18  : toneL = `E5;    12'd19  : toneL = `E5;
                        12'd20  : toneL = `C5;    12'd21  : toneL = `C5;
                        12'd22  : toneL = `C5;    12'd23  : toneL = `C5;
                        12'd24  : toneL = `C5;    12'd25  : toneL = `C5;
                        12'd26  : toneL = `C5;    12'd27  : toneL = `C5;
                        12'd28  : toneL = `C5;    12'd29  : toneL = `C5;
                        12'd30  : toneL = `C5;    12'd31  : toneL = `C5;

                        12'd32  : toneL = `E5;    12'd33  : toneL = `E5;
                        12'd34  : toneL = `E5;    12'd35  : toneL = `E5;
                        12'd36  : toneL = `E5;    12'd37  : toneL = `E5;
                        12'd38  : toneL = `E5;    12'd39  : toneL = `E5;
                        12'd40  : toneL = `B4;    12'd41  : toneL = `B4;
                        12'd42  : toneL = `B4;    12'd43  : toneL = `B4;
                        12'd44  : toneL = `B4;    12'd45  : toneL = `B4;
                        12'd46  : toneL = `B4;    12'd47  : toneL = `B4;

                        12'd48  : toneL = `B4;    12'd49  : toneL = `B4;
                        12'd50  : toneL = `B4;    12'd51  : toneL = `B4;
                        12'd52  : toneL = `E5;    12'd53  : toneL = `E5;
                        12'd54  : toneL = `E5;    12'd55  : toneL = `E5;
                        12'd56  : toneL = `E5;    12'd57  : toneL = `E5;
                        12'd58  : toneL = `E5;    12'd59  : toneL = `E5;
                        12'd60  : toneL = `A4;    12'd61  : toneL = `A4;
                        12'd62  : toneL = `A4;    12'd63  : toneL = `A4;

                        // --- Measure 2 ---
                        12'd64  : toneL = `A4;    12'd65  : toneL = `A4;
                        12'd66  : toneL = `A4;    12'd67  : toneL = `A4;
                        12'd68  : toneL = `A4;    12'd69  : toneL = `A4;
                        12'd70  : toneL = `A4;    12'd71  : toneL = `A4;
                        12'd72  : toneL = `E5;    12'd73  : toneL = `E5;
                        12'd74  : toneL = `E5;    12'd75  : toneL = `E5;
                        12'd76  : toneL = `E5;    12'd77  : toneL = `E5;
                        12'd78  : toneL = `E5;    12'd79  : toneL = `E5;

                        12'd80  : toneL = `D5;    12'd81  : toneL = `D5;
                        12'd82  : toneL = `D5;    12'd83  : toneL = `D5;
                        12'd84  : toneL = `D5;    12'd85  : toneL = `D5;
                        12'd86  : toneL = `D5;    12'd87  : toneL = `D5;
                        12'd88  : toneL = `D5;    12'd89  : toneL = `D5;
                        12'd90  : toneL = `D5;    12'd91  : toneL = `D5;
                        12'd92  : toneL = `E5;    12'd93  : toneL = `E5;
                        12'd94  : toneL = `E5;    12'd95  : toneL = `E5;

                        12'd96  : toneL = `E5;    12'd97  : toneL = `E5;
                        12'd98  : toneL = `E5;    12'd99  : toneL = `E5;
                        12'd100 : toneL = `C5;    12'd101 : toneL = `C5;
                        12'd102 : toneL = `C5;    12'd103 : toneL = `C5;
                        12'd104 : toneL = `C5;    12'd105 : toneL = `C5;
                        12'd106 : toneL = `C5;    12'd107 : toneL = `C5;
                        12'd108 : toneL = `C5;    12'd109 : toneL = `C5;
                        12'd110 : toneL = `C5;    12'd111 : toneL = `C5;

                        12'd112 : toneL = `E5;    12'd113 : toneL = `E5;
                        12'd114 : toneL = `E5;    12'd115 : toneL = `E5;
                        12'd116 : toneL = `E5;    12'd117 : toneL = `E5;
                        12'd118 : toneL = `E5;    12'd119 : toneL = `E5;
                        12'd120 : toneL = `B4;    12'd121 : toneL = `B4;
                        12'd122 : toneL = `B4;    12'd123 : toneL = `B4;
                        12'd124 : toneL = `B4;    12'd125 : toneL = `B4;
                        12'd126 : toneL = `B4;    12'd127 : toneL = `B4;

                        // --- Measure 3 ---
                        12'd128 : toneL = `B4;    12'd129 : toneL = `B4;
                        12'd130 : toneL = `B4;    12'd131 : toneL = `B4;
                        12'd132 : toneL = `E5;    12'd133 : toneL = `E5;
                        12'd134 : toneL = `E5;    12'd135 : toneL = `E5;
                        12'd136 : toneL = `E5;    12'd137 : toneL = `E5;
                        12'd138 : toneL = `E5;    12'd139 : toneL = `E5;
                        12'd140 : toneL = `A4;    12'd141 : toneL = `A4;
                        12'd142 : toneL = `A4;    12'd143 : toneL = `A4;

                        12'd144 : toneL = `A4;    12'd145 : toneL = `A4;
                        12'd146 : toneL = `A4;    12'd147 : toneL = `A4;
                        12'd148 : toneL = `A4;    12'd149 : toneL = `A4;
                        12'd150 : toneL = `A4;    12'd151 : toneL = `A4;
                        12'd152 : toneL = `A4;    12'd153 : toneL = `A4;
                        12'd154 : toneL = `A4;    12'd155 : toneL = `A4;
                        default: toneL = `sil;
                    endcase
                end
                default:begin
                    toneL = `sil;
                end
            endcase
        end
        else begin
            toneL = `sil;
        end
    end

endmodule