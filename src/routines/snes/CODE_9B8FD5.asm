; Unidentified routine.
CODE_9B8FD5:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
CODE_9B8FDF:
	lda.b [a1]
	bmi .1
	dec.b d0
	bpl CODE_9B8FD5
.1:
	lda.b [a1]
	bpl .t1
	dec.w $0D47
	bra CODE_9B8FB5

.t1:
	lda.w #$3800
	sta.w $0D0D
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
org $9B9001
	lda.b [a1],y
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF086
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DA7
	cmp.w $1DAB
	beq .1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF091
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.1x:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl .2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF097
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2:
	jsr.w CODE_9B9249
	rtl
