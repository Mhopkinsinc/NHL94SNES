; Unidentified routine.
CODE_9FBB79:
	lda.b d0
	sec
	sbc.w Hpos
	sta.b d0
	lda.b d1
	sec
	sbc.w Vpos
	sta.b d1
CODE_9FBB89:
	stz.b d2
	lda.b d0
	cmp.w #$0074
	bmi CODE_9FBB97
	lda.w #$0008
	sta.b d2
CODE_9FBB97:
	lda.b d0
	cmp.w #$FF8D
	bpl CODE_9FBBA3
	lda.w #$0004
	tsb.b d2
CODE_9FBBA3:
	lda.b d1
	cmp.w #$0064
	bmi CODE_9FBBAC
	inc.b d2
CODE_9FBBAC:
	lda.b d1
	cmp.w #$FF9D
	bpl CODE_9FBBB7
	inc.b d2
	inc.b d2
CODE_9FBBB7:
	ldx.b d2
	beq CODE_9FBC00
	lda.l DATA8_80DA46,x
	and.w #$00FF
	asl a
	asl a
	asl a
	tax
	lda.l DATA8_9FBC01,x
	beq CODE_9FBBCE
	sta.b d0
CODE_9FBBCE:
	lda.l DATA8_9FBC01+2,x
	beq CODE_9FBBD6
	sta.b d1
CODE_9FBBD6:
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
CODE_9FBC00:
	rts
