; Unidentified routine.
CODE_9EA403:
	cmp.w SPA,x
	beq CODE_9EA418
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
	jsl.l updateanim
CODE_9EA418:
	rtl
