; Unidentified routine.
CODE_80C0D8:
	sec
	sbc.w $073E
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$08
	cmp.b $73
	beq CODE_80C15F
CODE_80C0E8:
	sta.w WMDATA
	sta.b $08
	rep #$20
	inc.b $0C
	lda.b $6B
	jmp (DATA16_80C0F6-2,x)
