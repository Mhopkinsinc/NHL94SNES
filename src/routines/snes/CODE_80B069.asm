; Unidentified routine.
CODE_80B069:
	lda.b $0C
	cmp.w $2540,x
	bne CODE_80B077
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B05F
CODE_80B077:
	inx
	inx
	dey
	bne CODE_80B069
	bra CODE_80B030
