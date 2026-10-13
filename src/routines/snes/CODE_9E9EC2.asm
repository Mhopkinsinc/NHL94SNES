; Unidentified routine.
CODE_9E9EC2:
	lda.b $A5
	sta.b $B9
	lda.w Xpos,y
	sta.b $AD
	lda.w Ypos,y
	sta.b $B1
	ldx.w #$0048
	ldy.w #$00EA
	lda.b $AD
	bpl CODE_9E9EDD
	ldx.w #$FFB8
CODE_9E9EDD:
	lda.b $B1
	bpl CODE_9E9EE4
	ldy.w #$FF16
CODE_9E9EE4:
	stx.b $A7
	sty.b $AB
	lda.b $AD
	sec
	sbc.b $A7
	sta.b $A5
	lda.b $B1
	sec
	sbc.b $AB
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	ldy.b $91
	sta.b $B5
	cmp.w #$0014
	bcs CODE_9E9F0A
	ldx.b $95
	jmp.w $9D0D
