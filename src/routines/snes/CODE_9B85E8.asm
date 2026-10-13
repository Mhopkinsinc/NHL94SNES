; Unidentified routine.
CODE_9B85E8:
	ldx.w #$0080
	stz.b $14
	stz.b $16
	lda.b $04
	asl a
	asl a
	tay
CODE_9B85F4:
	lda.b ($0C),y
	beq CODE_9B85DC
	xba
	tay
CODE_9B85FA:
	tya
	asl a
	bcc CODE_9B8603
	tay
	txa
	tsb.b $15
	tya
CODE_9B8603:
	asl a
	bcc CODE_9B860B
	tay
	txa
	tsb.b $14
	tya
CODE_9B860B:
	asl a
	bcc CODE_9B8613
	tay
	txa
	tsb.b $17
	tya
CODE_9B8613:
	asl a
	bcc CODE_9B861B
	tay
	txa
	tsb.b $16
	tya
CODE_9B861B:
	tay
	txa
	lsr a
	tax
	cpx.w #$0010
	bcs CODE_9B85FA
	cpx.w #$0000
	beq CODE_9B8637
	cpx.w #$0008
	bcc CODE_9B85FA
	lda.b $04
	asl a
	asl a
	tay
	iny
	iny
	bra CODE_9B85F4
