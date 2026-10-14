; Unidentified routine.
CODE_9FCB16:
	ldy.b d0
	lda.w $19D4,y
	bpl .6
	phx
	ldx.w #$0000
	cpy.w #$000C
	bcc .1
	ldx.w #$0002
.1:
	lda.w $19D0,x
	beq .4
	ldy.w $0AFD,x
	dey
	dey
	bpl .2
	ldy.w #$0008
.2:
	lda.w #$0005
	sta.b $14
	txa
.3:
	cmp.w $19F6,y
	bne .5
	sty.b d4
	tya
	sta.w $0AFD,x
	jsl.l CODE_9FCB68
.4:
	plx
	rtl
.5:
	dey
	dey
	bpl .1x
	ldy.w #$0008
.1x:
	dec.b $14
	bne .3
	plx
.6:
	rtl
