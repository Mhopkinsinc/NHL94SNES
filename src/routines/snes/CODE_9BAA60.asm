; Unidentified routine.
CODE_9BAA60:
	lda.w SoundFadeSpeed
	bne CODE_9BAA60
	jsl.l CODE_9C98DF
	lda.w #$0000
	sta.l $7E35E0
	lda.w #$0800
	tsb.w sflags
	jsl.l CODE_9FB9A4
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #DMA_OAM
	ldy.w #$0000
	jsl.l CODE_808862
	lda.w #$FFFF
	sta.w $0CAB
	sta.l $7E35F0
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0020
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0008
	sta.b $18
	lda.w #$0008
	sta.b $1A
	lda.w #$0000
	sta.w $079C
	lda.w #$2000
	sta.b $14
	lda.l $7E35AA
	ldx.w #$0002
	ldy.w #$0002
	jsl.l CODE_808A11
	lda.w ReplayBufferPtr
	pha
	lda.w $0D21
	pha
	lda.w #$0020
	trb.w sflags
	lda.w Vpos
	pha
	lda.w Hpos
	pha
	lda.w ReplayBufferPtr
	cmp.w #$577E
	lda.w $0D21
	sbc.w #$007E
	bcs CODE_9BAB07
CODE_9BAAFB:
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
CODE_9BAB07:
	lda.w #$E676
	cmp.w ReplayBufferPtr
	lda.w #$007E
	sbc.w $0D21
	bcc CODE_9BAAFB
	lda.w ReplayBufferPtr
	sec
	sbc.w #$577E
	sta.b $08
	lda.w $0D21
	sbc.w #$007E
	sta.b $0A
	lda.w #$007A
	sta.b $04
	jsl.l Div32U
	lda.b $0A
	bne CODE_9BAAFB
	lda.w $0D21
	sta.b $9B
	lda.w ReplayBufferPtr
	sta.b a4
	lda.w #$0000
	pha
CODE_9BAB41:
	jsl.l suba4
	pla
	inc a
	pha
	lda.b d7
	bne CODE_9BAB41
	pla
	lsr a
	pha
CODE_9BAB4F:
	lda.b $01,s
	beq CODE_9BAB5C
	jsl.l adda4
	pla
	dec a
	pha
	bra CODE_9BAB4F
