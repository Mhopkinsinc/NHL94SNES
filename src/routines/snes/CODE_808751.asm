; Unidentified routine.
CODE_808751:
	sty.w $076A
	rep #$20
	lda.b $0E
	sta.w $076E
	lda.b $0C
	sta.w $076C
	txa
	asl a
	sta.w $0768
	rtl
