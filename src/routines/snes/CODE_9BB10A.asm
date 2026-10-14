; Unidentified routine.
CODE_9BB10A:
	lda.b a4
	clc
	adc.w #$007A
	sta.b a4
	bcc CODE_9BB116
	inc.b $9B
CODE_9BB116:
	cmp.w #$E676
	bne CODE_9BB12C
	lda.b $9B
	cmp.w #$007E
	bne CODE_9BB12C
	lda.w #$007E
	sta.b $9B
	lda.w #$577E
	sta.b a4
CODE_9BB12C:
	stz.b d7
	rtl
