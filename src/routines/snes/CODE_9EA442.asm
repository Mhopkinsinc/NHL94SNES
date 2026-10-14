; Unidentified routine.
CODE_9EA442:
	phy
	sta.b a0
	lda.w #$009D
	sta.b $8B
	ldy.w #$0010
	lda.b [a0],y
	sta.b d1
	lda.w sfhormode
	bne CODE_9EA425
CODE_9EA456:
	lda.w SPA,x
	cmp.w #$FDFE
	bcs CODE_9EA46F
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EA46F
	lda.w #$0000
	sec
	sbc.w facedir,x
	bra CODE_9EA472
