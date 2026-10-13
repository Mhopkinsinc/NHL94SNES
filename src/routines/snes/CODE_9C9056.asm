; Unidentified routine.
CODE_9C9056:
	lda.b [$89]
	and.w #$000F
	inc.b $89
	inc.b $89
	cmp.w #$0001
	bne CODE_9C9067
	jmp.w $90F0
