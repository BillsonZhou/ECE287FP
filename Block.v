`include "Setting.v"

module Block(vga_clk,sys_rst_n,key,body_x,body_y,s,guiwei);

input vga_clk,sys_rst_n;
input[1:0]key;
input s;
input guiwei;
output reg[9:0]body_x;
output reg[9:0]body_y;

parameter x_initial=22'd55;
localparam color =24'b11111111_11111111_11111111;

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
	end
	else if(guiwei)begin
		body_y<=22'd200;
	end
	else if(move_en) begin
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
	end 
end

endmodule