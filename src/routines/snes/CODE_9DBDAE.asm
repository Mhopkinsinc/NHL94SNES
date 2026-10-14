; Unidentified routine.
CODE_9DBDAE:
	lda.w $1DB9
	beq CODE_9DBDA8
	dec.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBDFF
	inc a
	inc a
	sta.w $1D9B
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
CODE_9DBDD8:
	dec.w $1D9B
	beq CODE_9DBDF2
	bmi CODE_9DBDF2
	ldy.w #$0000
CODE_9DBDE2:
	lda.b [$95],y
	and.w #$00FF
	cmp.w $1D9B
	beq CODE_9DBDD8
	iny
	cpy.w #$0006
	bmi CODE_9DBDE2
CODE_9DBDF2:
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
CODE_9DBDFF:
	jsl.l CODE_9DBE79
	jmp.w CODE_9DBD7B
