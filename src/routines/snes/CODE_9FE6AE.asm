; Unidentified routine.
CODE_9FE6AE:
	stx.w $0AC6
	lda.w #$003C
	sta.w $0AC8
	txa
CODE_9FE6B8:
	lsr a
	jsl.l CODE_9B84DC
	dec.w $0AC4
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bne CODE_9FE6EC
	lda.w $0AC8
	beq CODE_9FE6F2
	sec
	sbc.w #$0003
	sta.w $0AC8
	beq CODE_9FE6DB
	bpl CODE_9FE6F2
CODE_9FE6DB:
	stz.w $0AC8
	ldx.w $0AC6
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	sta.w $0AC6
	rtl
