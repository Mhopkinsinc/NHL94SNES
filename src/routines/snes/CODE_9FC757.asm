; Unidentified routine.
CODE_9FC757:
	lda.w pfteam,x
	beq CODE_9FC764
	stz.b $8D
	lda.w #$0002
	sta.b $91
	rtl
