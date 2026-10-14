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
	bra .2

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
.2:
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
	beq .t1x
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
	bra .3

.t1x:
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
.3:
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
	beq .t1xx
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
	bra .4

.t1xx:
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
.4:
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
.1x:
	cmp.w #$0001
	beq .t1xxx
	lda.w $19C6
	bra .5

.t1xxx:
	lda.w $19C4
	bra .5

.t2:
	lda.w $19C2
.5:
	jsl.l CODE_9BA77C
	rtl
