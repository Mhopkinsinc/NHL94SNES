; Unidentified routine.
CODE_9D81DE:
	lda.w $1E3F
	bne CODE_9D81EF
	lda.w $1E3D
	inc a
	cmp.w #$012C
	bcs CODE_9D8246
	sta.w $1E3D
CODE_9D81EF:
	stz.w $1D5E
	lda.w JoyPad
	ora.w $0778
	bit.w #DMA_OAM
	beq CODE_9D8203
	lda.w #$FFFF
	sta.w $1D5E
CODE_9D8203:
	jsl.l UpdateScoutingDisplay
	lda.w $1E3F
	bne CODE_9D8217
	lda.l $7E34CC
	bne CODE_9D8217
	dec.w $0D41
	bmi CODE_9D821A
CODE_9D8217:
	jmp.w CODE_9D8195
