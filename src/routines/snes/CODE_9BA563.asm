; Unidentified routine.
CODE_9BA563:
	lda.w $1DB9
	beq .t1
.1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF175
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF181
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9BA5D2

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF188
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF194
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9BA5D2:
	lda.w #$0014
	sta.w printx
	lda.w #$0011
	sta.w printy
	lda.w $19C2
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	cmp.w #$0001
	beq .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF19B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1A4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9BA662

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1AB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1B4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9BA662:
	lda.w #$0014
	sta.w printx
	lda.w #$0013
	sta.w printy
	lda.w $19C4
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	cmp.w #$0002
	beq .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1BB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1C7
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9BA6F2

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1CE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1DA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9BA6F2:
	lda.w #$0014
	sta.w printx
	lda.w #$0015
	sta.w printy
	lda.w $19C6
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	beq .t2
.1:
	cmp.w #$0001
	beq .t1
	lda.w $19C6
	bra CODE_9BA727

.t1:
	lda.w $19C4
	bra CODE_9BA727

.t2:
	lda.w $19C2
CODE_9BA727:
	jsl.l CODE_9BA77C
	rtl
