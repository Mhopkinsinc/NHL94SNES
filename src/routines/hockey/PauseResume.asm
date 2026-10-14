; Pause menu confirm: B, Start, or A leaves
PauseResume:
	lda.b d1
	bit.w #$9080
	bne PauseResumeRtl
	jmp.w PauseMenuPoll

PauseResumeRtl:
	lda.w #$0000
	rtl
