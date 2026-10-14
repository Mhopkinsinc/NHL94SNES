; Unidentified routine.
CODE_9ED517:
	lda.w $1083,x
	bpl CODE_9ED522
	lda.w #$005A
	sta.w $1083,x
CODE_9ED522:
	lda.w #$FFFF
	sta.w $1063,x
	lda.w $1083,x
	sec
	sbc.w #$005A
	bpl CODE_9ED574
	jsl.l RandomWord
	cmp.w #$C000
	bcc CODE_9ED574
	lda.w #$0005
	sta.b $A5
	stz.b $89
	lda.w pfteam,x
	bne CODE_9ED54B
	lda.w #$000C
	sta.b $89
CODE_9ED54B:
	ldy.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9ED55D
	lda.w $0B1D,y
	cmp.w #$0023
	bcc CODE_9ED577
CODE_9ED55D:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9ED54B
	lda.w #$0001
	sta.w $0D2D
	jsl.l CODE_9EE89F
	lda.w $0AD9
	bmi CODE_9ED58C
CODE_9ED574:
	jmp.w CODE_9ED6AE
