; Run the routine at X:A as the frame hook of the next NMI
SetFrameHook:
	sep #$10
	stx.w $0772
	sta.w $0770
	rep #$10
	rtl
