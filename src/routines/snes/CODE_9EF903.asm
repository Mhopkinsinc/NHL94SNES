; Unidentified routine.
CODE_9EF903:
	dec.b $A9
	bpl CODE_9EF8DB
	ldy.b $91
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	rtl
