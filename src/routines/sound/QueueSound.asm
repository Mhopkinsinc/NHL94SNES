; Queue sound A for the sound driver
QueueSound:
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
.1:
	lda.w $092A,x
	cmp.b $4E
	beq .3
.2:
	inx
	inx
	iny
	cpy.b #$08
	bne .1
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w $07FF
	lda.b $4E
	sta.w $086A,x
	lda.w sflags
	bit.w #$0800
	bne .t1
	pla
	phx
	rep #$10
	ldx.w recsfx
	bmi .1x
	ldx.w recsfx
	stx.w recsfx2
	ldx.w recsfxpitch
	stx.w recsfxpitch2
	ldx.w recsfxvol
	stx.w recsfxvol2
.1x:
	sta.w recsfx
	sep #$10
	plx
	jmp.w PlaySoundEntry

.t1:
	pla
	jmp.w PlaySoundEntry
.3:
	lda.w $08F2,y
	and.w #$00FF
	beq .2
	pla
	tya
	and.w #$00FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
