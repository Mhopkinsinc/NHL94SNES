; Unidentified routine.
CODE_9EA25F:
	lda.w #$FFFF
	sta.b d3
	sta.b a0
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA271
	ldy.w #$000C
CODE_9EA271:
	lda.w #$0006
	sta.b d2
CODE_9EA276:
	sty.b a2
	lda.w position,y
	beq CODE_9EA2B3
	bmi CODE_9EA2B3
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d1
	ldy.b d1
	lda.b d0
	jsl.l CODE_9CA554
	sta.b d4
	jsl.l vtoa
	lda.b d0
	sec
	sbc.w facedir,x
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9EA2B3
	eor.w #$FFFF
	adc.w #$0008
CODE_9EA2B3:
	asl a
	asl a
	asl a
	asl a
	adc.b d4
	cmp.b d3
	bcs CODE_9EA2C3
	sta.b d3
	lda.b a2
	sta.b a0
CODE_9EA2C3:
	ldy.b a2
	iny
	iny
	dec.b d2
	bne CODE_9EA276
CODE_9EA2CB:
	lda.w #$F864
	sta.b d1
	sta.w pfalock,x
	ldy.b a0
	bmi CODE_9EA2ED
	lda.w facedir,x
	sec
	sbc.w facedir,y
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9EA2ED
	lda.w #$F374
	sta.b d1
CODE_9EA2ED:
	jml.l SetSPA
