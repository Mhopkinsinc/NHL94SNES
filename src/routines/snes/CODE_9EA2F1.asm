; Unidentified routine.
CODE_9EA2F1:
	lda.w position,x
	beq CODE_9EA333
	lda.w $14E3,x
	bne CODE_9EA333
	ldy.b $91
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	jsl.l vtoa
	ldy.b $91
	lda.b $A5
	sec
	sbc.w $1163,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA333
	lda.w $0AD9
	cmp.b $95
	bne CODE_9EA334
	lda.w #$0008
	trb.w sflags
	bra CODE_9EA334
