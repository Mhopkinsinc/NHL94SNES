; Unidentified routine.
CODE_80A17D:
	phx
	phy
	phb
	php
	pha
	sep #$30
	dec.w SoundLock
	lda.b $50
	pha
	plb
	rep #$30
	lda.b $01,s
	sep #$10
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
CODE_80A19D:
	lda.w $092A,x
	cmp.b $4E
	beq CODE_80A1E9
CODE_80A1A4:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A19D
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w $07FF
	lda.b $4E
	sta.w $086A,x
	lda.w sflags
	bit.w #$0800
	bne CODE_80A1E5
	pla
	phx
	rep #$10
	ldx.w $0CAD
	bmi CODE_80A1DC
	ldx.w $0CAD
	stx.w $0CB3
	ldx.w $0CAF
	stx.w $0CB5
	ldx.w $0CB1
	stx.w $0CB7
CODE_80A1DC:
	sta.w $0CAD
	sep #$10
	plx
	jmp.w CODE_80A226
