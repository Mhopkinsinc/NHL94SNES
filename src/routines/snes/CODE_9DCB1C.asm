; Unidentified routine.
CODE_9DCB1C:
	jsl.l CODE_9DCB72
	beq CODE_9DCB36
	jsl.l CODE_9DCB37
	sta.b $14
	jsl.l CODE_9DCB53
	bne CODE_9DCB31
	lda.b $14
	rtl
