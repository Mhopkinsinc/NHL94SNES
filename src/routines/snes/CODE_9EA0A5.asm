; Unidentified routine.
CODE_9EA0A5:
	lda.w $0792
	and.w #$0030
	beq CODE_9EA0B1
CODE_9EA0AD:
	iny
	iny
	sty.b d0
CODE_9EA0B1:
	lda.b [a0],y
	jsl.l CODE_9EA3F1
	ldy.b a2
	lda.w position,y
	beq CODE_9EA10E
	lda.b d4
	sec
	sbc.w #$0020
	bmi CODE_9EA10E
	lda.w #$0078
	sta.b d0
	lda.b d0
	sec
	sbc.w $12C3,x
	clc
	adc.w $12C3,y
	lsr a
	sec
	sbc.w $0F23,y
	beq CODE_9EA10F
	bmi CODE_9EA10F
	sta.b d0
	jsl.l randomd0
	lda.b d0
	sec
	sbc.w $1483,x
	bmi CODE_9EA10F
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs CODE_9EA10E
	lda.w gmode
	bit.w #$0010
	bne CODE_9EA10E
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$0018
	sta.b d0
	jmp.w AddPenalty
