; Unidentified routine.
CODE_9F9E24:
	lda.w #$0001
	sta.l $7E3462
	lda.b a2
	pha
	stz.b a2
	lda.w HomeTeam
	sta.b d1
	lda.w #$0014
	sta.w printx
	lda.w #$0002
	sta.w printy
	jsl.l CODE_9FBE08
	lda.w #$0002
	sta.b a2
	lda.w #$0003
	sta.w printx
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
	pla
	sta.b a2
	lda.w #$0000
	sta.l $7E3462
	lda.w #$0000
	sta.l $7E3460
	lda.w #$1D47
	sta.l $7F76C2
	sta.l $7F76E2
	lda.l $7E3476
	bne .1
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
.1:
	lda.w #$007F
	sta.b $0E
	lda.w #$75C0
	sta.b $0C
	ldy.w #$0060
	ldx.w #$0020
	jsl.l DMAToCGRAM
	lda.w #$007F
	sta.b $0E
	lda.w #$76C0
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l DMAToCGRAM
	jsl.l SendTextMap
	rtl
