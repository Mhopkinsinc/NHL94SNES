; Unidentified routine.
CODE_9EF04D:
	stz.b $AD
	lda.w $0DF9
	cmp.w #$0008
	bpl CODE_9EF05B
	inc.b $AD
	inc.b $AD
CODE_9EF05B:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
	jsl.l vtoa
	ldy.b $91
	lda.b $A5
	sec
	sbc.w facedir,y
	and.w #$0007
	sta.b $A5
	and.w #$0003
	sta.b $A9
	bne CODE_9EF088
	lda.w seed
	sta.b $A5
CODE_9EF088:
	lda.b $A5
	and.w #$0004
	lsr a
	lsr a
	eor.w #$0001
	clc
	adc.b $AD
	asl a
	sta.b $AD
	lda.w $1443,y
	sta.b $A9
	lda.b $AD
	beq CODE_9EF0BE
	lda.w $13A3,y
	sta.b $A9
	lda.b $AD
	cmp.w #$0002
	beq CODE_9EF0BE
	lda.w $13E3,y
	sta.b $A9
	lda.b $AD
	cmp.w #$0004
	beq CODE_9EF0BE
	lda.w $1423,y
	sta.b $A9
CODE_9EF0BE:
	lda.b $A9
	clc
	adc.w #$000F
	sta.b $A9
	lda.w attribute,y
	bit.w #$0800
	beq CODE_9EF0D5
	lda.b $AD
	eor.w #$0002
	sta.b $AD
CODE_9EF0D5:
	lda.w frame,y
	sec
	sbc.w #$0296
	cmp.w #$0010
	bcs CODE_9EF0EC
	lda.w $0DF9
	cmp.w #$0005
	bmi CODE_9EF0EC
	jmp.w $F1CA
