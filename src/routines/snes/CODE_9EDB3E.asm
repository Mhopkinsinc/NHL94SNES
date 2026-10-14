; Unidentified routine.
CODE_9EDB3E:
	lda.w $0AD9
	bpl CODE_9EDB3A
	lda.w iflags
	bit.w #$0004
	bne CODE_9EDB3A
	lda.w $0D71
	bit.w #$8000
	beq CODE_9EDB57
	eor.w #$FFFF
	inc a
CODE_9EDB57:
	cmp.w #$0068
	bmi CODE_9EDB3A
	lda.w puckvy
	bit.w #$8000
	beq CODE_9EDB68
	eor.w #$FFFF
	inc a
CODE_9EDB68:
	cmp.w #$3800
	bmi CODE_9EDB3A
	lda.w pucky
	cmp.w #$00B8
	bpl CODE_9EDB7D
	lda.w pucky
	cmp.w #$FF48
	bpl CODE_9EDB3A
CODE_9EDB7D:
	lda.w puckvy
	ldy.w pfgoal,x
	beq CODE_9EDB89
	eor.w #$FFFF
	inc a
CODE_9EDB89:
	cmp.w #$FC00
	bmi CODE_9EDB3A
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq CODE_9EDBA1
	stz.b a2
	lda.w #$0002
	sta.b a1
CODE_9EDBA1:
	ldy.b a1
	lda.w $17AE,y
	cmp.w #$0132
	bcc CODE_9EDBBD
	ldy.b a2
	lda.w $17AE,y
	cmp.w #$0132
	bcc CODE_9EDBBD
	lda.w #$000F
	sta.b d0
	jmp.w assinsert
