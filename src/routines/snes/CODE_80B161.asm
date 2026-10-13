; Unidentified routine.
CODE_80B161:
	lda.w $07CE
	beq CODE_80B171
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B177
