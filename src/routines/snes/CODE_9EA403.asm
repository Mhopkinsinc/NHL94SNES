; Unidentified routine.
CODE_9EA403:
	cmp.w SPA,x
	beq .rtl
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
	jsl.l CODE_9EA419
.rtl:
	rtl
