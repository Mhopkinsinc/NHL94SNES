; Unidentified routine.
CODE_9B8C7A:
	sta.w $1D8F
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9B9320
	sec
	adc.b d0
	sta.b d0
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0001
	beq CODE_9B8D0E
	cmp.w #$0002
	beq CODE_9B8CFD
	cmp.w #$0003
	beq CODE_9B8CE1
	cmp.w #$0004
	beq CODE_9B8CC4
	lda.b d0
	inc a
	inc a
	sta.b a3
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CBD
	jsr.w CODE_9B8D4D
	bra CODE_9B8D20
