transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/memory_ip.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/Register.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/Processor.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/PC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/AC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/IR.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/ALU.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/BUS.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/Control_Unit.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/state_machine.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/top_layer.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/Processor {E:/GIthub/Processor/datapath.v}

