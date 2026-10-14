; Unidentified routine.
CODE_9EAE01:
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
	beq CODE_9EAE25
	eor.w #$000A
	sta.b tmp0
CODE_9EAE25:
	lda.b tmp1
	bit.w #$000A
	beq CODE_9EAE31
	eor.w #$000A
	sta.b tmp1
CODE_9EAE31:
	lda.b tmp1
	beq CODE_9EAE3E
	ldx.b tmp0
	jsr (DATA8_9EAF1A,x)
	ldx.b $E4
	plb
	rtl
