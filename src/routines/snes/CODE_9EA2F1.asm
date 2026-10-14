; Unidentified routine.
CODE_9EA2F1:
	lda.w position,x
	beq CODE_9EA333
	lda.w pfalock,x
	bne CODE_9EA333
	ldy.b a2
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA333
	lda.w $0AD9
	cmp.b a3
	bne CODE_9EA334
	lda.w #$0008
	trb.w sflags
	bra CODE_9EA334
