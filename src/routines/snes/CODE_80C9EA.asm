; Unidentified routine.
CODE_80C9EA:
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF60
	sta.b $8D
	jsl.l CODE_9ECE15
CODE_80C9F8:
	pla
	sta.b $8D
	pla
	sta.b $A9
	ply
	plx
	lda.w #$0010
	sta.b $A5
CODE_80CA05:
	jsl.l CODE_9EB88A
	rtl
