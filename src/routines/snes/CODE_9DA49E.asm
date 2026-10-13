; Unidentified routine.
CODE_9DA49E:
	jsl.l SpriteFrameStart
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	lda.b $AB
	beq CODE_9DA4BB
	lda.w #$001C
	sta.l $7E3454
CODE_9DA4BB:
	ldx.w #$0047
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF588
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l CODE_9DE0D4
	lda.b $10
	pha
	lda.b $12
	pha
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
CODE_9DA4EA:
	phy
	lda.w $1A0E
	bne CODE_9DA549
	lda.w $0776,y
	and.w #$000F
	bne CODE_9DA549
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
CODE_9DA549:
	ply
	iny
	iny
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA55A
	cpy.w #$0004
	bcs CODE_9DA55F
CODE_9DA55A:
	cpy.w #$000A
	bcc CODE_9DA4EA
CODE_9DA55F:
	pla
	sta.b $12
	pla
	sta.b $10
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jmp.w $A29C
