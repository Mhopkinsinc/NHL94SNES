; Unidentified routine.
CODE_9F9B36:
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
	lda.w sfhormode
	beq .t1
	jmp.w CODE_9F9CFB

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF81C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8000
	lda.l $7E34BC
	cmp.w #$0004
	beq .t2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF821
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w gsp
	sta.b d0
	cmp.w #$0004
	bne .1
	dec.w printx
	inc.b d0
.1:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b a1
	jsl.l CODE_9ECFC6
	jsl.l CODE_9FBEFD
	jsl.l updatepwrplay
	bra CODE_9F9C05

.t2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF826
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0006
	sta.w printx
	lda.w shootoutround
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
CODE_9F9C05:
	lda.w sflags3
	bit.w #$0001
	beq .t1
	jmp.w CODE_9F9CD8

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF830
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
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
	lda.w #DATA8_9CF835
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	stz.b d3
	stz.b a2
	jsl.l CODE_9F9DB0
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	inc.b d3
	inc.b a2
	inc.b a2
	jsl.l CODE_9F9DB0
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w gmode
	bit.w #$0002
	bne .1
	stz.b a3
	lda.w #$0002
	sta.b a2
.1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
	ldx.b a2
	lda.b a3
	sta.b a2
	stx.b a3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF844
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
CODE_9F9CD8:
	stx.b xsave
	ldx.w #$000E
.loop:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop
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
