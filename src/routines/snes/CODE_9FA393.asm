; Unidentified routine.
CODE_9FA393:
	lda.w $0D2F
	beq CODE_9FA3BA
	lda.b $83
	sec
	sbc.w $0D33
	cmp.w #$0150
	bcc CODE_9FA3BA
	jsl.l CODE_9FA3BE
	lda.l $7E35DC
	cmp.w $0D31
	bne CODE_9FA393
	jsl.l CODE_9FA636
	lda.w #$0008
	trb.w sflags3
CODE_9FA3BA:
	lda.w #$0000
	rtl
