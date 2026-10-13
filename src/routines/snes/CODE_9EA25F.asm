; Unidentified routine.
CODE_9EA25F:
	lda.w #$FFFF
	sta.b $B1
	sta.b $89
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA271
	ldy.w #$000C
CODE_9EA271:
	lda.w #$0006
	sta.b $AD
CODE_9EA276:
	sty.b $91
	lda.w position,y
	beq CODE_9EA2B3
	bmi CODE_9EA2B3
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b $A9
	ldy.b $A9
	lda.b $A5
	jsl.l CODE_9CA554
	sta.b $B5
	jsl.l vtoa
	lda.b $A5
	sec
	sbc.w $1163,x
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
	adc.b $B5
	cmp.b $B1
	bcs CODE_9EA2C3
	sta.b $B1
	lda.b $91
	sta.b $89
CODE_9EA2C3:
	ldy.b $91
	iny
	iny
	dec.b $AD
	bne CODE_9EA276
CODE_9EA2CB:
	lda.w #$F864
	sta.b $A9
	sta.w $14E3,x
	ldy.b $89
	bmi CODE_9EA2ED
	lda.w $1163,x
	sec
	sbc.w $1163,y
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9EA2ED
	lda.w #$F374
	sta.b $A9
CODE_9EA2ED:
	jml.l SetSPA
