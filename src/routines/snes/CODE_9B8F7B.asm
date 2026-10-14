; Unidentified routine.
CODE_9B8F7B:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF081
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
.1:
	lda.w #SkaterAttribColumns
	sta.b a1
	lda.w #$009B
	sta.b $8F
	lda.w $0D47
	sta.b d0
	lda.w SelectedPlayerIdx
	bne .3
	lda.w #$D8CD
	sta.b a1
	lda.w #$0080
	sta.b $8F
	bra .3
.2:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
.3:
	lda.b [a1]
	bmi .1x
	dec.b d0
	bpl .2
.1x:
	lda.b [a1]
	bpl .t1
	dec.w $0D47
	bra .1

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
	beq .1xx
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
.1xx:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl .2x
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
.2x:
	jsr.w CODE_9B9249
	rtl
