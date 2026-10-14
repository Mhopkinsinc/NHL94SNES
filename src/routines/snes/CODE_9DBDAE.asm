; Unidentified routine.
CODE_9DBDAE:
	lda.w $1DB9
	beq CODE_9DBDA8
	dec.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi .2
	inc a
	inc a
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
.loop:
	dec.w $1D9B
	beq .1
	bmi .1
	ldy.w #$0000
.loop2:
	lda.b [a3],y
	and.w #$00FF
	cmp.w $1D9B
	beq .loop
	iny
	cpy.w #$0006
	bmi .loop2
.1:
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
.2:
	jsl.l CODE_9DBE79
	jmp.w CODE_9DBD7B
