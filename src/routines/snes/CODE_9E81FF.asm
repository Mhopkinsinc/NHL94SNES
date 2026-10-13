; Unidentified routine.
CODE_9E81FF:
	jsl.l CODE_9FDCB2
	lda.l $7E34C6
	beq CODE_9E8223
	lda.b $A5
	sec
	sbc.w #$00CC
	sta.b $A5
	jsl.l setpde
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9E8223
	lda.w #$1000
	sta.b $A5
CODE_9E8223:
	lda.b $A5
	ldx.w #$0233
	jsl.l Mul16U
	ldx.b $95
	lda.b $0A
	sta.b $D7
	lda.w $1163,x
	asl a
	asl a
	tay
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80DA06
	sta.b $89
	lda.b [$89],y
	iny
	iny
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b $95
	clc
	adc.w $0EC3,x
	sta.w $0EC3,x
	lda.b [$89],y
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b $95
	clc
	adc.w $0EE3,x
	sta.w $0EE3,x
	lda.w #$F342
	sta.w $14E3,x
	jml.l CODE_9EA3F1
