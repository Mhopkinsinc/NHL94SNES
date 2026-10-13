; Unidentified routine.
CODE_9E9430:
	pla
	pla
	lda.b $A5
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E943F
	ora.w #$E000
CODE_9E943F:
	sta.b $A5
	cmp.w #$8000
	ror a
	clc
	adc.b $A5
	sta.b $A5
	ldy.b $91
	sta.w Xvel,y
	lda.b $A9
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E945C
	ora.w #$E000
CODE_9E945C:
	sta.b $A9
	cmp.w #$8000
	ror a
	clc
	adc.b $A9
	sta.b $A9
	sta.w Yvel,y
	stz.w Xvel,x
	stz.w Yvel,x
	lda.w #$0040
	tsb.w sflags
	lda.w gmclock
	bne CODE_9E942F
	pla
	lda.w #$0008
	sta.b $A5
	jmp.w $B88A
