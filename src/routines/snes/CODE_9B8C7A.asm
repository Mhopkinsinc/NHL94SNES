; Unidentified routine.
CODE_9B8C7A:
	sta.w $1D8F
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9B9320
	sec
	adc.b d0
	sta.b d0
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0001
	beq .2
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t3
	cmp.w #$0004
	beq .t2
	lda.b d0
	inc a
	inc a
	sta.b a3
	jsr.w CODE_9B8D72
	cmp.w $1D8F
	bne .t1
	jsr.w CODE_9B8D4D
	bra .4

.t1:
	lda.b d0
	inc a
	inc a
	inc a
	bra .1

.t2:
	lda.b d0
	clc
	adc.w #$0004
	sta.b a3
	jsr.w CODE_9B8D72
	cmp.w $1D8F
	bne .t1x
	dec.b a3
	jsr.w CODE_9B8D32
	bra .4

.t1x:
	lda.b d0
	inc a
	inc a
	bra .1

.t3:
	lda.b d0
	clc
	adc.w #$0004
	sta.b a3
	jsr.w CODE_9B8D72
	cmp.w $1D8F
	bne .t1x2
	jsr.w CODE_9B8D4D
	bra .4

.t1x2:
	lda.b d0
	inc a
	inc a
	inc a
	bra .3

.t4:
	lda.b d0
.1:
	sta.b a3
	jsr.w CODE_9B8D72
	cmp.w $1D8F
	bne .4
	jsr.w CODE_9B8D32
	bra .4
.2:
	lda.b d0
	inc a
.3:
	sta.b a3
	jsr.w CODE_9B8D72
	cmp.w $1D8F
	bne .4
	dec.b a3
	jsr.w CODE_9B8D32
.4:
	lda.b d0
	clc
	adc.w $1D9F
	sbc.w $1D8B
	sta.b a3
	lda.w $1D8F
	jsr.w CODE_9B8D7C
	rts
