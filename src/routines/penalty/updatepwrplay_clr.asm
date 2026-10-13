; Unidentified routine.
updatepwrplay_clr:
	lda.w #$2000
	trb.w sflags
	beq CODE_9EB85D
	jsl.l CODE_9FBEFD
CODE_9EB85D:
	rtl
