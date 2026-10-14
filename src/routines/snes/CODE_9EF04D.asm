; Unidentified routine.
CODE_9EF04D:
	stz.b d2
	lda.w $0DF9
	cmp.w #$0008
	bpl CODE_9EF05B
	inc.b d2
	inc.b d2
CODE_9EF05B:
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	and.w #$0007
	sta.b d0
	and.w #$0003
	sta.b d1
	bne CODE_9EF088
	lda.w $0792
	sta.b d0
CODE_9EF088:
	lda.b d0
	and.w #$0004
	lsr a
	lsr a
	eor.w #$0001
	clc
	adc.b d2
	asl a
	sta.b d2
	lda.w $1443,y
	sta.b d1
	lda.b d2
	beq CODE_9EF0BE
	lda.w $13A3,y
	sta.b d1
	lda.b d2
	cmp.w #$0002
	beq CODE_9EF0BE
	lda.w $13E3,y
	sta.b d1
	lda.b d2
	cmp.w #$0004
	beq CODE_9EF0BE
	lda.w $1423,y
	sta.b d1
CODE_9EF0BE:
	lda.b d1
	clc
	adc.w #$000F
	sta.b d1
	lda.w attribute,y
	bit.w #$0800
	beq CODE_9EF0D5
	lda.b d2
	eor.w #$0002
	sta.b d2
CODE_9EF0D5:
	lda.w $0D97,y
	sec
	sbc.w #$0296
	cmp.w #$0010
	bcs CODE_9EF0EC
	lda.w $0DF9
	cmp.w #$0005
	bmi CODE_9EF0EC
	jmp.w CODE_9EF1CA
