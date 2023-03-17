module player_control (
	input clk, 
	input reset, 
	// input _play, 
	input [2:0] _music,
	input [11:0] len,
	output [11:0] ibeat
);
	reg [11:0] ibeat1,b1nxt;
	reg [11:0] ibeat2,b2nxt;
	reg [11:0] ibeat3,b3nxt;
	reg [11:0] ibeat4,b4nxt;
	assign ibeat=(_music==0)?ibeat1:
	(_music==1)?ibeat2:
	(_music==2)?ibeat3:
	ibeat4;

    // always @* begin
    //     if(_music)begin
	// 		b1nxt = (_play)?(ibeat1 + 1 < LEN)? (ibeat1 + 1) : 0:ibeat1;
	// 		b2nxt=0;
	// 	end
	// 	else begin
	// 		b1nxt=0;
	// 		b2nxt = (_play)?(ibeat2 + 1 < LEN)? (ibeat2 + 1) : 0:ibeat2;
	// 	end
    // end
	always @(posedge clk or posedge reset) begin
		if(reset)begin
			ibeat1<=0;
			ibeat2<=0;
			ibeat3<=0;
			ibeat4<=0;
		end
		else begin
			ibeat1<=b1nxt;
			ibeat2<=b2nxt;
			ibeat3<=b3nxt;
			ibeat4<=b4nxt;
		end
	end
    always @(*) begin
		if(reset)begin
			b1nxt=0;
			b2nxt=0;
			b3nxt=0;
			b4nxt=0;
		end
		else begin
			case(_music)
				0:begin
					b1nxt =(ibeat1 < len)? (ibeat1 + 1) : 1100;
					b2nxt=0;
					b3nxt=0;
					b4nxt=0;
				end
				1:begin
					b1nxt=0;
					b2nxt =(ibeat2 < len)? (ibeat2 + 1) : 1100;
					b3nxt=0;
					b4nxt=0;
				end
				2:begin
					b1nxt=0;
					b2nxt=0;
					b3nxt =(ibeat3 < len)? (ibeat3 + 1) : 1100;
					b4nxt=0;
				end
				3:begin
					b1nxt=0;
					b2nxt=0;
					b3nxt=0;
					b4nxt=(ibeat4 < len)? (ibeat4 + 1) : 1100;
				end
				default:begin
					b1nxt=0;
					b2nxt=0;
					b3nxt=0;
					b4nxt=0;
				end
			endcase
		end
    end
	

endmodule
