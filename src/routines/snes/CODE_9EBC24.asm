; Unidentified routine.
CODE_9EBC24:
	ldy.b $91
	lda.w $14E3,x
	bne CODE_9EBCA3
	lda.w position,x
	beq CODE_9EBCA3
	lda.l $7E34C4
	bne CODE_9EBC4F
	lda.w $19D4,y
	bmi CODE_9EBC4F
	lda.w #$0010
	clc
	adc.w $1483,y
	sec
	sbc.w $12E3,x
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc CODE_9EBCA3
CODE_9EBC4F:
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	jsl.l vtoa
	ldy.b $91
	lda.b $A5
	sec
	sbc.w $1163,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EBCA3
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9E9B52
	jsl.l CODE_9EC042
	beq CODE_9EBCA4
	lda.w $1E8D
	bpl CODE_9EBCA4
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l AddPenalty
	bra CODE_9EBCB8
