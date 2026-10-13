; Unidentified routine.
CODE_9EA403:
	cmp.w SPA,x
	beq CODE_9EA418
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w $11E3,x
	jsl.l CODE_9EA419
CODE_9EA418:
	rtl
