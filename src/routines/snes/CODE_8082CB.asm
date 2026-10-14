; Unidentified routine.
CODE_8082CB:
	cmp.b #$FB
	beq .t2
	bmi .t1
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1908
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0079
	bcc CODE_80827C
	sbc.w $0104,x
	bcc CODE_80827C
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	lda.b #$01
	sta.w MDMAEN
	jmp.w CODE_8081F1

.t1:
	jmp.w CODE_808363

.t2:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1800
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$007D
	bcc CODE_808360
	sbc.w $0104,x
	bcc CODE_808360
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	stz.w VMAIN
	lda.b #$01
	sta.w MDMAEN
	lda.b #$80
	sta.w VMAIN
	jmp.w CODE_8081F1
