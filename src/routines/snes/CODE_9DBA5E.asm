; Unidentified routine.
CODE_9DBA5E:
	inc.w $0BE1
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	bne CODE_9DBAAB
	inc.w $0BDD
	lda.w $0BDD
	asl a
	tax
	lda.l CreditTitles,x
	beq CODE_9DBA94
	inc.w $0BE1
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$0000
	sta.w $0BD9
	lda.w #$000F
	bra CODE_9DBABA
