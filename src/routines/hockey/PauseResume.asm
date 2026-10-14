; Pause menu confirm: B, Start, or A leaves
PauseResume:
	lda.b d1
	bit.w #$9080
	bne CODE_9FE73D
	jmp.w PauseMenuPoll

CODE_9FE73D:
	lda.w #$0000
	rtl
