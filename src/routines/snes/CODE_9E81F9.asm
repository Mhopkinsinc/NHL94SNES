; Unidentified routine.
CODE_9E81F9:
	lda.w pfalock,x
	beq .t1
	rtl

.t1:
	jsl.l CODE_9FDCB2
	lda.l $7E34C6
	beq .1
	lda.b d0
	sec
	sbc.w #$00CC
	sta.b d0
	jsl.l setpde
	lda.l $7E34C6
	cmp.w #$0002
	bne .1
	lda.w #$1000
	sta.b d0
.1:
	lda.b d0
	ldx.w #$0233
	jsl.l Mul16U
	ldx.b a3
	lda.b $0A
	sta.b $D7
	lda.w facedir,x
	asl a
	asl a
	tay
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80DA06
	sta.b a0
	lda.b [a0],y
	iny
	iny
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b a3
	clc
	adc.w $0EC3,x
	sta.w $0EC3,x
	lda.b [a0],y
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b a3
	clc
	adc.w $0EE3,x
	sta.w $0EE3,x
	lda.w #$F342
	sta.w pfalock,x
	jml.l CODE_9EA3F1
