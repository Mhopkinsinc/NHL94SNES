; Unidentified routine.
CODE_9D842F:
	jsl.l InitScoutDisplay
	lda.w #$001D
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$001C
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w $1E41
	bmi .1
	lda.w #$001E
	sta.b [a0]
	inc.b a0
	inc.b a0
.1:
	lda.w HomeTeam
	sta.b d0
	lda.w #$001F
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w VisTeam
	cmp.b d0
	beq .2
	lda.w #$0020
	sta.b [a0]
	inc.b a0
	inc.b a0
.2:
	lda.w #$0021
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$FFFF
	sta.b [a0]
	stz.w $1D5E
	lda.w #$7FFF
	sta.w $0D41
	rtl
