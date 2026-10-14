; Unidentified routine.
CODE_9E813D:
	jsl.l randomd0
	lda.b d0
	cmp.w #$0002
	bcs CODE_9E814E
	lda.w #$00F0
	sta.w temp3,x
CODE_9E814E:
	lda.w $19D4,x
	bpl CODE_9E8101
	lda.w gmclock
	bne CODE_9E812F
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	bne .1
	lda.w puckc
	bmi CODE_9E8102
	lda.w temp3,x
	sec
	sbc.b d7
	sta.w temp3,x
	cmp.w #$0000
	bpl CODE_9E8102
	stz.w temp3,x
.1:
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
	beq .2
	lda.b d1
	sec
	sbc.w #$01E8
	sta.b d1
.2:
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
.3:
	lda.w pfgoal,x
	beq .t1
	lda.b d1
	sec
	sbc.w #$0053
	bmi CODE_9E81E8
	lda.w #$0044
	sta.b d1
	bra CODE_9E81E8

.t1:
	lda.b d1
	sec
	sbc.w #$FFAD
	bpl CODE_9E81E8
	lda.w #$FFBC
	sta.b d1
CODE_9E81E8:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jsl.l CODE_9EA5A4
	jmp.w check4check
