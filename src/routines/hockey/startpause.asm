; Start a pause (sflags sfpz)
startpause:
	lda.w #sfpz
	tsb.w sflags
	rtl
