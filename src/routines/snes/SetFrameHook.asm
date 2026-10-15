; Run the routine at X:A as the frame hook of the next NMI
SetFrameHook:
	sep #$10
	stx.w FrameHookNext+2
	sta.w FrameHookNext
	rep #$10
	rtl
