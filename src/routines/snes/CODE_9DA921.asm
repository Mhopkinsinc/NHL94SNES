; Unidentified routine.
CODE_9DA921:
	lda.b d3
	clc
	adc.b d2
	sta.b d3
	sec
	sbc.b d5
	bmi .t1
	bvs CODE_9DA933
	bra CODE_9DA938

.t1:
	bvs CODE_9DA938
CODE_9DA933:
	lda.b d4
	dec a
	sta.b d3
CODE_9DA938:
	lda.b d3
	sec
	sbc.b d4
	bmi .t1
	bvc CODE_9DA945
	bra CODE_9DA920

.t1:
	bvc CODE_9DA920
CODE_9DA945:
	lda.b d5
	sta.b d3
	rts

.t1:
	lda.b d3
	clc
	adc.b d2
	cmp.w #$0000
	beq CODE_9DA966
	cmp.w #$0003
	beq CODE_9DA966
	cmp.w #$0005
	beq CODE_9DA966
CODE_9DA95E:
	sta.b d3
	lda.b d3
	sta.b [a2],y
	bra CODE_9DA920
