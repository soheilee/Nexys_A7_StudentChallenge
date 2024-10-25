//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Fri Oct 25 13:06:41 2024
//Host        : simtool5-3 running 64-bit Ubuntu 20.04.5 LTS
//Command     : generate_target top_level_wrapper.bd
//Design      : top_level_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_level_wrapper
   (CLK100MHZ,
    CPU_RESETN,
    UART_rxd,
    UART_txd);
  input CLK100MHZ;
  input CPU_RESETN;
  input UART_rxd;
  output UART_txd;

  wire CLK100MHZ;
  wire CPU_RESETN;
  wire UART_rxd;
  wire UART_txd;

  top_level top_level_i
       (.CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
