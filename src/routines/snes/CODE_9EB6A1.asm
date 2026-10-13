; Unidentified routine.
CODE_9EB6A1:
	jsl.l CODE_9EC72D
CODE_9EB6A5:
	lda.w #$0000
	sta.b [$89]
	lda.w sfhormode
	beq CODE_9EB6B2
	jmp.w $B4A1
