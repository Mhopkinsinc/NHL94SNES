; Unidentified routine.
CODE_80C9EA:
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF60
	sta.b a1
	jsl.l CODE_9ECE15
CODE_80C9F8:
	pla
	sta.b a1
	pla
	sta.b d1
	ply
	plx
	lda.w #$0010
	sta.b d0
CODE_80CA05:
	jsl.l CODE_9EB88A
	rtl
