; Unidentified routine.
CODE_9EF69A:
	lda.b $A5
	sta.b $AD
	lda.w puckvx
	phx
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $A7
	lda.b $08
	sta.b $A5
	lda.w puckvy
	tax
	jsl.l Mul16S
	plx
	lda.b $08
	clc
	adc.b $A5
	sta.b $A5
	lda.b $0A
	adc.b $A7
	sta.b $A7
	stz.b $A9
	lda.w sflags
	bit.w #$1000
	bne CODE_9EF6E1
	ldy.b $91
	lda.w $1403,y
	phx
	ldx.w #$02BC
	jsl.l CODE_808F98
	lda.b $08
	sta.b $A9
	plx
CODE_9EF6E1:
	lda.b $A9
	clc
	adc.w #$2710
	ldy.w position,x
	beq CODE_9EF6F1
	cpx.w $0D07
	bne CODE_9EF6F4
CODE_9EF6F1:
	adc.w #$0BB8
CODE_9EF6F4:
	phx
	tax
	jsl.l Mul16U
	plx
	lda.b $08
	cmp.b $A5
	lda.b $0A
	sbc.b $A7
	bcs CODE_9EF71F
	lda.w position,x
	beq CODE_9EF714
	lda.b $AD
	cmp.w #$0025
	bcc CODE_9EF714
	jmp.w $F699
