; Unidentified routine.
CODE_80C1F2:
	stx.b $00
	ldx.b #$02
CODE_80C1F6:
	asl a
	dey
	beq CODE_80C21A
CODE_80C1FA:
	inx
	bcc CODE_80C1F6
	stx.b $04
CODE_80C1FF:
	asl a
	rol.b $6F
	dey
	beq CODE_80C226
CODE_80C205:
	dex
	bne CODE_80C1FF
	sta.b $6C
	asl.b $04
	ldx.b $04
	lda.l DATA16_80C2BA-4,x
	ldx.b $00
	clc
	adc.b $6F
	sta.b $6F
	rts
