; Unidentified routine.
CODE_9B9A5D:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF138
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.w #$2400
	sta.w printa
	lda.w #$000A
	sta.w printx
	lda.w #$0007
	sta.w printy
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF13D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
