; Unidentified routine.
CODE_80AB63:
	sep #$20
	lda.b $4A
	cmp.b #$09
	bne .1
	asl a
	tax
	tya
	sec
	sbc.b #$2F
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $4E
	sta.w $086A,x
	sep #$20
	ldx.b $4A
	ldy.b #$12
	lda.b [$4E],y
	sta.w $08AE,x
	iny
	lda.b [$4E],y
	sta.w $08BF,x
	ldy.b #$2F
	lda.b [$4E],y
	sta.w $089D,x
	stz.w $088C,x
.1:
	lda.b $4A
	asl a
	tax
	rep #$20
	jsr.w CODE_80A697
CODE_80ABA5:
	jsr.w CODE_80A568
	ldx.w $07FF
	cmp.w #$0000
	bne .t2
	jmp.w CODE_80A886

.t1:
	rep #$20
	bra CODE_80ABA5

.t2:
	sta.w $0848,x
	lda.b $4C
	sta.w $0804,x
CODE_80ABBF:
	dec.w $0848,x
CODE_80ABC2:
	sep #$30
	ldx.b $4A
	rts
