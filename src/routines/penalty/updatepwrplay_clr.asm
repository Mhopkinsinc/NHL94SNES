; Power play over: put the EASN logo back
updatepwrplay_clr:
	lda.w #sf2pwrplay
	trb.w sflags
	beq .rtl
	jsl.l CODE_9FBEFD
.rtl:
	rtl
