; Unidentified routine.
CODE_9E9D0D:
	ldy.b $95
	lda.w pfteam,y
	beq CODE_9E9D17
	lda.w #$0002
CODE_9E9D17:
	inc a
	inc a
	jsl.l CODE_9C9FD5
	lda.w #$0002
	sta.w $0C25
	lda.w #SPAfallback
	sta.b $A9
	ldy.b $91
	lda.b $A5
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcc CODE_9E9D59
	lda.w #SPAfallfwd
	sta.b $A9
	lda.w facedir,y
	and.w #$0003
	bne CODE_9E9D59
	lda.w aggress,x
	sec
	sbc.w #$000A
	bmi CODE_9E9D59
	cpx.w #$0018
	bcs CODE_9E9D59
	lda.w #SPAflip
	sta.b $A9
CODE_9E9D59:
	ldx.b $91
	lda.w #$0001
	sta.w pfalock,x
	jsl.l SetSPA
	ldx.b $95
	lda.w position,x
	bne CODE_9E9D79
	cpx.w #$0018
	bcs CODE_9E9D79
	bra CODE_9E9D79
