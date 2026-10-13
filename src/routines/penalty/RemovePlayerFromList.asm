; Unidentified routine.
RemovePlayerFromList:
	lda.w #$FFFF
	sta.b $AD
CODE_9EA6FF:
	inc.b $AD
	lda.b $89
	clc
	adc.b $AD
	tay
	sep #$20
	lda.w tmboxlist,y
	sta.w $18B9,y
	rep #$30
	bit.w #$0080
	beq CODE_9EA6FF
	dec.b $89
	rtl
