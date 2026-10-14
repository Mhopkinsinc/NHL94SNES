; Unidentified routine.
CODE_9C94D2:
	ldy.w #$0000
	lda.b $16
	beq .t1
	lda.b a2
	bmi .t1
	bne CODE_9C94F8
	lda.w #$00F8
	sec
	sbc.b $14
	sta.w $1E17
	bra CODE_9C94F8

.t1:
	lda.b $14
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C94F8:
	lda.b (d1),y
	and.w #$00FF
	bne .t4
	jmp.w CODE_9C958B

.t4:
	cmp.w #$0020
	bne .t2
	cpy.w #$0000
	bne .t1
	jmp.w CODE_9C9587

.t1:
	lda.w #$0005
	bra CODE_9C9580

.t2:
	cmp.w #$002E
	bne .t3
	ldx.w #$001A
	bra CODE_9C9545

.t3:
	cmp.w #$0040
	bne .t1x
	ldx.w #$001B
	bra CODE_9C9545

.t1x:
	cmp.w #$0030
	bcc .t2x
	cmp.w #$003A
	bcs .t2x
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	tax
	bra CODE_9C9545

.t2x:
	and.w #$00DF
	sec
	sbc.w #$0041
	tax
CODE_9C9545:
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
	bne .t1
	lda.w #$3800
	bra CODE_9C956D

.t1:
	lda.w #$3C00
	ldx.b a2
	bne CODE_9C956D
	lda.w #$3E00
CODE_9C956D:
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	plx
	ply
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C9580:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C9587:
	iny
	jmp.w CODE_9C94F8
