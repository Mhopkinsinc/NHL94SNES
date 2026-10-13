; Unidentified routine.
appstring:
	lda.w #$0002
	sta.b $C5
	lda.b [$95]
	sta.b $C7
CODE_9ECFAE:
	lda.b $C5
	cmp.b [$8D]
	beq CODE_9ECFC1
	tay
	lda.b [$8D],y
	ldy.b $C7
	sta.b [$95],y
	inc.b $C5
	inc.b $C7
	bra CODE_9ECFAE
