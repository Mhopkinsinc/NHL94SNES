; Unidentified routine.
CODE_808627:
	pha
CODE_808628:
	jsl.l WaitFrame
	lda.w $0778
	and.w #$FFF0
	beq CODE_808637
	dex
	bne CODE_808628
CODE_808637:
	pla
	rtl
