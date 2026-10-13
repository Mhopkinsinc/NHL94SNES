; Unidentified routine.
CODE_9B81EC:
	lda.w $4017
	lsr a
	rol.w $0ACB
CODE_9B81F3:
	lda.b #$80
	sta.w WRIO
	lda.w $1A0E
	and.b #$01
	sta.w $1A0E
	lda.w $1A04
	beq CODE_9B8208
CODE_9B8205:
	dec.w $1A04
CODE_9B8208:
	stz.w $4016
	lda.b #$01
	sta.w $4016
	lda.w $4016
	and.b #$02
	tax
	eor.w $1A06
	stx.w $1A06
	sta.w $1A0A
	lda.w $4017
	and.b #$02
	tax
	eor.w $1A08
	stx.w $1A08
	ora.w $1A0A
	beq CODE_9B8235
CODE_9B8230:
	lda.b #$10
	sta.w $1A04
CODE_9B8235:
	lda.w $1A04
	bne CODE_9B823C
	bra CODE_9B8274
