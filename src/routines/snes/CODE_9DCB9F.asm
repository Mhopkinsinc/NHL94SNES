; Unidentified routine.
CODE_9DCB9F:
	phy
	phx
	ldx.b $91
	jsl.l CODE_9DCC36
	lda.b $A5
	asl a
	tax
	lda.b $91
	beq CODE_9DCBC3
	lda.w #$2400
	sta.w $1E87
	lda.w #$2D00
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3472
	bra CODE_9DCBD5
