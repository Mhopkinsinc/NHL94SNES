; Unidentified routine.
CODE_9F8755:
	cpx.w #$001C
	bne CODE_9F875F
	lda.w $0DF9
	bne CODE_9F8796
CODE_9F875F:
	txy
	ldx.w $0ADB
	lda.l CODE_9F8B64,x
	and.w #$00FF
	sta.b d2
	lda.w pflags,y
	bit.w #$0001
	beq CODE_9F877D
	lda.l DATA8_9F8B6F-1,x
	and.w #$00FF
	sta.b d2
CODE_9F877D:
	ldx.w $0EC3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EC3,y
	ldx.w $0EE3,y
	lda.b d2
	jsl.l Mul16x8HiXS
	sta.w $0EE3,y
	tyx
CODE_9F8796:
	lda.w $0CDF
	sta.b $0C
	lda.w $0EC3,x
	beq CODE_9F87BA
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0D77,x
	sta.w $0D77,x
	lda.b $0A
	adc.w Xpos,x
	sta.w Xpos,x
CODE_9F87BA:
	lda.w $0EE3,x
	beq CODE_9F87D9
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DD9,x
	sta.w $0DD9,x
	lda.b $0A
	adc.w Ypos,x
	sta.w Ypos,x
CODE_9F87D9:
	cpx.w #$001C
	bne CODE_9F8834
	lda.w $0DF9
	bmi CODE_9F8834
	bne CODE_9F87EA
	lda.w $0E01
	beq CODE_9F8834
CODE_9F87EA:
	lda.w $0E01
	sec
	sbc.w $0CE1
	sta.w $0E01
	tax
	lda.w $0CDF
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DFD
	sta.w $0DFD
	lda.b $0A
	adc.w $0DF9
	sta.w $0DF9
	bpl CODE_9F8834
	stz.w $0DF9
	stz.w $0DFD
	lda.w $0E01
	eor.w #$FFFF
	inc a
	lsr a
	sta.w $0E01
	cmp.w #$0200
	bmi CODE_9F8834
	asl a
	asl a
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l CODE_9C9AD0
CODE_9F8834:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	bpl CODE_9F8843
	eor.w #$FFFF
	inc a
CODE_9F8843:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bpl CODE_9F885F
	eor.w #$FFFF
	inc a
CODE_9F885F:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	cpx.w #$0018
	bcs CODE_9F88A8
	sta.b $14
	lda.w position,x
	bmi CODE_9F88A8
	beq CODE_9F88A8
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne CODE_9F88A8
	lda.b $14
	cpx.w #$000C
	bcs CODE_9F889D
	cmp.w $17AE
	bcs CODE_9F88A8
	sta.w $17AE
	stx.w $17B2
	bra CODE_9F88A8
