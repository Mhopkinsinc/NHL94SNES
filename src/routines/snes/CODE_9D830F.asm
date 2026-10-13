; Unidentified routine.
CODE_9D830F:
	lda.w VisTeam
	sta.w $1E41
	lda.w $1E47
	sec
	sbc.w $1E45
CODE_9D831C:
	cmp.w #$0008
	bcs CODE_9D832F
	stz.w $1E43
	cmp.w #$0004
	bcs CODE_9D832F
	lda.w #$FFFF
	sta.w $1E41
CODE_9D832F:
	rtl
