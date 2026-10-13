; Unidentified routine.
CODE_9EAAF4:
	inc.w $1163,x
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EAB05
	dec.w $1163,x
	dec.w $1163,x
CODE_9EAB05:
	lda.w $1163,x
	and.w #$0007
	sta.w $1163,x
	lda.w #$EA1A
	sta.b $A9
	lda.w $1523,x
	bne CODE_9EAB1B
	jmp.w $A3DD
