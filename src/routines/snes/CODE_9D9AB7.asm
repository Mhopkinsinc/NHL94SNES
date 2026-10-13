; Unidentified routine.
CODE_9D9AB7:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9D9ABE:
	phy
	sta.b $08
	cmp.w #$0020
	bne CODE_9D9ACB
	lda.w #$0005
	bra CODE_9D9B07
