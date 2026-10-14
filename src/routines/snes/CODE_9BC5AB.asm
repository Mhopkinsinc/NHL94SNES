; Unidentified routine.
CODE_9BC5AB:
	cmp.w #$000D
	beq .t1
	cmp.w #$000E
	beq .t2
	asl a
	asl a
	tay
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b a1
	lda.b [a1],y
	sta.b a1
	ldy.w #$0004
	clc
	adc.b [a1],y
	sta.b a1
	bra CODE_9BC5E6

.t1:
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9BC5E7
	sta.b a1
	bra CODE_9BC5E6

.t2:
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9BC5F5
	sta.b a1
CODE_9BC5E6:
	rtl
