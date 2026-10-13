; Unidentified routine.
PutDigits2:
	lda.w #$2020
	sta.b $C5
	lda.b $A5
	and.w #$00FF
	cmp.w #$000A
	bcc CODE_9FC5D7
	lsr a
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$0030
	sta.b $C5
CODE_9FC5D7:
	lda.b $A5
	and.w #$000F
	clc
	adc.w #$0030
	sta.b $C6
	lda.b $C5
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	rtl
