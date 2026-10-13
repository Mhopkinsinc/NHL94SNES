; Unidentified routine.
CODE_80ACC2:
	ldy.b #$2A
	lda.b ($4E),y
	clc
	adc.w $09AA,x
	sta.w $09AA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $099A,x
	sta.w $099A,x
	sta.w $097A,x
	ldy.b #$26
	lda.b ($4E),y
	clc
	adc.w $09CA,x
	sta.w $09CA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09BA,x
	sta.w $09BA,x
	ldy.b #$22
	lda.b ($4E),y
	clc
	adc.w $09EA,x
	sta.w $09EA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09DA,x
	sta.w $09DA,x
	bit.w $09FA,x
	bmi CODE_80AD2A
	clc
	adc.w $098A,x
	sta.w $098A,x
	bmi CODE_80AD4D
	cmp.w $09BA,x
	bcc CODE_80AD4D
	ldy.b #$2D
	lda.b ($4E),y
	and.w #$4000
	bne CODE_80AD25
CODE_80AD20:
	stz.w $098A,x
	bra CODE_80AD4D
