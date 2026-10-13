; Unidentified routine.
CODE_808243:
	cmp.b #$FD
	beq CODE_808281
	bmi CODE_808240
CODE_808249:
	rep #$20
	and.w #$00FF
	tay
	lda.b $3E
	sec
	sbc.w #$005C
	bcc CODE_80827C
	sta.b $3E
	lda.w $0102,x
	sta.w VMADDL
	lda.w $0104,x
	sta.w VMDATAL
	iny
	beq CODE_80826E
	lda.w $0106,x
	sta.w VMDATAL
CODE_80826E:
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	jmp.w CODE_8081F1
