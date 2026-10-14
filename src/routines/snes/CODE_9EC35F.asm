; Unidentified routine.
CODE_9EC35F:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	stx.b xsave
	ldx.w #$0000
CODE_9EC376:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9EC376
	ldx.b xsave
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF73E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0012
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF743
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w TempPlOffset
	bit.w #$4000
	beq CODE_9EC3EC
	and.w #$BFFF
	sta.w TempPlOffset
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF766
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9EC3EC:
	jsl.l CODE_9FC4A1
	jsl.l print
	stx.b xsave
	ldx.w #$0012
CODE_9EC3F9:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9EC3F9
	ldx.b xsave
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	rtl
