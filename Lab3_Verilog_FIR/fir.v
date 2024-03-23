module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    output  reg                     awready,//AW
    input   wire                     awvalid,//AW
    input   wire [(pADDR_WIDTH-1):0] awaddr,//AW

    output  reg                     wready,//W
    input   wire                     wvalid,//W
    input   wire [(pDATA_WIDTH-1):0] wdata,//W

    output  wire                     arready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,

    input   wire                     rready,
    output  reg                     rvalid,
    output  wire [(pDATA_WIDTH-1):0] rdata, 

    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
    output  reg                     ss_tready,

    input   wire                     sm_tready, 
    output  reg                     sm_tvalid, 
    output  reg [(pDATA_WIDTH-1):0] sm_tdata, 
    output  reg                     sm_tlast, 
    
    // bram for tap RAM
    output  reg [3:0]               tap_WE,
    output  reg                     tap_EN,
    output  reg [(pDATA_WIDTH-1):0] tap_Di,
    output  reg [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    output  reg [3:0]               data_WE,
    output  reg                     data_EN,
    output  reg [(pDATA_WIDTH-1):0] data_Di,
    output  reg [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);

reg [3:0]addr_data;//
reg [3:0]addr_coef;//
reg addr_10_fg;//
reg [1:0]AW_state;
reg [2:0]ap_state;
reg [1:0]AR_state;
reg [1:0]SS_curr_state;
reg [1:0]SS_next_state;
reg sm_trans_done;//
reg [(pDATA_WIDTH-1):0] data_len;
reg coef_get;//
reg [3:0]addr_pointer;//
reg signed [31:0]acc_temp;//nomral sure be 64bit
reg D_bram_ready;
reg [3:0]D_bram_ready_counter;

wire [31:0]a;
wire [31:0]b;
wire [31:0]adder;

parameter [1:0] SS_idle = 2'b00,
                RD_data = 2'b01,
                WT_conv = 2'b10,
                OV_conv = 2'b11;
parameter [1:0] AR_idle = 2'b00,
                TS_tap  = 2'b01,
                TS_ap = 2'b10;
parameter [1:0] AW_idle		= 2'b00,
				ap_ctrl     = 2'b01,
                RD_data_len = 2'b10,
                RD_tap      = 2'b11;
parameter [3:0] addr_0  = 4'd0,
                addr_1  = 4'd1,
                addr_2  = 4'd2,
                addr_3  = 4'd3,
                addr_4  = 4'd4,
                addr_5  = 4'd5,
                addr_6  = 4'd6,
                addr_7  = 4'd7,
                addr_8  = 4'd8,
                addr_9  = 4'd9,
                addr_10 = 4'd10;
					 
assign a =  ((SS_curr_state == SS_idle && ap_state == 3'b000 && D_bram_ready == 1'b0)) ? D_bram_ready_counter :
            (SS_curr_state == RD_data) ? addr_pointer :
            (SS_curr_state == OV_conv) ? acc_temp : 32'd0;
assign b =  ((SS_curr_state == SS_idle && ap_state == 3'b000 && D_bram_ready == 1'b0)) ? 1'b1 :
            (SS_curr_state == RD_data) ? 1'b1 :
            (SS_curr_state == OV_conv) ? $signed(tap_Do) * $signed(data_Do) : 32'd0;				
assign adder =  a + b;              
assign rdata =  AR_state == TS_ap ? {29'd0,ap_state} :
				AR_state == TS_tap ? tap_Do : 32'd0;

//conv addr_contorl str------------------------------------------
always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)begin
        addr_data <= 4'd0;
        addr_coef <= 4'd0;
        addr_10_fg<=1'b0;
    end
	 else if (SS_curr_state == RD_data) addr_10_fg<=1'b0;
    else if (SS_curr_state == WT_conv) begin
        addr_data <= addr_pointer;
        addr_coef <= addr_10;
        addr_10_fg<=1'b0;
    end
    else if (SS_curr_state == OV_conv) begin
        case (addr_data)
            addr_0: addr_data<=addr_1;
            addr_1: addr_data<=addr_2;
            addr_2: addr_data<=addr_3;
            addr_3: addr_data<=addr_4;
            addr_4: addr_data<=addr_5;
            addr_5: addr_data<=addr_6;
            addr_6: addr_data<=addr_7;
            addr_7: addr_data<=addr_8;
            addr_8: addr_data<=addr_9;
            addr_9: addr_data<=addr_10;
            addr_10:addr_data<=addr_0; 
        endcase
        case (addr_coef)
            addr_10:addr_coef<=addr_9;
            addr_9: addr_coef<=addr_8;
            addr_8: addr_coef<=addr_7;
            addr_7: addr_coef<=addr_6;
            addr_6: addr_coef<=addr_5;
            addr_5: addr_coef<=addr_4;
            addr_4: addr_coef<=addr_3;
            addr_3: addr_coef<=addr_2;
            addr_2: addr_coef<=addr_1;
            addr_1: addr_coef<=addr_0;
            addr_0: addr_10_fg<=1'b1; 
        endcase
    end
end
//conv addr_contorl end------------------------------------------

//AW contorol str-----------------------------------------------
always@(*)begin
    wready = 1'b0;
    awready = 1'b0;
	 AW_state = AW_idle;
    if(awvalid && wvalid)begin
        casex (awaddr)
            12'h000:begin
                AW_state = ap_ctrl;
                wready = 1'b1;
                awready = 1'b1;
            end
            12'h010:begin
                AW_state = RD_data_len;
                wready = 1'b1;
                awready = 1'b1;
            end
            12'b0000_1xxx_xxxx:begin
                AW_state = RD_tap;
                wready = 1'b1;
                awready = 1'b1;
            end
				default: begin
                AW_state = AW_idle;
                wready = 1'b0;
                awready = 1'b0;
				end
        endcase
    end
end
//AW contorol end-----------------------------------------------

//ap_state str--------------------------------------------------
//bit[2]=>idle bit[1]=>done bit[0]=>start
always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)ap_state <= 3'b100;
	else if(sm_tlast && sm_tvalid)ap_state <= 3'b010;
	else if(ap_state == 3'b010 && rvalid)ap_state <= 3'b100;
    else if(wdata==12'h001 && AW_state == ap_ctrl)ap_state <= 3'b000;
end
//ap_state end--------------------------------------------------

//AR contorol str-----------------------------------------------
assign arready = 1'b0;

always@(*)begin
	AR_state = AR_idle;
	casex (araddr)
			12'h000:if(arvalid && rready)AR_state = TS_ap;
			12'b0000_1xxx_xxxx:if(arvalid && rready)AR_state = TS_tap;
		default:AR_state = AR_idle;
	endcase
end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)rvalid <= 1'b0;
    else if(AR_state == TS_tap)rvalid <= 1'b1;
	else if(AR_state == TS_ap)rvalid <= 1'b1;
	else rvalid <= 1'b0;
end
//AR contorol end-----------------------------------------------

//SS contorol str-----------------------------------------------
always @(negedge  axis_rst_n or posedge axis_clk) begin
    if(!axis_rst_n)SS_curr_state <= SS_idle;
    else SS_curr_state <= SS_next_state;
end

always@(*)begin
	SS_next_state = 2'd0;
    if(ss_tvalid)begin
        casex (SS_curr_state)
            SS_idle:begin
                if(D_bram_ready)SS_next_state = RD_data;
                else SS_next_state = SS_idle;
            end
            RD_data:begin
				if(sm_trans_done && sm_tlast)SS_next_state = SS_idle;
                else SS_next_state = WT_conv;
            end
            WT_conv:begin
                SS_next_state = OV_conv;
            end
            OV_conv:begin
                if(addr_10_fg == 1'b1)SS_next_state = RD_data;//
                else SS_next_state = OV_conv;
            end
        endcase
    end
end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)ss_tready <= 1'b0;
    else if(SS_curr_state == RD_data && !sm_tlast)ss_tready <= 1'b1;
	else ss_tready <= 1'b0;
end
//SS contorol end-----------------------------------------------

//SM contorol str-----------------------------------------------
always@(*)begin
	sm_tvalid = (addr_10_fg && sm_trans_done == 1'b0) ? 1'b1 : 1'b0;
	sm_tdata = (addr_10_fg && sm_trans_done == 1'b0) ? acc_temp : 32'd0;
 end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)sm_trans_done <= 1'b0;
    else if(addr_10_fg == 1'b1)sm_trans_done <= 1'b1;
	else sm_trans_done <= 1'b0;
end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)sm_tlast <= 1'b0;
    else if(ss_tlast && ss_tready)sm_tlast <= 1'b1;
	else if(ap_state == 3'b100)sm_tlast <= 1'b0;
end
//SM contorol end-----------------------------------------------

//data length str------------------------------------------------
always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)data_len <= 32'd0;
    else if(AW_state == RD_data_len)data_len <= wdata;
end
//data length end------------------------------------------------

//coef trans & check str-----------------------------------------
always@(*)begin
    tap_WE = (AW_state == RD_tap && coef_get == 1'b0) ? 4'b1111 : 4'b0000;
    tap_EN = (AW_state == RD_tap && coef_get == 1'b0) ? 1'b1 : 
             (AR_state == TS_tap) ? 1'b1 : 
              SS_curr_state == OV_conv? 1'b1: 1'b0;
    tap_Di = (AW_state == RD_tap && coef_get == 1'b0) ? wdata : 32'd0;
    tap_A =  (AW_state == RD_tap && coef_get == 1'b0) ? awaddr&12'h07F : 
             (AR_state == TS_tap) ? araddr&12'h07F : 
              SS_curr_state == OV_conv? {6'd0,addr_coef,2'd0} : 12'd0;
end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)coef_get <= 1'b0;
    else if (AW_state == RD_tap && coef_get == 1'b0)if((awaddr&12'h07F)==12'd40)coef_get <= 1'b1;
end
//coef trans & check end-----------------------------------------

//data trans & check str-----------------------------------------
always@(*)begin
    data_WE =   (SS_curr_state == SS_idle && ap_state == 3'b000) ? 4'b1111 :
                SS_curr_state == RD_data ? 4'b1111 : 4'b0000;
    data_EN =   (SS_curr_state == SS_idle && ap_state == 3'b000) ? 1'b1 :
                SS_curr_state == RD_data ? 1'b1 : 
                SS_curr_state == OV_conv? 1'b1 :1'b0;
    data_Di =   (SS_curr_state == SS_idle && ap_state == 3'b000) ? 32'd0 :
                SS_curr_state == RD_data ? ss_tdata : 32'd0;
    data_A =    (SS_curr_state == SS_idle && ap_state == 3'b000) ? D_bram_ready_counter<<2 :
                SS_curr_state == RD_data ? addr_pointer<<2 : 
                SS_curr_state == OV_conv? {6'd0,addr_data,2'd0} :12'd0;
end

always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)begin
		addr_pointer <= 4'd10;
        D_bram_ready <= 1'b0;
        D_bram_ready_counter <= 4'd0;
    end
    else if ((SS_curr_state == SS_idle && ap_state == 3'b000 && D_bram_ready == 1'b0))begin
        if(D_bram_ready_counter == 4'd10)begin
			addr_pointer <= 4'd10;
            D_bram_ready <= 1'b1;
            D_bram_ready_counter <= 4'd0;
        end
        else D_bram_ready_counter <= adder;//adder
    end
    else if (SS_curr_state == RD_data)begin
        if(addr_pointer == 4'd10)addr_pointer <= 4'd0;
        else addr_pointer <= adder;//adder
    end
    else D_bram_ready <= 1'b0;
end
//data trans & check end-----------------------------------------

//fir conv str---------------------------------------------------
always@(negedge  axis_rst_n or posedge axis_clk)begin
    if(!axis_rst_n)begin
        acc_temp <= 32'd0;
    end
    else if (SS_curr_state == OV_conv)acc_temp <= adder;
    else if(SS_curr_state == RD_data)acc_temp <= 32'd0;
end
//fir conv end---------------------------------------------------

endmodule
