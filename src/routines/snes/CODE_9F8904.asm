; Unidentified routine.
CODE_9F8904:
	lda.w $0DCF
	cmp.w #$011F
	bmi CODE_9F890F
	lda.w #$011F
CODE_9F890F:
	sta.w $0DCF
	lda.w $0DD1
	cmp.w #$FED2
	bpl CODE_9F891D
	lda.w #$FED2
CODE_9F891D:
	sta.w $0DD1
	ldy.w #$000C
	lda.w #$000F
CODE_9F8926:
	sta.w $0AE7,y
	dey
	dey
	bpl CODE_9F8926
	ldx.w #$0008
	lda.w #$0000
CODE_9F8933:
	sta.w $0ADD,x
	dex
	dex
	bpl CODE_9F8933
	lda.w #$0000
	sta.b $EA
	lda.w #$0002
	sta.b $EC
	ldx.w #$0000
CODE_9F8947:
	stx.b $95
	stx.b $E4
	cpx.w #$000C
	bne CODE_9F895A
	lda.w #$0002
	sta.b $EA
	lda.w #$0000
	sta.b $EC
CODE_9F895A:
	lda.w #$FFFF
	sta.b $E6
	lda.w position,x
	bpl CODE_9F8967
	jmp.w $8ADD
