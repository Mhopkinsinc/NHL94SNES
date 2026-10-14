; Print a player's number and name, then the attribute d4 through attribjmp (ratings first through CalcAttrib)
GetNameandAttrib:
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
	jsl.l CalcAttrib
.2:
	lda.w #$009F
	sta.b $8B
	lda.w #attribjmp
	sta.b a0
	ldy.b d4
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
	sta.w jmlvector+1
	lda.b $8A
	sta.w jmlvector+2
	jsl.l jmlvector
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
