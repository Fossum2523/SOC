module WB2UART (
	input ..
	output ..
);

	uart uart(
	  /*
	  input wire    wb_clk_i,
	  input wire    wb_rst_i,
	  input wire    wbs_stb_i,
	  input wire    wbs_cyc_i,
	  input wire    wbs_we_i,
	  input wire    [3:0] wbs_sel_i,
	  input wire    [31:0] wbs_dat_i,
	  input wire    [31:0] wbs_adr_i,
	  output wire   wbs_ack_o,
	  output wire   [31:0] wbs_dat_o,

	  // IO ports
	  input  [`MPRJ_IO_PADS-1:0] io_in, // The io_in[..] signals are from the pad to the user project and are always
										// active unless the pad has been configured with the "input disable" bit set.
	  output [`MPRJ_IO_PADS-1:0] io_out,// The io_out[..] signals are from the user project to the pad.
	  output [`MPRJ_IO_PADS-1:0] io_oeb,// The io_oeb[..] signals are from the user project to the pad cell.  This
										// controls the direction of the pad when in bidirectional mode.  When set to
										// value zero, the pad direction is output and the value of io_out[..] appears
										// on the pad.  When set to value one, the pad direction is input and the pad
										// output buffer is disabled.
	  // irq
	  output [2:0] user_irq
	  */
	  
	  .wb_clk_i(),
	  .wb_rst_i(),
	  .wbs_stb_i(),
	  .wbs_cyc_i(),
	  .wbs_we_i(),
	  .wbs_sel_i(),
	  .wbs_dat_i(),
	  .wbs_adr_i(),
	  .wbs_ack_o(),
	  .wbs_dat_o(),

	  .io_in(), 
										
	  .io_out(),
	  .io_oeb(),
										

	  // irq
	  .user_irq()
	);

endmodule
