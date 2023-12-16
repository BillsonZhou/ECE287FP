`include "Setting.v"

module TrackingBlock(vga_clk,sys_rst_n,key,body_x,body_y,s,guiwei,ai_switch,ballbody_x,ballbody_y);

input vga_clk,sys_rst_n;
input[1:0]key;
input s;
input guiwei;
input ai_switch;
input [9:0]	ballbody_x,ballbody_y;
output reg[9:0]body_x;
output reg[9:0]body_y;
reg		[9:0]	pad_center,ball_center;
parameter x_initial=22'd55;

reg[21:0]div_cnt;
reg y_direct;

wire[21:0]speed;
assign speed=s?22'd80000:22'd190000;

wire move_en;
assign move_en=(div_cnt==speed-1'b1)? 1'b1:1'b0;

always@(posedge vga_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
		div_cnt<=22'd0;
	else begin
		if(div_cnt<speed-1'b1)
			div_cnt<=div_cnt+1'b1;
		else
			div_cnt<=22'd0;
	end
end

always@(posedge vga_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		body_x<=x_initial;
		body_y<=22'd200; 
	end else if(guiwei)begin
		body_y<=22'd200; 
	end else if(move_en) begin
	// Tracking part
	   if (!ai_switch) begin 
		  if (key[0]==0 && key[1]==1)
			  if(body_y>=`V_DISP-`SLDE_W-`body_l)
			  body_y<=body_y;
			  else
			  body_y<=body_y+2;
			  else if (key[0]==1 && key[1]==0)
			  if(body_y<=`SLDE_W)
			  body_y<=body_y;
			  else
			  body_y<=body_y-2;
	    end else begin
            if (ballbody_x < `H_DISP/2-`BALL_W && move_en) begin
                  ball_center <= ballbody_y + `BALL_W/2;
                  pad_center <= body_y +40;
                  if (ball_center < pad_center)  begin
                        if (body_y <= `SLDE_W)
                            body_y = body_y;
								else
									 body_y = body_y - 2; 
                  end else if (ball_center > pad_center) begin
                        if (body_y >= `V_DISP-`SLDE_W-`body_l)
                            body_y = body_y;
								else
									 body_y = body_y + 2;
                  end else
                        body_y = body_y; 
            end else begin
               body_y = body_y;
				end
       end
	 end
end

endmodule
