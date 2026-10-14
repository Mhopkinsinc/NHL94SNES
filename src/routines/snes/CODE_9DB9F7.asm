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

.t2:
	lda.w $0764
	cmp.w $0BDB
	bcc .rts
	lda.w $0BD9
	cmp.w #$0003
	bne .t1
.rts:
	rts

.t1:
	cmp.w #$0000
	bne CODE_9DBA44
	lda.w $0BDF
	dec a
	dec a
	cmp.w #d5
	bmi CODE_9DBA53
	dec.w $0BDF
	dec.w $0BDF
CODE_9DBA39:
	dec.w $0BE3
	dec.w $0BE3
	lda.w #$0002
	bra CODE_9DBABA
