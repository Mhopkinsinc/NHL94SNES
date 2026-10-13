; Unidentified routine.
pucknothing:
	lda.w $11DF
	cmp.w #$0008
	bcc CODE_9EDE97
	cmp.w #$0018
	bcs CODE_9EDE97
	lda.w $117F
	eor.w #$0002
	sta.w $117F
CODE_9EDE97:
	lda.w #$0004
	tsb.w $117F
	stz.w $11DF
	lda.w #$FFFF
	sta.w $11FF
	rtl
