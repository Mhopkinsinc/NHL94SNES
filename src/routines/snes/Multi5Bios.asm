; read the five pads: pads 1 and 2 from the auto read, pads 3 to 5 through the multitap
Multi5Bios:		; read the five pads: pads 1 and 2 from the auto read, pads 3 to 5 through the multitap
			;   on port 2 when $1A0C is set
	php
	sep #$20
	rep #$10
	stz.w $0ACD
	stz.w $0ACE
CODE_9B80B6:
	lda.w HVBJOY
	and.b #$01
	bne CODE_9B80B6
	ldx.w JOY1L
	stx.w JoyPad
	txa
	and.b #$0F
	sta.w $0ACA
	lda.w $4016
	lsr a
	rol.w $0ACA
	ldx.w JOY2L
	stx.w $0778
	txa
	and.b #$0F
	sta.w $0ACB
	lda.w $1A0C
	bne CODE_9B80E4
	jmp.w $81EC
