onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /rtc_tb/sim_delay
add wave -noupdate /rtc_tb/clock
add wave -noupdate /rtc_tb/reset
add wave -noupdate /rtc_tb/event_trigger
add wave -noupdate /rtc_tb/avalon_slave_write
add wave -noupdate -radix decimal /rtc_tb/avalon_slave_address
add wave -noupdate -radix decimal /rtc_tb/avalon_slave_writedata
add wave -noupdate -radix decimal /rtc_tb/burst_cycles_cnt
add wave -noupdate /rtc_tb/burst_enable
add wave -noupdate /rtc_tb/piezo_enable
add wave -noupdate -radix decimal /rtc_tb/burst_cycles_def_
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {328 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 217
configure wave -valuecolwidth 178
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
WaveRestoreZoom {0 ps} {826 ps}
