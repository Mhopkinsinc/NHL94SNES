; Wait for the next frame ($0764 changes)
WaitFrame:
	pha
	lda.w $0764
.loop:
	cmp.w $0764
	beq .loop
	pla
	rtl
