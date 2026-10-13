; Unidentified routine.
CODE_9C9145:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l PushTime
CODE_9C9154:
	lda.b [$8D]
	inc a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w printx
	sta.w printx
	jsl.l CODE_9EC894
CODE_9C9167:
	rts
