; Unidentified routine.
CODE_80B757:
	lda.b $0C
	cmp.w $2540,x
	bne .1
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B77B
.1:
	inx
	inx
	dey
	bne CODE_80B757
	bra CODE_80B753
