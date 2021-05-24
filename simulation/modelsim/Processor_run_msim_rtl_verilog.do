transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/Register.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/Processor.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/PC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/AC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/IR.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/ALU.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/BUS.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/Control_Unit.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/Processor_datapath.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/state_machine.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/top_layer.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/fpga_processor {E:/GIthub/fpga_processor/clock.v}

