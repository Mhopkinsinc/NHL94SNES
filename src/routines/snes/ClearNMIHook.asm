; Set the NMI hook back to the empty routine
ClearNMIHook:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l .t1
	plx
	pla
	rtl

.t1:
	sep #$10
	stx.w NMIHookNext+2
	sta.w NMIHookNext
	rep #$10
	rtl
