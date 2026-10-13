; Unidentified routine.
CODE_9EA8FE:
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w Ypos,x
	sta.b $B1
	lda.w puckvy
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA91B
	ora.w #$FF00
CODE_9EA91B:
	clc
	adc.w pucky
	sec
	sbc.b $B1
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9EA948
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
	lda.w #$0000
	sec
	sbc.b $B1
	sta.b $B1
	lda.b $AD
	eor.w #$0004
	sta.b $AD
CODE_9EA948:
	lda.w pfrev,x
	bne CODE_9EA967
	lda.b $B1
	bpl CODE_9EA9AD
	lda.b $AD
	cmp.w #$0004
	bne CODE_9EA9AD
	jsl.l vtoa
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	bra CODE_9EA983
