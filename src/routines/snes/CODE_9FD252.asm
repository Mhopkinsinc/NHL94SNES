; Unidentified routine.
CODE_9FD252:
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
.loop:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .loop
	ldx.b xsave
	stz.b a2
	jsl.l .t1
	lda.w #$0002
	sta.b a2
	jsl.l .t1
	stx.b xsave
	ldx.w #$000E
.loop2:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop2
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

.t1:
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	lda.w #$0005
	sta.b d2
	ldx.w tmsort,y
	stx.b a3
CODE_9FD2BC:
	stz.w pf2aip,x
	lda.w pflags,x
	and.w #$2FFF
	sta.w pflags,x
	lda.w position,x
	bmi CODE_9FD2F3
	bne .t1
	lda.w #SPAgready
	bra CODE_9FD2D7

.t1:
	lda.w #SPAglide
CODE_9FD2D7:
	jsl.l SetSPAFromA
	stz.w $0F23,x
	stz.w nopuck,x
	lda.w pflags,x
	and.w #$FFF6
	sta.w pflags,x
	stz.w pfnc,x
	stz.w pfrev,x
	stz.w pfalock,x
CODE_9FD2F3:
	inc.b a3
	inc.b a3
	ldx.b a3
	dec.b d2
	bpl CODE_9FD2BC
	rtl
