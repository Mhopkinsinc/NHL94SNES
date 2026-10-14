; Unidentified routine.
CODE_9EA3AD:
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs CODE_9EA3CE
	lda.w #$0028
	sta.b d0
	lda.w SPA,x
	cmp.w #$F3A6
	beq CODE_9EA3CA
	lda.w #$0020
	sta.b d0
CODE_9EA3CA:
	jsl.l AddPenalty
CODE_9EA3CE:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w $0CDB
	rtl
