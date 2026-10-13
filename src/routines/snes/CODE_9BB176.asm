; Unidentified routine.
CODE_9BB176:
	jsl.l CODE_9BB19D
adda43:
	lda.b $99
	clc
	adc.w #$007A
	sta.b $99
	bcc CODE_9BB186
	inc.b $9B
CODE_9BB186:
	cmp.w #$E676
	bne CODE_9BB19C
	lda.b $9B
	cmp.w #$007E
	bne CODE_9BB19C
	lda.w #$007E
	sta.b $9B
	lda.w #$577E
	sta.b $99
CODE_9BB19C:
	rtl
