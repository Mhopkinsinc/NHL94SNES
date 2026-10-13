; Unidentified routine.
CODE_80B957:
	lda.b $71
	and.b #$40
	beq CODE_80B960
	jmp.w CODE_80B9BF
