; Unidentified routine.
CODE_9ED421:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	ldy.w #$0004
	lda.w Xpos,x
	bpl CODE_9ED436
	ldy.w #$FFFC
CODE_9ED436:
	sty.b $A5
	lda.w #$00F9
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9ED447
	lda.w #$FF07
	sta.b $A9
CODE_9ED447:
	stz.w temp2,x
	jml.l CODE_9EA5A4
