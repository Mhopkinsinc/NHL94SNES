; Unidentified routine.
CODE_80BCA1:
	lda.b $01
	sta.w $0500,x
	lda.b $00
	sta.w $0600,x
	inx
CODE_80BCAC:
	dey
	bne CODE_80BCA1
	ldy.b $04
CODE_80BCB1:
	dec.b $77
	bpl CODE_80BC83
	inc.b $7B
	lda.b $79
	cmp.b $7B
	bcs CODE_80BC60
	stx.b $00
CODE_80BCBF:
	ldx.b $00
	beq CODE_80BCCB
	lda.b #$10
CODE_80BCC5:
	sta.w $0600,x
	inx
	bne CODE_80BCC5
CODE_80BCCB:
	lda.b $79
	asl a
	tax
	rep #$20
	lda.l DATA16_80BCE9-$10,x	; by the longest code length, from 9 bits up
	sta.w $0760
	ldy.b $12
	sty.w WMADDH
	lda.b $10
	sta.w WMADDL
	lda.b $6C
	ldx.b $71
	jmp (DATA16_80BCF9,x)
