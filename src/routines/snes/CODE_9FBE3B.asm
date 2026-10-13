; Unidentified routine.
CODE_9FBE3B:
	inx
	inx
	inx
	inx
	iny
	iny
	iny
	iny
CODE_9FBE43:
	jsl.l CODE_9C943E
	lda.l $7E3462
	beq CODE_9FBE56
	lda.l $7E3460
	bne CODE_9FBE56
	jmp.w $BEF8
