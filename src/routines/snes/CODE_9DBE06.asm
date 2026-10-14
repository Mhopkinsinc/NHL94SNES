; Unidentified routine.
CODE_9DBE06:
	lda.w $1DB9
	cmp.w $1DC1
	bpl CODE_9DBDA8
	inc.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBE54
	sta.w $1D9B
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
CODE_9DBE31:
	inc.w $1D9B
	ldy.w #$0000
CODE_9DBE37:
	lda.b [a3],y
	and.w #$00FF
	cmp.w $1D9B
	beq CODE_9DBE31
	iny
	cpy.w #$0006
	bmi CODE_9DBE37
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
CODE_9DBE54:
	jsl.l CODE_9DBE79
	jmp.w CODE_9DBD7B
