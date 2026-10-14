; Pause menu confirm: B, Start, or A leaves
PauseResume:
	lda.b d1
	bit.w #$9080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w #$0000
	rtl
