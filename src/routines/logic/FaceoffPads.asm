; At a faceoff: CalcPuckDistances, restore the pad sides kept in $19F6, reset the pad / player tables ($19D4, $19EC) and give each pad a player again (findpc)
FaceoffPads:
	jsl.l CalcPuckDistances
	lda.w $1E9B
	bne .2
	ldy.w #$0008
.loop:
	lda.w $19F6,y
	and.w #$FF00
	cmp.w #$8000
	bne .1
	lda.w $19F6,y
	and.w #$00FF
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.1:
	dey
	dey
	bpl .loop
.2:
	lda.w $19D0
	cmp.w #$0004
	bcc .6
	ldx.w #$000A
	ldy.w #$0000
.loop2:
	lda.w position,x
	beq .3
	bmi .3
	iny
.3:
	dex
	dex
	bpl .loop2
	sty.b d0
	ldx.w #$0008
	ldy.w #$0000
.loop3:
	lda.w $19F6,x
	cmp.w #$0000
	bne .4
	iny
.4:
	dex
	dex
	bpl .loop3
	cpy.b d0
	bcs .6
	cpy.w $19D0
	beq .6
	ldy.w $0AF9
.loop4:
	iny
	iny
	cpy.w #$000A
	bne .5
	ldy.w #$0000
.5:
	lda.w $19F6,y
	bpl .loop4
	and.w #$00FF
	cmp.w #$0080
	beq .loop4
	cmp.w #$0000
	bne .loop4
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.6:
	lda.w $19D2
	cmp.w #$0004
	bcc .10
	ldx.w #$0016
	ldy.w #$0000
.loop5:
	lda.w position,x
	beq .7
	bmi .7
	iny
.7:
	dex
	dex
	cpx.w #$000C
	bpl .loop5
	sty.b d0
	ldx.w #$0008
	ldy.w #$0000
.loop6:
	lda.w $19F6,x
	cmp.w #$0002
	bne .8
	iny
.8:
	dex
	dex
	bpl .loop6
	cpy.b d0
	bcs .10
	cpy.w $19D0
	beq .10
	ldy.w $0AFB
.loop7:
	iny
	iny
	cpy.w #$000A
	bne .9
	ldy.w #$0000
.9:
	lda.w $19F6,y
	bpl .loop7
	and.w #$00FF
	cmp.w #$0080
	beq .loop7
	cmp.w #$0002
	bne .loop7
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.10:
	stz.w benchcheer
	ldx.w #$0016
	lda.w #$FFFF
.loop8:
	sta.w $19D4,x
	stz.w $0B05,x
	stz.w $0BCB,x
	stz.w $0BEB,x
	stz.w $0C0B,x
	dex
	dex
	bpl .loop8
	sta.w dumpinplayer
	ldx.w #$0008
.loop9:
	sta.w $19EC,x
	dex
	dex
	bpl .loop9
	lda.w $19D0
	beq .15
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF5
	lda.w #$FFFF
	sta.w $0AF5
	dex
	dex
	bpl .11
	ldx.w #$0008
.11:
	lda.w $19F6,x
	bne .13
	stx.b d4
	phx
	lda.w $0AF5
	bpl .12
	stx.w $0AF5
.12:
	jsl.l findpc
	plx
.13:
	dex
	dex
	bpl .14
	ldx.w #$0008
.14:
	dec.b $0C
	bne .11
.15:
	lda.w $19D2
	beq .rtl
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF7
	lda.w #$FFFF
	sta.w $0AF7
	dex
	dex
	bpl .16
	ldx.w #$0008
.16:
	lda.w $19F6,x
	cmp.w #$0002
	bne .18
	stx.b d4
	phx
	lda.w $0AF7
	bpl .17
	stx.w $0AF7
.17:
	jsl.l findpc
	plx
.18:
	dex
	dex
	bpl .19
	ldx.w #$0008
.19:
	dec.b $0C
	bne .16
.rtl:
	rtl
