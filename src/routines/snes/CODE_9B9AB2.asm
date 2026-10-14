; Unidentified routine.
CODE_9B9AB2:
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF14B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .1

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF151
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.1:
	lda.w $1DBD
	dec a
	bmi .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF157
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF15D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2:
	jsl.l CODE_9FBF75
	rtl
