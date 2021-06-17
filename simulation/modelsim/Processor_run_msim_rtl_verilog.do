transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Ajeeth/OneDrive/Desktop/FPGA\ PROJECT/fpga_processor {C:/Users/Ajeeth/OneDrive/Desktop/FPGA PROJECT/fpga_processor/IR.v}

