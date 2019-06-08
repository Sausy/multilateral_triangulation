transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/testbench/burst_mode {/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/testbench/burst_mode/rtc.v}

