; Unidentified routine.
CODE_80B240:
	lda.w $07CE
	beq CODE_80B250
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B256
