; Set pause mode (sflags sfpz)
SetPauseMode:
	lda.w #sfpz
	tsb.w sflags
	rtl
