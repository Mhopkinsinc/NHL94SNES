; Unidentified routine.
CODE_9FDE13:
	jsl.l CODE_9FE089
	lda.w printy
	sec
	sbc.w #$000F
	bmi CODE_9FDE26
	lda.w #$0001
	trb.w sflags3
CODE_9FDE26:
	inc.b d1
	lda.l $7E35D0
	sta.b d2
	lda.l $7E3120
	bne CODE_9FDE38
	jsl.l eraser
CODE_9FDE38:
	jml.l CODE_9F9B36
