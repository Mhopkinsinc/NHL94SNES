; Unidentified routine.
CODE_80B9BF:
	lda.b $71
	and.b #$20
	beq CODE_80B9C8
	jmp.w CODE_80BA21
