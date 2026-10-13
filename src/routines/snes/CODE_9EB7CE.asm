; Unidentified routine.
CODE_9EB7CE:
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
	phx
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9EB7F8
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w #$0659
	sta.w $094A,y
	sta.w $0CAF
CODE_9EB7F8:
	rep #$20
	plx
CODE_9EB7FB:
	jsl.l PushTime
	jsl.l CODE_9EC7BE
	ldx.b $95
	lda.w tmdata,x
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72A
	sta.b $8D
	jsl.l appstring
	lda.b $89
	ldy.w #$0004
	clc
	adc.b [$89],y
	sta.b $89
	adc.b [$89]
	sta.b $89
	sta.b $8D
	lda.b $8B
	sta.b $8F
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	jsl.l CODE_9EC7BE
	rtl
