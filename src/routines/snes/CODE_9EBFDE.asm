; Unidentified routine.
CODE_9EBFDE:
	lda.w $0A2A
	sta.b $A5
	lda.b $A9
	cmp.w #$0001
	beq CODE_9EC000
	lda.b $A9
	bne CODE_9EBFF4
	jsl.l CODE_9EC000
	bra CODE_9EBFFB
