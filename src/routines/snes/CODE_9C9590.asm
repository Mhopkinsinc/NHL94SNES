; Unidentified routine.
CODE_9C9590:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
CODE_9C9599:
	tya
	cmp.b [a1]
	bne .t1
	jmp.w CODE_9C9622

.t1:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .t4
	lda.w #$0003
	bra CODE_9C9617

.t4:
	cmp.w #$002E
	bne .t1x
	lda.w #$0024
	bra .t3

.t1x:
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
	bcc .t1xx
	cmp.w #$007B
	bcs .t1xx
	sec
	sbc.w #$0061
	bra .t3

.t1xx:
	cmp.w #$0041
	bcc CODE_9C961E
	cmp.w #$005B
	bcs CODE_9C961E
	sec
	sbc.w #$0041
	bra .t3

.t3:
	tax
	phx
	phy
	lda.w #a3
	sta.b $12
	lda.w #SmallLetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.w #$0004
	cpx.w #$0024
	bne CODE_9C9617
	lda.w #$0002
CODE_9C9617:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C961E:
	iny
	jmp.w CODE_9C9599
