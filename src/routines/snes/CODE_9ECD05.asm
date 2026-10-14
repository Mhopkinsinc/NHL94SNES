; Unidentified routine.
CODE_9ECD05:
	lda.w tmdata
	sta.b a1
CODE_9ECD0A:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b a1
	clc
	adc.b [a1],y
	sta.b a1
CODE_9ECD19:
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
CODE_9ECD36:
	ldy.w #$0003
.loop:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .2
	lda.b [a1]
	pha
	tya
	dec a
	dec a
	sta.b d4
	tya
	sta.b [a1]
	lda.b a1
	pha
	jsl.l .3
	dec.w PlayerScrollCtr
	pla
	sta.b a1
	lda.b a1
	clc
	adc.b d4
	sta.b a1
	pla
	sec
	sbc.b d4
	sta.b [a1]
	lda.b d0
	cmp.w #$0015
	bmi .1
	lda.b d4
	sta.b d0
.1:
	ldy.w #$0002
.2:
	iny
	tya
	cmp.b [a1]
	bmi .loop
.3:
	inc.w PlayerScrollCtr
	lda.b d0
	clc
	adc.b [a1]
	dec a
	sta.b d0
	lda.b [a1]
	dec a
	tay
	dec a
	sta.b d1
	lda.b [a1],y
	and.w #$00FF
	beq .t1
	jmp.w CODE_9ECB2B

.t1:
	dec.b d1
	jmp.w CODE_9ECB2B
