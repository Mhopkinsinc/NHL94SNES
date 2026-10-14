; Unidentified routine.
CODE_9FBAAA:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0038
	bne .loop
	ldx.b xsave
	jsl.l show_rink
	jsl.l CODE_9FB1FD
	jsl.l .t3
	jsl.l CODE_9CA054
	jsl.l CODE_9FBC5F
	jsl.l showclock
	jsl.l showzam
	jsl.l CODE_9B9FAF
	jsl.l showref
	jsl.l CODE_9FBFA0
	lda.w sfhormode
	beq .1
	jsl.l CODE_9F9E24
.1:
	jsl.l CODE_9FBF75
	stx.b xsave
	ldx.w #$0036
.loop2:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop2
	ldx.b xsave
	ldx.b a3
	rtl

.t3:
	lda.w $1EBB
	bne .rtl
	lda.w sflags
	and.w #$0800
	bne .rtl
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
	lda.w #$0175
	sta.b $00
	jsr.w .t1
	ldy.w #$0002
	lda.w #$0178
	sta.b $00
	jsr.w .t1
	ldy.w #$0004
	lda.w #$017B
	sta.b $00
	jsr.w .t1
	ldy.w #$0006
	lda.w #$017E
	sta.b $00
	jsr.w .t1
	ldy.w #$0008
	lda.w #$0181
	sta.b $00
	jsr.w .t1
.rtl:
	rtl

.t1:
	lda.w $19EC,y
	bpl .t2
	rts

.t2:
	tay
	lda.w Xpos,y
	sta.b d0
	lda.w Ypos,y
	sta.b d1
	lda.w sfhormode
	beq .t1x
	lda.b d1
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.w Xpos,y
	sec
	sbc.w #$00C5
	sta.b d1
	bra .7

.t1x:
	lda.b d0
	sec
	sbc.w Hpos
	sta.b d0
	lda.b d1
	sec
	sbc.w Vpos
	sta.b d1
.7:
	stz.b d2
	lda.b d0
	cmp.w #$0074
	bmi .1x
	lda.w #$0008
	sta.b d2
.1x:
	lda.b d0
	cmp.w #$FF8D
	bpl .2
	lda.w #$0004
	tsb.b d2
.2:
	lda.b d1
	cmp.w #$0064
	bmi .3
	inc.b d2
.3:
	lda.b d1
	cmp.w #$FF9D
	bpl .4
	inc.b d2
	inc.b d2
.4:
	ldx.b d2
	beq .rts
	lda.l jdtab8F,x
	and.w #$00FF
	asl a
	asl a
	asl a
	tax
	lda.l DATA8_9FBC01,x
	beq .5
	sta.b d0
.5:
	lda.l DATA8_9FBC01+2,x
	beq .6
	sta.b d1
.6:
	lda.b $00
	clc
	adc.l DATA8_9FBC01+4,x
	sta.b $00
	lda.l DATA8_9FBC01+6,x
	sta.b $14
	lda.b d0
	clc
	adc.w #$0080
	tax
	lda.b d1
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0070
	tay
	lda.w #$2000
	ora.b $14
	jsl.l DrawSprite
.rts:
	rts
