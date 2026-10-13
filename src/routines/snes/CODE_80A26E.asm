; Unidentified routine.
CODE_80A26E:
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
CODE_80A28B:
	lda.w $092A,x
	cmp.b $4E
	bne CODE_80A297
	jsr.w CODE_80ABF7
	bra CODE_80A29E
