; Unidentified routine.
CODE_9BAD08:
	sta.b d5
	lda.w #$FFFF
	sta.b d4
	sta.b $B7
	sta.w $0CAB
	lda.w #$0016
	sta.b a0
CODE_9BAD19:
	ldy.b a0
	lda.w position,y
	bmi CODE_9BAD81
	lda.w Xpos,y
	sec
	sbc.w $0D75
	sta.b d0
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w $0DD7
	sta.b d1
	sta.b d3
	jsl.l vtoa
	cmp.w #$0008
	beq CODE_9BAD81
	sec
	sbc.b d5
	beq CODE_9BAD4E
	cmp.w #$0001
	beq CODE_9BAD4E
	cmp.w #$0007
	bne CODE_9BAD81
CODE_9BAD4E:
	lda.b d2
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9BAD5B
	ora.w #$E000
CODE_9BAD5B:
	tax
	jsl.l CODE_808F7D
	sta.b d0
	lda.b d3
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9BAD6F
	ora.w #$E000
CODE_9BAD6F:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d0
	cmp.b $B7
	bcs CODE_9BAD81
	sta.b $B7
	lda.b a0
	sta.b d4
CODE_9BAD81:
	dec.b a0
	dec.b a0
	bpl CODE_9BAD19
	lda.b d4
	bmi CODE_9BADA5
	lda.b $B7
	cmp.w #$0002
	bcs CODE_9BADA5
	lda.b d4
	sta.w $0CAB
	lda.w #$001E
	sta.b d7
	lda.w #$0020
	trb.w sflags
	jmp.w CODE_9BABAB
