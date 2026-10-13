; Unidentified routine.
CODE_80B8AE:
	phb
	pea.w $7E7E
	plb
	plb
	stz.b $14
	lda.w $07B8
CODE_80B8B9:
	tax
	lda.w $2F40,x
	and.w #$00FF
	beq CODE_80B8D7
	cmp.w #$0010
	bcs CODE_80B8CC
	clc
	adc.b $14
	sta.b $14
CODE_80B8CC:
	and.w #$003F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B8B9
