; Unidentified routine.
CODE_80AC4A:
	lda.w $07F5
	clc
	adc.b #$40
CODE_80AC50:
	sta.w $07F5
	cmp.w $07F6
	bcc CODE_80AC7A
	jsr.w CODE_80A549
	lda.w $07F1
	bne CODE_80AC71
	ldx.w $0801
	beq CODE_80AC7A
	dex
CODE_80AC66:
	jsr.w CODE_80A86F
	lda.w MusicOn
	beq CODE_80AC7A
	dex
	bpl CODE_80AC66
CODE_80AC71:
	lda.w $07F5
	sec
	sbc.w $07F6
	bra CODE_80AC50
