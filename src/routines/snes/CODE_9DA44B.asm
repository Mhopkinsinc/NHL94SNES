; Unidentified routine.
CODE_9DA44B:
	bit.w #$0200
	beq CODE_9DA46E
	lda.w $1C84,x
	beq CODE_9DA462
	cmp.w #$0001
	bne CODE_9DA486
CODE_9DA45A:
	lda.w #$0000
	sta.w $1C84,x
	bra CODE_9DA486
CODE_9DA462:
	lda.b $AB
	bne CODE_9DA486
	lda.w #$0002
	sta.w $1C84,x
	bra CODE_9DA486
