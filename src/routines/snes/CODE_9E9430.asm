; Unidentified routine.
CODE_9E9430:
	pla
	pla
	lda.b d0
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .1
	ora.w #$E000
.1:
	sta.b d0
	cmp.w #$8000
	ror a
	clc
	adc.b d0
	sta.b d0
	ldy.b a2
	sta.w Xvel,y
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2
	ora.w #$E000
.2:
	sta.b d1
	cmp.w #$8000
	ror a
	clc
	adc.b d1
	sta.b d1
	sta.w Yvel,y
	stz.w Xvel,x
	stz.w Yvel,x
	lda.w #$0040
	tsb.w sflags
	lda.w gmclock
	bne CODE_9E942F
	pla
	lda.w #$0008
	sta.b d0
	jmp.w CODE_9EB88A
