; Unidentified routine.
CODE_9EF0EC:
	jsl.l CODE_9EF213
	jsl.l a2touchpuck
	lda.w #$0006
	jsl.l CODE_9C9ABC
	lda.w puckvy
	cmp.w #$3000
	bpl CODE_9EF108
	cmp.w #$D000
	bpl CODE_9EF135
CODE_9EF108:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EF114
	sta.w $19BE
CODE_9EF114:
	ldy.b a2
	lda.w pfteam,y
	beq CODE_9EF124
	lda.w #$0004
	jsl.l CODE_9C9A7F
	bra CODE_9EF135
