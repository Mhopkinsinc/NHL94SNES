; Unidentified routine.
CODE_9EF903:
	dec.b d1
	bpl CODE_9EF8DB
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	rtl
