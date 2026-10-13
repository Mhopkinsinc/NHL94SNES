; Unidentified routine.
CODE_9E8272:
	lda.w sflags
	and.w #$2000
	bne chkpk2
	inc a
	rtl
