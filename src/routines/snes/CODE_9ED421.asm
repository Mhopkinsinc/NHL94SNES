; Unidentified routine.
CODE_9ED421:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	ldy.w #$0004
	lda.w Xpos,x
	bpl .1
	ldy.w #$FFFC
.1:
	sty.b d0
	lda.w #$00F9
	sta.b d1
	lda.w pfgoal,x
	beq .2
	lda.w #$FF07
	sta.b d1
.2:
	stz.w $1023,x
	jml.l skateto
