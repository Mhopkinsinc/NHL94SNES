; Unidentified routine.
CODE_9EAAF4:
	inc.w facedir,x
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EAB05
	dec.w facedir,x
	dec.w facedir,x
CODE_9EAB05:
	lda.w facedir,x
	and.w #$0007
	sta.w facedir,x
	lda.w #$EA1A
	sta.b d1
	lda.w $1523,x
	bne CODE_9EAB1B
	jmp.w SetSPA
