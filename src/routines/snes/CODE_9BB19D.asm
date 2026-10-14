; Unidentified routine.
CODE_9BB19D:
	lda.b d1
	pha
	inc.w $0CB9
	sep #$20
	ldx.b a4
	stx.w WMADDL
	lda.b $9B
	sta.w WMADDH
	lda.b #$0F
	sta.b d1
	ldx.w #$0000
CODE_9BB1B6:
	lda.w WMDATA
	sta.w Xpos,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	bit.b #$08
	beq CODE_9BB1C9
	ora.b #$F0
CODE_9BB1C9:
	sta.w $0D56,x
	lda.w WMDATA
	sta.w Ypos,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	bit.b #$08
	beq CODE_9BB1DE
	ora.b #$F0
CODE_9BB1DE:
	sta.w $0DB8,x
	lda.w WMDATA
	sta.w $0D97,x
	lda.w WMDATA
	sta.b $14
	and.b #$3F
	sta.w $0D98,x
	lda.w $0E04,x
	and.b #$E7
	sta.w $0E04,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	and.b #$18
	ora.w $0E04,x
	sta.w $0E04,x
	inx
	inx
	dec.b d1
	bpl CODE_9BB1B6
	lda.b #$05
	sta.b d1
	ldx.w #$0000
CODE_9BB213:
	lda.w WMDATA
	sta.w $13C3,x
	lda.w WMDATA
	sta.w $13C5,x
	stz.w $0F44,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	cmp.b #$0F
	bne CODE_9BB232
	lda.b #$FF
	sta.w $0F44,x
CODE_9BB232:
	sta.w position,x
	stz.w $0F46,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	cmp.b #$0F
	bne CODE_9BB249
	lda.b #$FF
	sta.w $0F46,x
CODE_9BB249:
	sta.w $0F45,x
	inx
	inx
	inx
	inx
	dec.b d1
	bpl CODE_9BB213
	lda.w WMDATA
	sta.w $0DF9
	bpl CODE_9BB260
	lda.b #$FF
	bra CODE_9BB262
