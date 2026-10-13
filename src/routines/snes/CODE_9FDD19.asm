; Unidentified routine.
CODE_9FDD19:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $B1
	pha
	lda.b $B3
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	stz.b $A5
	stz.b $A9
	lda.w #$0005
	sta.b $AD
	sta.b $AD
	ldy.b $91
	lda.w tmsort,y
	sta.b $89
CODE_9FDD43:
	ldy.b $89
	lda.w position,y
	beq CODE_9FDD68
	bmi CODE_9FDD68
	lda.w pnum,y
	and.w #$00FF
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FDD5C
	lda.w #$0034
CODE_9FDD5C:
	adc.b $B1
	tay
	lda.w tmpde,y
	adc.b $A5
	sta.b $A5
	inc.b $A9
CODE_9FDD68:
	inc.b $89
	inc.b $89
	dec.b $AD
	bpl CODE_9FDD43
	lda.b $A9
	beq CODE_9FDD84
	sta.b $04
	phx
	lda.b $A5
	sta.b $08
	jsl.l Div16U
	lda.b $00
	sta.b $A5
	plx
CODE_9FDD84:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $B3
	pla
	sta.b $B1
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	rtl
