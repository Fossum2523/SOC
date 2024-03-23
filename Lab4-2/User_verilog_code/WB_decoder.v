module WB_decoder(
    // Wishbone Slave ports (WB MI A)
    input wbs_clk_i,
    input wbs_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    //input wbs_ack_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o
);

wire exmem_ack_o;
wire WA_ack_o;

wire [31:0]exmem_data_o;
wire [31:0]WA_data_o;
//wire en_WA1;

exmem exmem1(   .wbs_clk_i(wbs_clk_i),
                .wbs_rst_i(wbs_rst_i),
                .wbs_stb_i(wbs_stb_i),
                .wbs_cyc_i(wbs_cyc_i),
                .wbs_we_i(wbs_we_i),
                .wbs_sel_i(wbs_sel_i),
                .wbs_dat_i(wbs_dat_i),
                .wbs_adr_i(wbs_adr_i),
                .wbs_ack_o(exmem_ack_o),
                .wbs_dat_o(exmem_data_o)
);

WB_2_AXI WA1(   .wbs_clk_i(wbs_clk_i),
                .wbs_rst_i(wbs_rst_i),
                .wbs_stb_i(wbs_stb_i),
                .wbs_cyc_i(wbs_cyc_i),
                .wbs_we_i(wbs_we_i),
                .wbs_sel_i(wbs_sel_i),
                .wbs_dat_i(wbs_dat_i),
                .wbs_adr_i(wbs_adr_i), 
                .wbs_ack_o(WA_ack_o),
                .wbs_dat_o(WA_data_o)
                //.en(en_WA1)
);


assign wbs_ack_o = (wbs_adr_i[31:24]==8'h30) ? WA_ack_o :
                   (wbs_adr_i[31:24]==8'h38) ? exmem_ack_o : 1'b0;
assign wbs_dat_o = (wbs_adr_i[31:24]==8'h30) ? WA_data_o :
                   (wbs_adr_i[31:24]==8'h38) ? exmem_data_o : 1'b0;
                   
//assign en_WA1    =  wbs_adr_i[31:24]==8'h30;


endmodule

`default_nettype wire
