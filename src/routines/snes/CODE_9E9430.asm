; Unidentified routine.
CODE_9E9430:
	pla
	pla
	lda.b d0
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E943F
	ora.w #$E000
CODE_9E943F:
	sta.b d0
	cmp.w #$8000
	ror a
	clc
	adc.b d0
	sta.b d0
	ldy.b a2
	sta.w $0EC3,y
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E945C
	ora.w #$E000
CODE_9E945C:
	sta.b d1
	cmp.w #$8000
	ror a
	clc
	adc.b d1
	sta.b d1
	sta.w $0EE3,y
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$0040
	tsb.w sflags
	lda.w gmclock
	bne CODE_9E942F
	pla
	lda.w #$0008
	sta.b d0
	jmp.w CODE_9EB88A
