; Unidentified routine.
CODE_9F8511:
	lda.b $83
	sec
	sbc.w $0D01
	beq CODE_9F8511
	inc.w $1D6D
	lda.w #$003C
	ldx.w $1D6D
	jsl.l CODE_808F98
	lda.w $0764
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $0A98
	lda.w gsp
	cmp.w #$0002
	bne CODE_9F8551
	lda.w MusicOn
	bne CODE_9F8551
	jsl.l RandomWord
	and.w #$0FFF
	bne CODE_9F8551
	lda.w #$0005
	jsl.l CODE_9C9B5F
CODE_9F8551:
	jsl.l RandomWord
	lda.b $83
	tax
	sec
	sbc.w $0D01
	sta.b d7
	sta.w $0ADB
	asl a
	sta.w $0CDD
	asl a
	asl a
	asl a
	sta.w $0CDF
	asl a
	sta.w $0CE1
	asl a
	adc.w $0CE1
	sta.w $0CE1
	stx.w $0D35
	stx.w $0D01
	jsl.l CODE_9B8017
	lda.w sflags
	bit.w #$0001
	bne CODE_9F85D3
	lda.w gmclock
	bne CODE_9F85D3
	lda.w $1D81
	bne CODE_9F85AA
	lda.w $163A
	beq CODE_9F85AA
	ldx.b d7
	lda.w $1E9F
	sec
	sbc.b d7
	sta.w $1E9F
	bne CODE_9F85A8
	jsl.l CODE_9EC791
CODE_9F85A8:
	bra CODE_9F85D3
