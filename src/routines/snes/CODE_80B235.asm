; Unidentified routine.
CODE_80B235:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B256
