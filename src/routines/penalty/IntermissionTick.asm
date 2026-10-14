; During the intermission, show the next ticker score, then the highlights
IntermissionTick:
	lda.w $0D2F
	beq CODE_9FA3BA
	lda.b $83
	sec
	sbc.w $0D33
	cmp.w #$0150
	bcc CODE_9FA3BA
	jsl.l TickerNext
	lda.l $7E35DC
	cmp.w $0D31
	bne IntermissionTick
	jsl.l DoHiLights
	lda.w #$0008
	trb.w sflags3
CODE_9FA3BA:
	lda.w #$0000
	rtl
