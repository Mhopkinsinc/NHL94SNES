; Unidentified routine.
CODE_9EDF9D:
	lda.w pf2aip,y
	beq CODE_9EDFA9
	stz.b d3
	lda.w #$0001
	sta.b d4
CODE_9EDFA9:
	iny
	iny
	dec.b d3
	bpl CODE_9EDF84
CODE_9EDFAF:
	lda.b d4
	jsl.l CODE_9BB370
	cmp.w #$0009
	bcs .t1
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:
	lda.b d0
	bmi .t1
	lda.w #$0108
	sec
	sbc.b d0
	bmi .t1
	lda.w $163A
	beq .2
	lda.w #$00B0
	lsr a
	lsr a
	clc
	adc.w #$0058
	sec
	sbc.b d0
	bpl .t1
.2:
	lda.w sflags
	bit.w #$8000
	bne .t1
	jmp.w CompShoot

.t1:
	rtl
