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
	bcc CODE_9E9678
	cpx.w $0AD9
	beq CODE_9E9674
	cpy.w $0AD9
	bne CODE_9E9678
CODE_9E9674:
	jsl.l CODE_9E9B0E
CODE_9E9678:
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
	bpl CODE_9E96A4
	jmp.w CODE_9E976E
