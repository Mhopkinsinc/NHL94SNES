; Unidentified routine.
CODE_80AB0B:
	cpy.b #$DC
	bne CODE_80AB51
	lda.b $5A
	and.w #$00FF
	cmp.w #$006A
	bne CODE_80AB1C
CODE_80AB19:
	lda.w #$0014
CODE_80AB1C:
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
	bne CODE_80AB47
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08AE,x
	iny
	lda.b ($4E),y
	bra CODE_80AB4E
