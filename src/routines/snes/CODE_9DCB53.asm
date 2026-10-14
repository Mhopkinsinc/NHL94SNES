; Unidentified routine.
CODE_9DCB53:
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b a1
	stz.b $08
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b d0
	bpl CODE_9DCB6E
	lda.w #$0001
	rtl
