; Unidentified routine.
CODE_9EA8FE:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,x
	sta.b d3
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
	sbc.b d3
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9EA948
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
	lda.b d2
	eor.w #$0004
	sta.b d2
CODE_9EA948:
	lda.w $1523,x
	bne CODE_9EA967
	lda.b d3
	bpl CODE_9EA9AD
	lda.b d2
	cmp.w #$0004
	bne CODE_9EA9AD
	jsl.l vtoa
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	bra CODE_9EA983
