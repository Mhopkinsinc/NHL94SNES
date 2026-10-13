; Unidentified routine.
CODE_9ECE69:
	stz.b $AD
	inc.b $AD
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
	stz.b $AD
CODE_9ECE88:
	asl a
	sta.b $A5
	tax
	lda.l DATA8_9ABD3D+6,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9ECEAC
	sta.w $0CD5
CODE_9ECEAC:
	clc
	adc.w #$0021
	cmp.w $0CD7
	bcc CODE_9ECEB8
	sta.w $0CD7
CODE_9ECEB8:
	ldx.b $A5
	lda.l $9ABDDB,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E3834,x
	lda.b $AD
	beq CODE_9ECF07
	ldx.b $A5
	lda.l DATA8_9ABD3D+8,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E37F6,x
	ldx.b $A5
	lda.l $9ABDDD,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E3836,x
	inc.w printx
CODE_9ECF07:
	inc.w printx
CODE_9ECF0A:
	iny
	jmp.w CODE_80CE2B
