; Unidentified routine.
CODE_9EBA68:
	ldy.b $91
	lda.w position,y
	bne CODE_9EBA67
	lda.w $15D6
	bne CODE_9EBA67
	lda.w $0AD9
	cmp.b $95
	beq CODE_9EBA84
	lda.w $0F23,x
	sec
	sbc.w #$001A
	bmi CODE_9EBA67
CODE_9EBA84:
	lda.w $0F23,x
	sec
	sbc.w #$0003
	bmi CODE_9EBA67
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9E9B52
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w $0F23,y
	sec
	sbc.w #$001F
	bmi CODE_9EBA67
	lda.w pflags,x
	bit.w #$4000
	bne CODE_9EBA67
	lda.w #$0014
	sec
	sbc.w $1443,x
	jsl.l CODE_9BB385
	cmp.w #$0002
	bcs CODE_9EBA67
	lda.w gmode
	bit.w #$0010
	bne CODE_9EBA67
	lda.w $0B05,y
	and.w #$0004
	bne CODE_9EBA67
	lda.w #$0026
	sta.b $A5
	jmp.w $B85E
