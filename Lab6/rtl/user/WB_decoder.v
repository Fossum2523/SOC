`default_nettype wire
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
    output [31:0] wbs_dat_o,
    
    /////////////////////////////// new ///////////////////////////////
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,
    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,
    output [2:0] user_irq
    /////////////////////////////// new ///////////////////////////////
);

wire exmem_ack_o;
wire WU_ack_o;

wire [31:0]exmem_data_o;
wire [31:0]WU_data_o;
wire [`MPRJ_IO_PADS-1:0] io_out_exmem;
wire [`MPRJ_IO_PADS-1:0] io_out_uart;
wire [`MPRJ_IO_PADS-1:0] io_oeb_exmem;
wire [`MPRJ_IO_PADS-1:0] io_oeb_uart;


assign wbs_ack_o = (wbs_adr_i[31:24]==8'h30) ? WU_ack_o :
                   (wbs_adr_i[31:24]==8'h38) ? exmem_ack_o : 1'b0;
assign wbs_dat_o = (wbs_adr_i[31:24]==8'h30) ? WU_data_o :
                   (wbs_adr_i[31:24]==8'h38) ? exmem_data_o : 32'b0;
                   
/*assign io_out =    (wbs_adr_i[31:24]==8'h30) ? io_out_uart :
                   (wbs_adr_i[31:24]==8'h38) ? io_out_exmem : 'b0;
                   
assign io_oeb =    (wbs_adr_i[31:24]==8'h30) ? io_oeb_uart :
                   (wbs_adr_i[31:24]==8'h38) ? io_oeb_exmem : 'b0;*/


assign en_WU    =  wbs_adr_i[31:24] == 8'h30;
assign en_exmem =  wbs_adr_i[31:24] == 8'h38;

/*exmem exmem1(   .wbs_clk_i(wbs_clk_i),
                .wbs_rst_i(wbs_rst_i),
                .wbs_stb_i(wbs_stb_i), //& en_exmem
                .wbs_cyc_i(wbs_cyc_i), //& en_exmem
                .wbs_we_i(wbs_we_i),
                .wbs_sel_i(wbs_sel_i),
                .wbs_dat_i(wbs_dat_i),
                .wbs_adr_i(wbs_adr_i),
                .wbs_ack_o(exmem_ack_o),
                .wbs_dat_o(exmem_data_o)
);*/


user_proj_example mprj (
    .wb_clk_i(wbs_clk_i),
    .wb_rst_i(wbs_rst_i),
    // MGMT SoC Wishbone Slave
    .wbs_cyc_i(wbs_cyc_i), // en_exmem
    .wbs_stb_i(wbs_stb_i), // en_exmem
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(exmem_ack_o),
    .wbs_dat_o(exmem_data_o),
    // Logic Analyzer
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),
    // IO Pads
    .io_in (),
    .io_out(),
    .io_oeb(),
    // IRQ
    .irq()
);


uart uart (
    .wb_clk_i(wbs_clk_i),
    .wb_rst_i(wbs_rst_i),
    // MGMT SoC Wishbone Slave
    .wbs_stb_i(wbs_stb_i), // ns & en_WU
    .wbs_cyc_i(wbs_cyc_i), // ns & en_WU
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(WU_ack_o),
    .wbs_dat_o(WU_data_o),
    // IO ports
    .io_in  (io_in),
    .io_out (io_out),
    .io_oeb (io_oeb),
    // irq
    .user_irq (user_irq)
);


/*uart uart (
    .wb_clk_i(wbs_clk_i),
    .wb_rst_i(wbs_rst_i),
    // MGMT SoC Wishbone Slave
    .wbs_stb_i(wbs_stb_i), // ns & en_WU
    .wbs_cyc_i(wbs_cyc_i), // ns & en_WU
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(WU_ack_o),
    .wbs_dat_o(WU_data_o),
    // IO ports
    .io_in  (io_in),
    .io_out (io_out),
    .io_oeb (io_oeb),
    // irq
    .user_irq (user_irq)
);*/

          



endmodule

`default_nettype wire
