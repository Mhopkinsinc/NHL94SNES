; Unidentified routine.
IRQ_Fast:
	rep #$30
	sei
	phb
	phk
	plb
	pha
	phx
	phy
	sep #$10
	ldx.w TIMEUP
	ldx.b #$80
	phx
	pea.w IRQ_HookReturn-1		; rtl from the hook lands on the next line
	jml [$078F]
