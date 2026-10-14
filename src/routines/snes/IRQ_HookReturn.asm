; IRQ: restore the registers and rti (where the IRQ hooks return)
IRQ_HookReturn:
	rep #$30
	ply
	plx
	pla
	plb
	rti
