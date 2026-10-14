; Unidentified routine.
CODE_80AB0B:
	cpy.b #$DC
	bne CODE_80AB51
	lda.b $5A
	and.w #$00FF
	cmp.w #$006A
	bne .2
.1:
	lda.w #$0014
.2:
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.w $086A,x
	sta.b $4E
	sep #$20
	ldx.b $4A
	ldy.b #$2F
	lda.b ($4E),y
	sta.w $089D,x
	stz.w $088C,x
	lda.w $07E3
	bne .t1
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08AE,x
	iny
	lda.b ($4E),y
	bra CODE_80AB4E

.t1:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08AE,x
CODE_80AB4E:
	sta.w $08BF,x
CODE_80AB51:
	rep #$20
	cpy.b #$EA
	bne .2
.1:
	lda.b $5A
	and.w #$00FF
	sta.b $62
.2:
	rep #$20
	jmp.w CODE_80ABA5
