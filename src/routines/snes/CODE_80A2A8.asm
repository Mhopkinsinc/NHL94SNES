; Unidentified routine.
CODE_80A2A8:
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b $50
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
CODE_80A2C5:
	lda.w $092A,x
	cmp.b $4E
	bne CODE_80A2CF
	jsr.w CODE_80ABC7
CODE_80A2CF:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A2C5
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
