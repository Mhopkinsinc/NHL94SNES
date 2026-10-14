; Unidentified routine.
CODE_80D06A:
	lda.w #$3800
	sta.w $0D0D
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFBF
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DA7
	cmp.w $1DAB
	beq CODE_80D0BB
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFCA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_80D0BB:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w #$0009
	cmp.w $1DA3
	bpl CODE_80D0E5
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFD0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_80D0E5:
	jsl.l CODE_80D21C
	rtl
