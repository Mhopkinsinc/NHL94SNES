; Unidentified routine.
CODE_9E963C:
	lda.w SPA,y
	cmp.w #SPAsweepchk
	bcc CODE_9E9649
	cmp.w #SPAburst+1
	bcc CODE_9E9633
CODE_9E9649:
	lda.b $B5
	clc
	adc.w $0F23,x
	sta.w $0F23,x
	lda.b $B5
	clc
	adc.w $0F23,y
	sta.w $0F23,y
	txa
	sta.w $0F03,y
	tya
	sta.w $0F03,x
	lda.b $B5
	cmp.w #$0014
	bcc CODE_9E9678
	cpx.w puckc
	beq CODE_9E9674
	cpy.w puckc
	bne CODE_9E9678
CODE_9E9674:
	jsl.l CODE_9E9B0E
CODE_9E9678:
	lda.b $A9
	pha
	lda.b $AD
	pha
	lda.b $B1
	pha
	jsl.l CODE_9EBA4F
	jsl.l CODE_9E9FF9
	pla
	sta.b $B1
	pla
	sta.b $AD
	pla
	sta.b $A9
CODE_9E9692:
	lda.b $A9
	sta.b $B5
	pla
	sta.b $A5
	pla
	sta.b $A9
	lda.w $0CDB
	bpl CODE_9E96A4
	jmp.w $976E
