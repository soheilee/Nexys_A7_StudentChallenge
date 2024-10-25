# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "top_level_smartconnect_0_0_synth_1" START { ROLLUP_AUTO }
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {Common 17-55}  -string {{CRITICAL WARNING: [Common 17-55] 'get_property' expects at least one object. [/fpga/sidewinder_qsfp/sidewinder.runs/impl_1/.Xil/Vivado-606069-simtool5-2/dbg_hub_CV.0/out/xsdbm_cc_late_late.xdc:9]
Resolution: If [get_<value>] was used to populate the object, check to make sure this command returns at least one valid object.}}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {DRC RTSTAT-10}  -string {{WARNING: [DRC RTSTAT-10] No routable loads: 26 net(s) have no routable loads. The problem bus(es) and/or net(s) are dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/aempty_fwft_i, dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg[2:0], dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD1/ctl_reg_en_2[1], dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg_en_2[1], dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_capture[0], dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_drck[0], dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_runtest[0], dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow, dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow, board_i/axi_chip2chip_0/inst/master_fpga_gen.axi_chip2chip_master_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_assertion_r, dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i, dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_i, dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/rd_rst_reg[0], dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_inst/s_bscan_tms, board_i/c2c_signals/inst/ila_lib/inst/ila_core_inst/u_ila_regs/U_XSDB_SLAVE/s_daddr_o[13]... and (the first 15 of 24 listed).}}  -suppress 
set_msg_config  -id {Synth 8-7023}  -string {{WARNING: [Synth 8-7023] instance 'reg_slice_mi' of module 'axi_register_slice_v2_1_24_axi_register_slice' has 93 connections declared, but only 92 given [/fpga/sidewinder_bandwidth/sidewinder.gen/sources_1/bd/design_1/ipshared/3917/hdl/axi_crossbar_v2_1_vl_rfs.v:3122]}}  -suppress 
set_msg_config  -id {Synth 8-7071}  -string {{WARNING: [Synth 8-7071] port 'aclk2x' of module 'axi_register_slice_v2_1_24_axi_register_slice' is unconnected for instance 'reg_slice_mi' [/fpga/sidewinder_bandwidth/sidewinder.gen/sources_1/bd/design_1/ipshared/3917/hdl/axi_crossbar_v2_1_vl_rfs.v:3122]}}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {DRC PDCN-1569}  -string {{WARNING: [DRC PDCN-1569] LUT equation term check: Used physical LUT pin 'A3' of cell dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1 (pin dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I1) is not included in the LUT equation: 'O5=(A2*A5)+(A2*(~A5)*(~A1))+((~A2))'. If this cell is a user instantiated LUT in the design, please remove connectivity to the pin or change the equation and/or INIT string of the LUT to prevent this issue. If the cell is inferred or IP created LUT, please regenerate the IP and/or resynthesize the design to attempt to correct the issue.}}  -suppress 
set_msg_config  -id {DRC PDCN-1569}  -string {{WARNING: [DRC PDCN-1569] LUT equation term check: Used physical LUT pin 'A4' of cell dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1 (pin dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I0) is not included in the LUT equation: 'O5=(A2*A5)+(A2*(~A5)*(~A1))+((~A2))'. If this cell is a user instantiated LUT in the design, please remove connectivity to the pin or change the equation and/or INIT string of the LUT to prevent this issue. If the cell is inferred or IP created LUT, please regenerate the IP and/or resynthesize the design to attempt to correct the issue.}}  -suppress 
set_msg_config  -id {DRC PDCN-1569}  -suppress 
set_msg_config  -id {DRC RTSTAT-10}  -suppress 
set_msg_config  -id {Netlist 29-101}  -string {{WARNING: [Netlist 29-101] Netlist 'design_1_req_manager_0_0' is not ideal for floorplanning, since the cellview 'req_manager' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.}}  -suppress 
set_msg_config  -id {Vivado 12-1790}  -string {{CRITICAL WARNING: [Vivado 12-1790] Evaluation License Warning: This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'design_1_cmac_usplus_0_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.
    IP core 'design_1_qsfp0_ethernet_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.

Resolution: If a new IP Core license was added, in order for the new license to be picked up, the current netlist needs to be updated by resetting and re-generating the IP output products before bitstream generation.}}  -suppress 
set_msg_config  -id {Vivado 12-1790}  -string {{CRITICAL WARNING: [Vivado 12-1790] Evaluation License Warning: This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'design_1_qsfp0_ethernet_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.
    IP core 'design_1_cmac_usplus_0_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.

Resolution: If a new IP Core license was added, in order for the new license to be picked up, the current netlist needs to be updated by resetting and re-generating the IP output products before bitstream generation.}}  -suppress 
set_msg_config  -id {Common 17-1649}  -string {{CRITICAL WARNING: [Common 17-1649] The Vivado message database '/fpga/sidewinder_rdma/sidewinder.runs/impl_1/place_design.pb' contains 21670 messages. Restoring all messages from this message database will impact Vivado performance, so only WARNING, CRITICAL WARNING, and ERROR messages will be restored. To restore all messages from this file use the tcl command 'set_param messaging.loadPbLimit 21671' and re-open the project.}}  -suppress 
set_msg_config  -id {Common 17-1649}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {Netlist 29-101}  -suppress 
set_msg_config  -id {Vivado 12-1790}  -string {{CRITICAL WARNING: [Vivado 12-1790] Evaluation License Warning: This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'top_level_cmac_usplus_0_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.

Resolution: If a new IP Core license was added, in order for the new license to be picked up, the current netlist needs to be updated by resetting and re-generating the IP output products before bitstream generation.}}  -suppress 
set_msg_config  -id {Device 21-425}  -string {{WARNING: [Device 21-425] Part: xcku15p is not listed in special parts list.}}  -suppress 
set_msg_config  -id {Constraints 18-550}  -string {{WARNING: [Constraints 18-550] Could not create 'IBUF_LOW_PWR' constraint because net 'top_level_i/source_200Mhz/ibufds_200mhz/IBUF_OUT[0]' is not directly connected to top level port. Synthesis is ignored for IBUF_LOW_PWR but preserved for implementation.}}  -suppress 
set_msg_config  -id {Power 33-295}  -string {{WARNING: [Power 33-295] The data input toggle rate 0.000000 of CMAC instance top_level_i/eth_0/cmac/inst/i_top_level_cmac_usplus_0_0_top/obsibdaaf4ker2wujpra0sjb is beyond the acceptable limit of 8.260000 - 54.090000. Using the 8.260000 toggle rate for power analysis.
Resolution: Please use the following to set activity - set_switching_activity -static_probability <value> -toggle_rate <value> [get_pins -of_objects [get_cells <instance name>] -filter {DIRECTION =~ IN && NAME =~ *TX_DATAIN*}]}}  -suppress 
set_msg_config  -id {Vivado 12-1790}  -string {{CRITICAL WARNING: [Vivado 12-1790] Evaluation License Warning: This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'top_level_cmac_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.
    IP core 'top_level_cmac_usplus_0_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.

Resolution: If a new IP Core license was added, in order for the new license to be picked up, the current netlist needs to be updated by resetting and re-generating the IP output products before bitstream generation.}}  -suppress 
set_msg_config  -id {Common 17-55}  -string {{CRITICAL WARNING: [Common 17-55] 'set_property' expects at least one object. [/fpga/xuppl4_cabletest/xdc/implementation.xdc:1]
Resolution: If [get_<value>] was used to populate the object, check to make sure this command returns at least one valid object.}}  -suppress 
set_msg_config  -id {Common 17-356}  -string {{ERROR: [Common 17-356] Failed to install all user apps.}}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {Vivado 12-1790}  -string {{CRITICAL WARNING: [Vivado 12-1790] Evaluation License Warning: This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'top_level_cmac_usplus_0_1' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.
    IP core 'top_level_cmac_usplus_0_0' (cmac_usplus_core) was generated with multiple features:
        IP feature 'cmac_an_lt@2020.05' was enabled using a design_linking license.
        IP feature 'cmac_usplus@2020.05' was enabled using a bought license.

Resolution: If a new IP Core license was added, in order for the new license to be picked up, the current netlist needs to be updated by resetting and re-generating the IP output products before bitstream generation.}}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/user/Documents/Nexys/nexys_template/project.cache/wt [current_project]
set_property parent.project_path /home/user/Documents/Nexys/nexys_template/project.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/user/Documents/Nexys/nexys_template/project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_ip -quiet /home/user/Documents/Nexys/nexys_template/project.srcs/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0.xci
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_1/bd_f519_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_1/bd_f519_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_2/bd_f519_arinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_3/bd_f519_rinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_4/bd_f519_awinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_5/bd_f519_winsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_6/bd_f519_binsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_7/bd_f519_aroutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_8/bd_f519_routsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_9/bd_f519_awoutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_10/bd_f519_woutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_11/bd_f519_boutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_12/bd_f519_arni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_13/bd_f519_rni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_14/bd_f519_awni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_15/bd_f519_wni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_16/bd_f519_bni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_20/bd_f519_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_21/bd_f519_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_22/bd_f519_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_23/bd_f519_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_24/bd_f519_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_25/bd_f519_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_26/bd_f519_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_27/bd_f519_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_28/bd_f519_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_29/bd_f519_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_30/bd_f519_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_31/bd_f519_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_33/bd_f519_m01s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_34/bd_f519_m01arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_35/bd_f519_m01rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_36/bd_f519_m01awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_37/bd_f519_m01wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/bd_0/ip/ip_38/bd_f519_m01bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
OPTRACE "Configure IP Cache" START { }

set cached_ip [config_ip_cache -export -no_bom  -dir /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1 -new_name top_level_smartconnect_0_0 -ip [get_ips top_level_smartconnect_0_0]]

OPTRACE "Configure IP Cache" END { }
if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top top_level_smartconnect_0_0 -part xc7a100tcsg324-1 -mode out_of_context
OPTRACE "synth_design" END { }
OPTRACE "Write IP Cache" START { }

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix top_level_smartconnect_0_0_ top_level_smartconnect_0_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_smartconnect_0_0_stub.v
 lappend ipCachedFiles top_level_smartconnect_0_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_smartconnect_0_0_stub.vhdl
 lappend ipCachedFiles top_level_smartconnect_0_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_smartconnect_0_0_sim_netlist.v
 lappend ipCachedFiles top_level_smartconnect_0_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_smartconnect_0_0_sim_netlist.vhdl
 lappend ipCachedFiles top_level_smartconnect_0_0_sim_netlist.vhdl
 set TIME_taken [expr [clock seconds] - $TIME_start]

 if { [get_msg_config -count -severity {CRITICAL WARNING}] == 0 } {
  config_ip_cache -add -dcp top_level_smartconnect_0_0.dcp -move_files $ipCachedFiles   -synth_runtime $TIME_taken  -ip [get_ips top_level_smartconnect_0_0]
 }
OPTRACE "Write IP Cache" END { }
}
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}

rename_ref -prefix_all top_level_smartconnect_0_0_

OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level_smartconnect_0_0.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "top_level_smartconnect_0_0_synth_1_synth_report_utilization_0" "report_utilization -file top_level_smartconnect_0_0_utilization_synth.rpt -pb top_level_smartconnect_0_0_utilization_synth.pb"
OPTRACE "synth reports" END { }

if { [catch {
  file copy -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0.dcp /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 status "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0.dcp /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 status "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0_stub.v /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0_stub.vhdl /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0_sim_netlist.v /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/user/Documents/Nexys/nexys_template/project.runs/top_level_smartconnect_0_0_synth_1/top_level_smartconnect_0_0_sim_netlist.vhdl /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir /home/user/Documents/Nexys/nexys_template/project.ip_user_files/ip/top_level_smartconnect_0_0]} {
  catch { 
    file copy -force /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.v /home/user/Documents/Nexys/nexys_template/project.ip_user_files/ip/top_level_smartconnect_0_0
  }
}

if {[file isdir /home/user/Documents/Nexys/nexys_template/project.ip_user_files/ip/top_level_smartconnect_0_0]} {
  catch { 
    file copy -force /home/user/Documents/Nexys/nexys_template/project.gen/sources_1/bd/top_level/ip/top_level_smartconnect_0_0/top_level_smartconnect_0_0_stub.vhdl /home/user/Documents/Nexys/nexys_template/project.ip_user_files/ip/top_level_smartconnect_0_0
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "top_level_smartconnect_0_0_synth_1" END { }
