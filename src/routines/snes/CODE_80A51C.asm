; Unidentified routine.
CODE_80A51C:
	rep #$20
	lda.w $091A,x
	bmi CODE_80A546
	bne CODE_80A543
	sep #$20
	lda.w $08F2,y
	cmp.b #$04
	beq CODE_80A542
	lda.w $08FA,y
	phx
	tax
	lda.w $08D0,x
	plx
	cmp.b #$00
	bne CODE_80A542
	rep #$20
	jsr.w CODE_80ABF7
	sep #$20
CODE_80A542:
	rts
