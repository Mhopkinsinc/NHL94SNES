; Start sprite animation A on object X (as SetSPAFromA) and update it at once (updateanim)
SetSPAUpdate:
	cmp.w SPA,x
	beq .rtl
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
	jsl.l updateanim
.rtl:
	rtl
