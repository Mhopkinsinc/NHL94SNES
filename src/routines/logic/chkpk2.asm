; Z set if player X is on the shorthanded team
chkpk2:
	lda.w pfteam,x
	bne CODE_9E828B
	lda.w sflags
	and.w #sf2pwrtm
	eor.w #sf2pwrtm
	rtl
