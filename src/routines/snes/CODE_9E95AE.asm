; Unidentified routine.
CODE_9E95AE:
	lda.w SPA,x
	cmp.w #DATA8_9DF3A6
	bcc CODE_9E95DC
	cmp.w #DATA8_9DF46A+1
	bcs CODE_9E95DC
	stz.w pfalock,x
	stz.w pf2aip,x
	ldy.w $0F03,x
	lda.w SPA,y
	cmp.w #DATA8_9DF3A6
	bcc CODE_9E95DA
	cmp.w #DATA8_9DF46A+1
	bcs CODE_9E95DA
	lda.w #$0000
	sta.w pfalock,y
	sta.w pf2aip,y
CODE_9E95DA:
	ldy.b $91
CODE_9E95DC:
	lda.w SPA,y
	cmp.w #DATA8_9DF3A6
	bcc CODE_9E960A
	cmp.w #DATA8_9DF46A+1
	bcs CODE_9E960A
	lda.w #$0000
	sta.w pfalock,y
	sta.w pf2aip,y
	ldx.w $0F03,y
	lda.w SPA,x
	cmp.w #DATA8_9DF3A6
	bcc CODE_9E9608
	cmp.w #DATA8_9DF46A+1
	bcs CODE_9E9608
	stz.w pfalock,x
	stz.w pf2aip,x
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
	cmp.w #SPAsweepchk
	bcc CODE_9E963C
	cmp.w #SPAburst+1
	bcs CODE_9E963C
CODE_9E9633:
	lda.b $B5
	lsr a
	adc.b $B5
	sta.b $B5
	bra CODE_9E9649
