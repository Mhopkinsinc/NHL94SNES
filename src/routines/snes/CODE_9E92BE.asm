; Unidentified routine.
CODE_9E92BE:
	lda.w puckvx
	cmp.w #$0800
	bpl .2
	cmp.w #$F800
	bmi .2
	cmp.w #$0000
	bpl .t1
	lda.w #$F800
	sta.w puckvx
	bra .2

.t1:
	lda.w #$0800
	sta.w puckvx
.2:
	stz.b d0
	lda.w #$00FF
	sta.b d1
	lda.w $0D71
	sec
	sbc.w $0E5F
	sta.b d2
	bmi .1
	lda.w #$FF01
	sta.b d1
.1:
	jmp.w CODE_9E8F42
