; start filling OAMDrawBuf after the reserved entries; free the tiles of frames not drawn
SpriteFrameStart:	; start filling OAMDrawBuf after the reserved entries; free the tiles of frames not drawn
			;   since the last call
	phb
	lda.w #$7E7E
	pha
	plb
	plb
	lda.w #$0080
	sec
	sbc.w SpritesReserved
	sta.w SpritesLeft
	lda.w SpritesReserved
	lsr a
	lsr a
	tax
	clc
	adc.w OAMDrawBuf
	adc.w #$0200
	sta.w OAMHiPtr
	txa
	and.w #$0003
	eor.w #$0003
	sta.w OAMHiShift
	lda.w SpritesReserved
	asl a
	asl a
	adc.w OAMDrawBuf
	sta.w OAMNext
	lda.w $07BA
	beq CODE_80AFDC
	dec a
	asl a
	tax
CODE_80AFB9:
	lda.w $2D40,x
	bmi CODE_80AFD8
	lsr a
	sta.w $2D40,x
	bcc CODE_80AFD8
	ldy.w $2B40,x
	sep #$20
	lda.b #$80
	pha
	rep #$20
	lda.w #CODE_80AFD8-1
	pha
	phx
	phy
	phb
	jmp.w CODE_80B772
