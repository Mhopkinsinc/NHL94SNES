; Unidentified routine.
CODE_9EE7D1:
	lda.w #$0108
	sec
	sbc.w $0BA9
	sta.b $A9
CODE_9EE7DA:
	jsl.l vtoa
	jsl.l Findhittype
	beq CODE_9EE7E9
	lda.w #$F020
	bra CODE_9EE7EC
