; Unidentified routine.
CODE_8085FF:
	pha
.loop:
	lda.w JoyPad
	and.w #$FFF0
	bne .loop
	pla
	rtl

.t1:
	pha
.loopx:
	lda.w $0778
	and.w #$FFF0
	bne .loopx
	pla
	rtl

.t2:
	pha
.loopx2:
	jsl.l WaitFrame
	lda.w JoyPad
	and.w #$FFF0
	beq .1
	dex
	bne .loopx2
.1:
	pla
	rtl

.t1x:
	pha
.loopxx:
	jsl.l WaitFrame
	lda.w $0778
	and.w #$FFF0
	beq .1x
	dex
	bne .loopxx
.1x:
	pla
	rtl
