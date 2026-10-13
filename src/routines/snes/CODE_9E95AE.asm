; Unidentified routine.
CODE_9E95AE:
	lda.w SPA,x
	cmp.w #$F3A6
	bcc CODE_9E95DC
	cmp.w #$F46B
	bcs CODE_9E95DC
	stz.w $14E3,x
	stz.w $1543,x
	ldy.w $0F03,x
	lda.w SPA,y
	cmp.w #$F3A6
	bcc CODE_9E95DA
	cmp.w #$F46B
	bcs CODE_9E95DA
	lda.w #$0000
	sta.w $14E3,y
	sta.w $1543,y
CODE_9E95DA:
	ldy.b $91
CODE_9E95DC:
	lda.w SPA,y
	cmp.w #$F3A6
	bcc CODE_9E960A
	cmp.w #$F46B
	bcs CODE_9E960A
	lda.w #$0000
	sta.w $14E3,y
	sta.w $1543,y
	ldx.w $0F03,y
	lda.w SPA,x
	cmp.w #$F3A6
	bcc CODE_9E9608
	cmp.w #$F46B
	bcs CODE_9E9608
	stz.w $14E3,x
	stz.w $1543,x
CODE_9E9608:
	ldx.b $95
CODE_9E960A:
	lda.b $AA
	sta.b $A9
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E9692
	lda.b $A9
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0005
	bcs CODE_9E9624
	lda.w #$0005
CODE_9E9624:
	sta.b $B5
	lda.w SPA,x
	cmp.w #$F208
	bcc CODE_9E963C
	cmp.w #$F343
	bcs CODE_9E963C
CODE_9E9633:
	lda.b $B5
	lsr a
	adc.b $B5
	sta.b $B5
	bra CODE_9E9649
