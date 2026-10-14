; Unidentified routine.
CODE_9EABD9:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b tmp0
	bit.w #$000A
	beq CODE_9EABFD
	eor.w #$000A
	sta.b tmp0
CODE_9EABFD:
	lda.b tmp1
	bit.w #$000A
	beq CODE_9EAC09
	eor.w #$000A
	sta.b tmp1
CODE_9EAC09:
	lda.b tmp1
	beq CODE_9EAC16
	ldx.b tmp0
	jsr (DATA8_9EAD34,x)
	ldx.b $E4
	plb
	rtl
