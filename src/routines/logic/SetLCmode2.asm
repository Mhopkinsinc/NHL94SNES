; Unidentified routine.
SetLCmode2:
	jsl.l CODE_9FE089
	inc.b $A5
	inc.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.l $7E3120
	bne CODE_9FD33D
	jsl.l eraser
CODE_9FD33D:
	jsl.l CODE_9FE089
	lda.w printy
	sec
	sbc.w #$000F
	bmi CODE_9FD352
	lda.w #$0001
	tsb.w sflags3
	bra CODE_9FD35A
