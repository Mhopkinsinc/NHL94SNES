; Unidentified routine.
CODE_9BA23C:
	lda.w #$FF00
	sta.l $7E3394,x
	lda.b $A5
	sec
	sbc.w #$FF00
CODE_9BA249:
	tax
	lda.b $AD
	jsl.l DivX8S
	ldx.b $B5
	sta.l $7E33D0,x
	lda.b $AD
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $B5
	sta.b $AD
	asl a
	adc.b $AD
	sta.l $7E33BC,x
	jsl.l RandomWord
	lsr a
	lsr a
	and.w #$0003
	beq CODE_9BA276
	dec a
CODE_9BA276:
	sta.b $AD
	asl a
	adc.b $AD
	sta.l $7E3434,x
	lda.w #$0000
	sta.l $7E33F8
	inc a
	sta.l $7E340C,x
	lda.l DATA8_9BA414,x
	sta.l $7E3420,x
CODE_9BA293:
	lda.l $7E3434,x
	clc
	adc.l $7E340C,x
	clc
	adc.w #$03C5
	sta.b $00
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.l $7E33BC,x
	lsr a
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2C9
	ora.w #$F000
CODE_9BA2C9:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2DA
	ora.w #$F000
CODE_9BA2DA:
	tax
	lda.w #$2000
	jsl.l DrawSprite
	ldx.b $B5
	lda.w #$03CF
	sta.b $00
	lda.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2F9
	ora.w #$F000
CODE_9BA2F9:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA30A
	ora.w #$F000
CODE_9BA30A:
	tax
	lda.w #$2000
	jsl.l DrawSprite
CODE_9BA312:
	ldx.b $B5
	dex
	dex
	bmi CODE_9BA31B
	jmp.w CODE_9BA1B8
