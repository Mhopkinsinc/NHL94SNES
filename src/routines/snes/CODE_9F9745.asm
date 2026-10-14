; Unidentified routine.
CODE_9F9745:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .loop
	ldx.b xsave
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b $08
	pha
	jsl.l PlayerNumName
	jsl.l print
	pla
	sta.b $08
	lda.w #$0019
	sta.w printx
	lda.l $7E346A
	bne .1
	inc.w printx
.1:
	lda.b d4
	cmp.w #$0003
	bcs .t1
	jmp.w .2

.t1:
	lda.w #$0001
	sta.l $7E35F2
	jsl.l CODE_9F992E
.2:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9F97CE
	sta.b a0
	ldy.b d4
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	stx.b xsave
	ldx.w #$0012
.loopx:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loopx
	ldx.b xsave
	rtl
