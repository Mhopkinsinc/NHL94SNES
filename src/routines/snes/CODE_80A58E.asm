; Unidentified routine.
CODE_80A58E:
	lda.b $4C
	sta.b $56
	jsr.w CODE_80A568
	lda.b [$56]
	inc.b $56
	tay
	sty.b $60
	cpy.b #$D9
	bcc CODE_80A603
	cpy.b #$E7
	bne CODE_80A5B1
	lda.b [$56]
	and.w #$00FF
	sec
	adc.b $56
	sta.b $56
	jmp.w CODE_80A60F
