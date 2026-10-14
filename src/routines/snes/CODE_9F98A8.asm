; Unidentified routine.
CODE_9F98A8:
	lda.b d0
	and.w #$000E
	sta.b d0
	dec.b d1
CODE_9F98B1:
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF813
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
	lda.b d0
	and.w #$0001
	eor.w #$0001
	sta.b d0
	lda.w #$009F
	sta.b $8F
	lda.w #HandedTextTbl
	sta.b a1
	jml.l CODE_9ECFC6
