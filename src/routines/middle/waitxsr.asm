; Wait d0 frames or until a button in d1 is pressed
waitxsr:
	phx
	lda.b d0
	pha
.loop:
	ldx.w #$0000
.loop2:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq .1
	txa
	jsl.l ReadjoyA
	lda.b d3
	bne .2
.1:
	inx
	cpx.w #$0005
	bcc .loop2
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	lda.b $83
.loop3:
	cmp.b $83
	beq .loop3
	jsl.l ReadPads
	pla
	dec a
	pha
	bpl .loop
.2:
	pla
	plx
	rtl
