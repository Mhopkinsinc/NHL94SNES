; Draw the place name of team d1 (TeamPlaceNames), or string [a1] when d1 is negative, as letter sprites at X / Y
PrintTeamSprites:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	stz.b $16
	lda.b d1
	pha
	bmi .t1
	asl a
	tay
	lda.w TeamPlaceNames,y
	sta.b d1
	ldy.w #$0000
	bra PrintTeamSprites_go

.t1:
	inc.b $16
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	lda.b (a1)
	tay
	dey
	dey
	lda.b a1
	inc a
	inc a
	sta.b d1
	lda.w #$0000
	sta.b (d1),y
	ldy.w #$0000
PrintTeamSprites_go:
	lda.b (d1),y
	and.w #$00FF
	beq .4
	cmp.w #$0020
	bne .t3
	cpy.w #$0000
	beq .3
	lda.w #$0005
	bra .2

.t3:
	cmp.w #$002E
	bne .t1
	lda.w #$0003
	bra .2

.t1:
	cmp.w #$0040
	bne .t2
	lda.l DATA8_9C9623+$1B
	and.w #$00FF
	bra .2

.t2:
	cmp.w #$0030
	bcc .t1x
	cmp.w #$003A
	bcs .t1x
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra .1

.t1x:
	and.w #$00DF
	sec
	sbc.w #$0041
.1:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
.2:
	clc
	adc.b $14
	sta.b $14
.3:
	iny
	bra PrintTeamSprites_go
.4:
	ldy.w #$0000
	lda.b $16
	beq .t1xx
	lda.b a2
	bmi .t1xx
	bne .5
	lda.w #$00F8
	sec
	sbc.b $14
	sta.w $1E17
	bra .5

.t1xx:
	lda.b $14
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $1E17
	sta.w $1E17
.5:
	lda.b (d1),y
	and.w #$00FF
	bne .t4
	jmp.w .10

.t4:
	cmp.w #$0020
	bne .t2x
	cpy.w #$0000
	bne .t1xxx
	jmp.w .9

.t1xxx:
	lda.w #$0005
	bra .8

.t2x:
	cmp.w #$002E
	bne .t3x
	ldx.w #$001A
	bra .6

.t3x:
	cmp.w #$0040
	bne .t1xxxx
	ldx.w #$001B
	bra .6

.t1xxxx:
	cmp.w #$0030
	bcc .t2xx
	cmp.w #$003A
	bcs .t2xx
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	tax
	bra .6

.t2xx:
	and.w #$00DF
	sec
	sbc.w #$0041
	tax
.6:
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	phy
	phx
	txa
	clc
	adc.w #$03A0
	sta.b $00
	lda.l $7E3462
	bne .t1xxxxx
	lda.w #$3800
	bra .7

.t1xxxxx:
	lda.w #$3C00
	ldx.b a2
	bne .7
	lda.w #$3E00
.7:
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	plx
	ply
	lda.l DATA8_9C9623,x
	and.w #$00FF
.8:
	clc
	adc.w $1E17
	sta.w $1E17
.9:
	iny
	jmp.w .5
.10:
	pla
	sta.b d1
	plb
	rtl
