; Unidentified routine.
CODE_9DA921:
	lda.b d3
	clc
	adc.b d2
	sta.b d3
	sec
	sbc.b d5
	bmi .t1
	bvs .1
	bra .2

.t1:
	bvs .2
.1:
	lda.b d4
	dec a
	sta.b d3
.2:
	lda.b d3
	sec
	sbc.b d4
	bmi .t1x
	bvc .3
	bra CODE_9DA920

.t1x:
	bvc CODE_9DA920
.3:
	lda.b d5
	sta.b d3
	rts

.t1xx:
	lda.b d3
	clc
	adc.b d2
	cmp.w #$0000
	beq .5
	cmp.w #$0003
	beq .5
	cmp.w #$0005
	beq .5
.4:
	sta.b d3
	lda.b d3
	sta.b [a2],y
	bra CODE_9DA920
.5:
	inc a
	cmp.w #$0005
	bcc .4
	lda.w #$0001
	sta.b d3
	bra .4
