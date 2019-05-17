# TCL File Generated by Component Editor 18.0
# Fri May 10 16:32:57 CEST 2019
# DO NOT MODIFY


# 
# SPIslave "SPI_slave" v1.0
# Michael Sausmikat 2019.05.10.16:32:56
# Based on "SPISlave.v" by Author: philippe https://systemes-embarques.fr/wp/archives/author/philippe/
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module SPIslave
# 
set_module_property DESCRIPTION "Based on \"SPISlave.v\" by Author: philippe https://systemes-embarques.fr/wp/archives/author/philippe/"
set_module_property NAME SPIslave
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Michael Sausmikat"
set_module_property DISPLAY_NAME SPI_slave
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL SPISlave
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file SPISlave.v VERILOG PATH ../../test_programm/SPISlave.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end iSPI_IN ispi_in Input 1
add_interface_port conduit_end iSPI_SEND_BYTE ispi_send_byte Input 8
add_interface_port conduit_end iSPI_SS_n ispi_ss_n Input 1
add_interface_port conduit_end oSPI_INC_WRADDR ospi_inc_wraddr Output 1
add_interface_port conduit_end oSPI_OUT ospi_out Output 1
add_interface_port conduit_end oSPI_PERIPH_SLCT ospi_periph_slct Output 5
add_interface_port conduit_end oSPI_RCV_BYTE ospi_rcv_byte Output 8
add_interface_port conduit_end oSPI_RCV_CMD ospi_rcv_cmd Output 8
add_interface_port conduit_end oSPI_WRITE_SIG ospi_write_sig Output 1

