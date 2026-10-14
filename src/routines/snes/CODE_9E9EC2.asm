; Unidentified routine.
CODE_9E9EC2:
	lda.b d0
	sta.b d5
	lda.w Xpos,y
	sta.b d2
	lda.w Ypos,y
	sta.b d3
	ldx.w #$0048
	ldy.w #$00EA
	lda.b d2
	bpl CODE_9E9EDD
	ldx.w #$FFB8
CODE_9E9EDD:
	lda.b d3
	bpl CODE_9E9EE4
	ldy.w #$FF16
CODE_9E9EE4:
	stx.b $A7
	sty.b $AB
	lda.b d2
	sec
	sbc.b $A7
	sta.b d0
	lda.b d3
	sec
	sbc.b $AB
	sta.b d1
	ldy.b d0
	jsl.l CODE_9CA554
	ldy.b a2
	sta.b d4
	cmp.w #$0014
	bcs CODE_9E9F0A
	ldx.b a3
	jmp.w CODE_9E9D0D
