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
	sta.w $0EC3,y
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
	sta.w $0EE3,y
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$0040
	tsb.w sflags
	lda.w $15D6
	bne CODE_9E942F
	pla
	lda.w #$0008
	sta.b $A5
	jmp.w CODE_9EB88A
