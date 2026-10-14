; Unidentified routine.
CODE_9ED517:
	lda.w $1083,x
	bpl .1
	lda.w #$005A
	sta.w $1083,x
.1:
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
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	bne .2
	lda.w #$000C
	sta.b a0
.2:
	ldy.b a0
	lda.w pflags,y
	bit.w #$1000
	bne .3
	lda.w $0B1D,y
	cmp.w #$0023
	bcc CODE_9ED577
.3:
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .2
	lda.w #$0001
	sta.w $0D2D
	jsl.l chk4pass
	lda.w puckc
	bmi CODE_9ED58C
CODE_9ED574:
	jmp.w CODE_9ED6AE
CODE_9ED577:
	ldy.w #$0000
	cmp.w #$0014
	bcs CODE_9ED574
	lda.w #$005A
	sta.w $1543,x
	lda.w #$E66C
	jsl.l SetSPAFromA
CODE_9ED58C:
	rtl
