; Unidentified routine.
CODE_9EA3AD:
	jsl.l CODE_9EC124
	lda.b $A5
	cmp.w #$0001
	bcs CODE_9EA3CE
	lda.w #$0028
	sta.b $A5
	lda.w SPA,x
	cmp.w #$F3A6
	beq CODE_9EA3CA
	lda.w #$0020
	sta.b $A5
CODE_9EA3CA:
	jsl.l AddPenalty
CODE_9EA3CE:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$FFFF
	sta.w $0CDB
	rtl
