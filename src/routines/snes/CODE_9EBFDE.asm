; Unidentified routine.
CODE_9EBFDE:
	lda.w mesarea
	sta.b d0
	lda.b d1
	cmp.w #$0001
	beq CODE_9EC000
	lda.b d1
	bne CODE_9EBFF4
	jsl.l CODE_9EC000
	bra CODE_9EBFFB
