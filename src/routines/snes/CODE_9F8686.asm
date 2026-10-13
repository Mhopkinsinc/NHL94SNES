; Unidentified routine.
CODE_9F8686:
	lda.w #$FFFF
	sta.w $0B9D
	sta.w $0B9F
	sta.w $17AE
	sta.w $17B0
	sta.w $17B2
	sta.w $17B4
	lda.w $0DF9
	sta.w $0DFF
	ldx.w #$001E
CODE_9F86A4:
	stx.b $E4
	lda.w Xpos,x
	sta.w $0E43,x
	lda.w $0D77,x
	sta.w $0E63,x
	lda.w Ypos,x
	sta.w $0E83,x
	lda.w $0DD9,x
	sta.w $0EA3,x
	cpx.w #$0018
	beq CODE_9F86C8
	cpx.w #$001A
	bne CODE_9F86CB
CODE_9F86C8:
	jmp.w $875F
