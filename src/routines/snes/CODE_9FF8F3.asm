; Unidentified routine.
CODE_9FF8F3:
	ldy.w #$0006
	stz.b $A7
CODE_9FF8F8:
	lda.b $A7
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$0037
	asl a
	tax
	stz.b $A5
	sep #$20
CODE_9FF90B:
	lda.b $A9
	beq CODE_9FF911
	lda.b [$0C],y
CODE_9FF911:
	sta.l $7F4040,x
	iny
	inx
	inx
	inc.b $A5
	lda.b $A5
	cmp.b #$12
	bmi CODE_9FF90B
	rep #$20
	inc.b $A7
	lda.b $A7
	cmp.w #$000A
	bmi CODE_9FF8F8
	rts
