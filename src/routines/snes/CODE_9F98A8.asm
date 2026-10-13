; Unidentified routine.
CODE_9F98A8:
	lda.b $A5
	and.w #$000E
	sta.b $A5
	dec.b $A9
CODE_9F98B1:
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF813
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
	lda.b $A5
	and.w #$0001
	eor.w #$0001
	sta.b $A5
	lda.w #$009F
	sta.b $8F
	lda.w #HandedTextTbl
	sta.b $8D
	jml.l CODE_9ECFC6
