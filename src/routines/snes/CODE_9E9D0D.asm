; Unidentified routine.
CODE_9E9D0D:
	ldy.b a3
	lda.w pfteam,y
	beq .1
	lda.w #$0002
.1:
	inc a
	inc a
	jsl.l CODE_9C9FD5
	lda.w #$0002
	sta.w $0C25
	lda.w #$F54E
	sta.b d1
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcc CODE_9E9D59
	lda.w #$F49C
	sta.b d1
	lda.w facedir,y
	and.w #$0003
	bne CODE_9E9D59
	lda.w $1483,x
	sec
	sbc.w #$000A
	bmi CODE_9E9D59
	cpx.w #$0018
	bcs CODE_9E9D59
	lda.w #$F6C0
	sta.b d1
CODE_9E9D59:
	ldx.b a2
	lda.w #$0001
	sta.w pfalock,x
	jsl.l SetSPA
	ldx.b a3
	lda.w position,x
	bne CODE_9E9D79
	cpx.w #$0018
	bcs CODE_9E9D79
	bra CODE_9E9D79
