onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_write_on_avalon/sim_delay
add wave -noupdate /tb_write_on_avalon/clock
add wave -noupdate /tb_write_on_avalon/reset
add wave -noupdate -radix decimal /tb_write_on_avalon/avalon_slave_address
add wave -noupdate /tb_write_on_avalon/avalon_slave_write
add wave -noupdate /tb_write_on_avalon/avalon_slave_writedata
add wave -noupdate -color Orange /tb_write_on_avalon/piezo_interface_out
add wave -noupdate /tb_write_on_avalon/piezo_interface_in
add wave -noupdate -radix decimal /tb_write_on_avalon/avalon_slave_address2
add wave -noupdate /tb_write_on_avalon/avalon_slave_write2
add wave -noupdate -radix decimal /tb_write_on_avalon/avalon_slave_writedata2
add wave -noupdate -color Orange /tb_write_on_avalon/piezo_interface_out2
add wave -noupdate /tb_write_on_avalon/piezo_interface_in2
add wave -noupdate -radix decimal /tb_write_on_avalon/time_master
add wave -noupdate -radix decimal /tb_write_on_avalon/time_slave
add wave -noupdate -radix decimal /tb_write_on_avalon/time_master2
add wave -noupdate -radix decimal /tb_write_on_avalon/time_slave2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {743 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
