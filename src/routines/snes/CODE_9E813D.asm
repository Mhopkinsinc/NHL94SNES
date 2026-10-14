; Unidentified routine.
CODE_9E813D:
	jsl.l randomd0
	lda.b d0
	cmp.w #$0002
	bcs CODE_9E814E
	lda.w #$00F0
	sta.w $1043,x
CODE_9E814E:
	lda.w $19D4,x
	bpl CODE_9E8101
	lda.w gmclock
	bne CODE_9E812F
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	bne CODE_9E8178
	lda.w $0AD9
	bmi CODE_9E8102
	lda.w $1043,x
	sec
	sbc.b d7
	sta.w $1043,x
	cmp.w #$0000
	bpl CODE_9E8102
	stz.w $1043,x
CODE_9E8178:
	jsl.l skatetopuckinit
	lda.b d1
	pha
	lda.b d0
	pha
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	clc
	adc.w #$00F4
	sta.b d1
	lda.w pfgoal,x
	beq CODE_9E81A1
	lda.b d1
	sec
	sbc.w #$01E8
	sta.b d1
CODE_9E81A1:
	lda.b d0
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.b d1
	pha
	asl a
	pla
	ror a
	sta.b d1
	pla
	clc
	adc.b d0
	sta.b d0
	pla
	clc
	adc.b d1
	sta.b d1
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	beq CODE_9E81E8
CODE_9E81C7:
	lda.w pfgoal,x
	beq CODE_9E81DB
	lda.b d1
	sec
	sbc.w #$0053
	bmi CODE_9E81E8
	lda.w #$0044
	sta.b d1
	bra CODE_9E81E8
