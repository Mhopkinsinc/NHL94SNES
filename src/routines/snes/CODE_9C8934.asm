; Unidentified routine.
CODE_9C8934:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	ldy.w $1DBD
	tya
	dec a
	asl a
	sta.w printy
CODE_9C8957:
	inc.w printy
	inc.w printy
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tax
	lda.w $1DF9
	beq CODE_9C8973
	jsl.l CODE_9C8980
	bra CODE_9C8977
