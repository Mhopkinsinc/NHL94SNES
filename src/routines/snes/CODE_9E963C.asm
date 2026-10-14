; Unidentified routine.
CODE_9E963C:
	lda.w SPA,y
	cmp.w #$F208
	bcc CODE_9E9649
	cmp.w #$F343
	bcc CODE_9E9633
CODE_9E9649:
	lda.b d4
	clc
	adc.w $0F23,x
	sta.w $0F23,x
	lda.b d4
	clc
	adc.w $0F23,y
	sta.w $0F23,y
	txa
	sta.w $0F03,y
	tya
	sta.w $0F03,x
	lda.b d4
	cmp.w #$0014
	bcc .2
	cpx.w shotPlIdx
	beq .1
	cpy.w shotPlIdx
	bne .2
.1:
	jsl.l CODE_9E9B0E
.2:
	lda.b d1
	pha
	lda.b d2
	pha
	lda.b d3
	pha
	jsl.l CODE_9EBA4F
	jsl.l CODE_9E9FF9
	pla
	sta.b d3
	pla
	sta.b d2
	pla
	sta.b d1
CODE_9E9692:
	lda.b d1
	sta.b d4
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w $0CDB
	bpl .t1
	jmp.w CODE_9E976E

.t1:
	lda.b d2
	ldx.b d1
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b d1
	lda.b d3
	ldx.b d0
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b d1
	sta.b d1
	lda.b $0A
	sbc.b $AB
	sta.b $AB
	lda.b $AA
	sta.b d5
	ldx.b a3
	lda.w $12C3,x
	clc
	adc.w #$008C
	sta.b d0
	ldy.b a2
	lda.w $12C3,y
	clc
	adc.w #$008C
	sta.b d1
	lda.b d1
	clc
	adc.b d0
	sta.b d1
	lda.b d0
	ldx.b d4
	jsl.l CODE_808FC9
	lda.b d1
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d0
	sta.b d1
	lda.b d3
	ldx.b d5
	jsl.l CODE_808FEB
	lda.b $08
	sta.b tmp0
	lda.b d2
	ldx.b d0
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.b tmp0
	ldx.b a3
	clc
	adc.w $0EC3,y
	sta.w $0EC3,x
	lda.b d2
	ldx.b d5
	jsl.l CODE_808FEB
	lda.b $08
	sta.b tmp0
	lda.b d3
	ldx.b d0
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b tmp0
	ldx.b a3
	clc
	adc.w $0EE3,y
	sta.w $0EE3,x
	lda.b d2
	ldx.b d1
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w $0EC3,y
	sta.w $0EC3,y
	lda.b d3
	ldx.b d1
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w $0EE3,y
	sta.w $0EE3,y
	ldx.b a3
	lda.w #$FFFF
	sta.w $0CDB
CODE_9E976E:
	pla
	sta.b d5
	pla
	sta.b d4
	pla
	sta.b d3
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b d0
	rtl
