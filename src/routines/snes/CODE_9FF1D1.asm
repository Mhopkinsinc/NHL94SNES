; Unidentified routine.
CODE_9FF1D1:
	lda.w $1A0E
	beq .rtl
.loop:
	jsl.l .t4
	lda.w $1A0E
	bne .loop
	jsl.l CODE_9FEA24
.rtl:
	rtl

.t4:
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF92C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	pla
	bit.w #$0001
	bne .t1
	bit.w #$0002
	bne .t2
	bit.w #$0004
	bne .t3
	jmp.w CODE_9FF2CC

.t1:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF35F
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF372
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF385
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF394
	sta.b a1
	jsl.l CODE_9FF329
	bra CODE_9FF2CC

.t2:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3A0
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3B6
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3CC
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3E0
	sta.b a1
	jsl.l CODE_9FF329
	bra CODE_9FF2CC

.t3:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3EE
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF404
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF41A
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF42E
	sta.b a1
	jsl.l CODE_9FF329
CODE_9FF2CC:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	rtl
