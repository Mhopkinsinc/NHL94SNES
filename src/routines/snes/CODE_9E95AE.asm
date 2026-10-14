; Unidentified routine.
CODE_9E95AE:
	lda.w SPA,x
	cmp.w #$F3A6
	bcc CODE_9E95DC
	cmp.w #$F46B
	bcs CODE_9E95DC
	stz.w pfalock,x
	stz.w $1543,x
	ldy.w $0F03,x
	lda.w SPA,y
	cmp.w #$F3A6
	bcc CODE_9E95DA
	cmp.w #$F46B
	bcs CODE_9E95DA
	lda.w #$0000
	sta.w pfalock,y
	sta.w $1543,y
CODE_9E95DA:
	ldy.b a2
CODE_9E95DC:
	lda.w SPA,y
	cmp.w #$F3A6
	bcc CODE_9E960A
	cmp.w #$F46B
	bcs CODE_9E960A
	lda.w #$0000
	sta.w pfalock,y
	sta.w $1543,y
	ldx.w $0F03,y
	lda.w SPA,x
	cmp.w #$F3A6
	bcc CODE_9E9608
	cmp.w #$F46B
	bcs CODE_9E9608
	stz.w pfalock,x
	stz.w $1543,x
CODE_9E9608:
	ldx.b a3
CODE_9E960A:
	lda.b $AA
	sta.b d1
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E9692
	lda.b d1
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0005
	bcs CODE_9E9624
	lda.w #$0005
CODE_9E9624:
	sta.b d4
	lda.w SPA,x
	cmp.w #$F208
	bcc CODE_9E963C
	cmp.w #$F343
	bcs CODE_9E963C
CODE_9E9633:
	lda.b d4
	lsr a
	adc.b d4
	sta.b d4
	bra CODE_9E9649
