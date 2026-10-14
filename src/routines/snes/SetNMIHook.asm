; Run the routine at X:A in the next NMI
SetNMIHook:
	sep #$10
	stx.w $0772
	sta.w $0770
	rep #$10
	rtl
