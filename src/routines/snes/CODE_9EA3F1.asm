; Unidentified routine.
CODE_9EA3F1:
	cmp.w SPA,x
	beq CODE_9EA402
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w $11E3,x
CODE_9EA402:
	rtl
