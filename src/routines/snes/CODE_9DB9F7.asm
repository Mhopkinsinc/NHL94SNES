; Unidentified routine.
CODE_9DB9F7:
	stz.w $0BDD
	stz.w $0BE1
	lda.w #$0000
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	stz.w $0BDB
	rts
