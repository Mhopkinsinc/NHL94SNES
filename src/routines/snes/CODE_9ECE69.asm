; Unidentified routine.
CODE_9ECE69:
	stz.b d2
	inc.b d2
	tax
	lda.l DATA8_80D6FE,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ECE7D
	ora.w #$FF00
CODE_9ECE7D:
	cmp.w #$0000
	bpl CODE_9ECE88
	eor.w #$FFFF
	inc a
	stz.b d2
CODE_9ECE88:
	asl a
	sta.b d0
	tax
	lda.l DATA8_9ABD3D+6,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs CODE_9ECEAC
	sta.w textdirtylo
CODE_9ECEAC:
	clc
	adc.w #$0021
	cmp.w textdirtyhi
	bcc CODE_9ECEB8
	sta.w textdirtyhi
CODE_9ECEB8:
	ldx.b d0
	lda.l $9ABDDB,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E3834,x
	lda.b d2
	beq CODE_9ECF07
	ldx.b d0
	lda.l DATA8_9ABD3D+8,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E37F6,x
	ldx.b d0
	lda.l $9ABDDD,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E3836,x
	inc.w printx
CODE_9ECF07:
	inc.w printx
CODE_9ECF0A:
	iny
	jmp.w CODE_80CE2B
