; Unidentified routine.
CODE_9B80E4:
	ldx.w JOY4L
	stx.w $077A
	txa
	and.b #$0F
	sta.w $0ACC
	lda.w JOYSER1
	lsr a
	rol.w $0ACB
	lsr a
	rol.w $0ACC
	stz.w WRIO
	lda.w $0AD7
	ora.w $1A0E
	bne CODE_9B811F
	lda.w $1C8A
	ora.w $1C8C
	bne CODE_9B811F
	lda.w $1A02
	beq CODE_9B811A
	dec a
	sta.w $1A02
	jmp.w CODE_9B81F3
