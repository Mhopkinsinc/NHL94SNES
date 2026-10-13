; Unidentified routine.
CODE_9EC95C:
	lda.w $0D45
	sec
	sbc.w #$1000
	beq CODE_9EC96D
	bmi CODE_9EC96B
	bvs CODE_9EC96D
	bra CODE_9EC9B0
