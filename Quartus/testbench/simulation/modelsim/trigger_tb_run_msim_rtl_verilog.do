transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/roboy/BikeToRikshaw/acoustic-levitation/testbench {/home/roboy/BikeToRikshaw/acoustic-levitation/testbench/trigger_tb.v}

