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
	jsl.l MemFill
	ldy.w $1DBD
	tya
	dec a
	asl a
	sta.w printy
.1:
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
	bra .2

.t1:
	jsl.l CODE_9C8A83
.2:
	iny
	cpy.w $1DC1
	beq .1
	bcc .1
	rtl
