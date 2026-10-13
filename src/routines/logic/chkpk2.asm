; Unidentified routine.
chkpk2:
	lda.w pfteam,x
	bne CODE_9E828B
	lda.w sflags
	and.w #$4000
	eor.w #$4000
	rtl
