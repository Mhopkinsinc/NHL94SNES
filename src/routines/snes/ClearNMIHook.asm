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
	stx.w $0775
	sta.w $0773
	rep #$10
	rtl
