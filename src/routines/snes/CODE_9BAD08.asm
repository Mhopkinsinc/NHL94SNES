; Unidentified routine.
CODE_9BAD08:
	sta.b $B9
	lda.w #$FFFF
	sta.b $B5
	sta.b $B7
	sta.w $0CAB
	lda.w #$0016
	sta.b $89
CODE_9BAD19:
	ldy.b $89
	lda.w position,y
	bmi CODE_9BAD81
	lda.w Xpos,y
	sec
	sbc.w $0D75
	sta.b $A5
	sta.b $AD
	lda.w Ypos,y
	sec
	sbc.w $0DD7
	sta.b $A9
	sta.b $B1
	jsl.l vtoa
	cmp.w #$0008
	beq CODE_9BAD81
	sec
	sbc.b $B9
	beq CODE_9BAD4E
	cmp.w #$0001
	beq CODE_9BAD4E
	cmp.w #$0007
	bne CODE_9BAD81
CODE_9BAD4E:
	lda.b $AD
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9BAD5B
	ora.w #$E000
CODE_9BAD5B:
	tax
	jsl.l CODE_808F7D
	sta.b $A5
	lda.b $B1
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
	adc.b $A5
	cmp.b $B7
	bcs CODE_9BAD81
	sta.b $B7
	lda.b $89
	sta.b $B5
CODE_9BAD81:
	dec.b $89
	dec.b $89
	bpl CODE_9BAD19
	lda.b $B5
	bmi CODE_9BADA5
	lda.b $B7
	cmp.w #$0002
	bcs CODE_9BADA5
	lda.b $B5
	sta.w $0CAB
	lda.w #$001E
	sta.b $C1
	lda.w #$0020
	trb.w sflags
	jmp.w CODE_9BABAB
