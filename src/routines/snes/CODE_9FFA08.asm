; Unidentified routine.
CODE_9FFA08:
	ldy.w #$0000
CODE_9FFA0B:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	cpy.w #$0020
	bmi CODE_9FFA0B
	rts
	rep #$30
	lda.b $C3
	bit.w #$0080
	beq CODE_9FFA2C
	jsl.l CODE_9FF92E
	lda.w #$0080
	trb.b $C3
	jmp.w $FA6B
