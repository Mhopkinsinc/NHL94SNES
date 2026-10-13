; Unidentified routine.
CODE_9ED179:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi CODE_9ED1B0
	cmp.w #$0029
	bpl CODE_9ED1B0
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED19B
	eor.w #$FFFF
	inc a
CODE_9ED19B:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED1B0
	cmp.w #$0104
	bpl CODE_9ED1B0
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED1B0:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi CODE_9ED1D7
	cmp.w #$0031
	bpl CODE_9ED1D7
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED1C9
	eor.w #$FFFF
	inc a
CODE_9ED1C9:
	cmp.w #$00E4
	bmi CODE_9ED1D7
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED1D7:
	lda.w $19D4,x
	bpl CODE_9ED214
	lda.w $15D6
	bne CODE_9ED214
	jsl.l CODE_9FDC4C
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9ED1F9
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $0BC9
CODE_9ED1F9:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9ED24D
	lda.w $1343,x
	lsr a
	lsr a
	clc
	adc.w $1003,x
	bpl CODE_9ED217
	lda.w #$0000
	bra CODE_9ED217
