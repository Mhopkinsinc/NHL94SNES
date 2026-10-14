; Unidentified routine.
CODE_9C936C:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
.1:
	tya
	cmp.b [a1]
	bne .t4
	jmp.w .4

.t4:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .t1
	lda.w #$0006
	bra .2

.t1:
	cmp.w #$0030
	bcc .t2
	cmp.w #$003A
	bcs .t2
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra .t3

.t2:
	cmp.w #$0061
	bcc .t1x
	cmp.w #$007B
	bcs .t1x
	sec
	sbc.w #$0061
	bra .t3

.t1x:
	cmp.w #$0041
	bcc .3
	cmp.w #$005B
	bcs .3
	sec
	sbc.w #$0041
	bra .t3

.t3:
	tax
	phx
	phy
	lda.w #$0092
	sta.b $12
	lda.w #LetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.l DATA8_9C93F1,x
	and.w #$00FF
.2:
	clc
	adc.w $1E17
	sta.w $1E17
.3:
	iny
	jmp.w .1
.4:
	rtl
