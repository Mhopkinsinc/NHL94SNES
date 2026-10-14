; Unidentified routine.
CODE_9D9064:
	stz.w textdirtyhi
	lda.w #$FFFF
	sta.w textdirtylo
	rtl
