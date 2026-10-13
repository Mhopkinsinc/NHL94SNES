; Unidentified routine.
SetSPA:
	lda.b $A9
	cmp.w SPA,x
	beq CODE_9EA3F0
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w $11E3,x
CODE_9EA3F0:
	rtl
