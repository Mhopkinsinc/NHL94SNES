; Unidentified routine.
CODE_9DA46E:
	bit.w #$0100
	beq CODE_9DA486
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9DA486
	cmp.w #$0002
	beq CODE_9DA45A
	lda.w #$0001
	sta.w $1C84,x
CODE_9DA486:
	inx
	inx
	lda.l $7E34BC
	cmp.w #$0004
	bne .1
	cpx.w #$0004
	bcs .t1
.1:
	cpx.w #$000A
	bcs .t1
	jmp.w CODE_9DA2F5

.t1:
	jsl.l SpriteFrameStart
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	lda.b $AB
	beq .1x
	lda.w #$001C
	sta.l $7E3454
.1x:
	ldx.w #$0047
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #PlayerSelectTitle
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l SendColours
	lda.b $10
	pha
	lda.b $12
	pha
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
.loop:
	phy
	lda.w $1A0E
	bne .2
	lda.w JoyPad,y
	and.w #$000F
	bne .2
	tya
	lsr a
	clc
	adc.w #$0185
	sta.b $00
	lda.b $AB
	asl a
	asl a
	clc
	adc.w $1C84,y
	asl a
	tax
	lda.l DATA8_9DA570,x
	pha
	tyx
	lda.l DATA8_9DA580,x
	tay
	plx
	lda.w #$2600
	jsl.l DrawSprite
	ply
	phy
	tya
	lsr a
	clc
	adc.w #$01B1
	sta.b $00
	lda.b $AB
	asl a
	asl a
	clc
	adc.w $1C84,y
	asl a
	tax
	lda.l DATA8_9DA570,x
	pha
	tyx
	lda.l DATA8_9DA580,x
	tay
	plx
	dey
	dey
	dex
	dex
	dex
	lda.w #$2000
	jsl.l DrawSprite
.2:
	ply
	iny
	iny
	lda.l $7E34BC
	cmp.w #$0004
	bne .3
	cpy.w #$0004
	bcs .4
.3:
	cpy.w #$000A
	bcc .loop
.4:
	pla
	sta.b $12
	pla
	sta.b $10
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jmp.w CODE_9DA29C
