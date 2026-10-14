; Unidentified routine.
CODE_9C9145:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushTime
CODE_9C9154:
	lda.b [a1]
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
