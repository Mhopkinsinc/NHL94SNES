; Unidentified routine.
CODE_80BC02:
	lda.b $75
	sta.b $00
	lda.b $14
	clc
	beq CODE_80BC10
CODE_80BC0B:
	asl.b $00
	dec a
	bne CODE_80BC0B
CODE_80BC10:
	lda.b $00
	sta.w $0740,x
	bcc CODE_80BBD9
	txa
	lsr a
	sta.b $79
	ldx.b #$3E
CODE_80BC1D:
	stz.w $0500,x
	stz.w $0540,x
	stz.w $0580,x
	stz.w $05C0,x
	dex
	dex
	bpl CODE_80BC1D
	ldx.b #$7E
	stx.w WMADDH
	lda.w #$0100
	sta.w WMADDL
	ldx.b #$FF
CODE_80BC3A:
	jsr.w CODE_80C1B0
	sep #$20
	inc a
CODE_80BC40:
	inx
	bit.w $0500,x
	bmi CODE_80BC40
	dec a
	bne CODE_80BC40
	dec.w $0500,x
	rep #$20
	stx.w WMDATA
	dec.b $77
	bne CODE_80BC3A
	tya
	asl a
	sta.b $71
	sep #$20
	ldx.b #$00
	txy
	stz.b $7B
CODE_80BC60:
	stx.b $00
	lda.b $7B
	asl a
	tax
	cpx.b #$10
	beq CODE_80BCBF
	lda.w $0700,x
	sta.b $77
	ldx.b $7B
	lda.l DATA8_80BC7B,x
	sta.b $7D
	ldx.b $00
	bra CODE_80BCB1
