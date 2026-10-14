; Unidentified routine.
CODE_9C8934:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l printfontset
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
	beq .t1
	jsl.l CODE_9C8980
	bra CODE_9C8977

.t1:
	jsl.l CODE_9C8A83
CODE_9C8977:
	iny
	cpy.w $1DC1
	beq CODE_9C8957
	bcc CODE_9C8957
	rtl
