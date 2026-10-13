; Unidentified routine.
CODE_9BAE9D:
	lda.w #$000F
	sta.w $0AF3
	lda.w puckx
	cmp.w #$FF78
	bpl CODE_9BAEAE
CODE_9BAEAB:
	lda.w #$FF78
CODE_9BAEAE:
	cmp.w #$0088
	bmi CODE_9BAEB6
CODE_9BAEB3:
	lda.w #$0088
CODE_9BAEB6:
	sta.w $0D75
	lda.w pucky
	cmp.w #$FED4
	bpl CODE_9BAEC4
CODE_9BAEC1:
	lda.w #$FED4
CODE_9BAEC4:
	cmp.w #$012C
	bmi CODE_9BAECC
CODE_9BAEC9:
	lda.w #$012C
CODE_9BAECC:
	sta.w $0DD7
CODE_9BAECF:
	lda.b $A9
	bit.w #$8000
	beq CODE_9BAF03
	lda.l $7E35F0
	beq CODE_9BAEFA
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0180
	ldy.w #$0000
	jsl.l CODE_808862
	jsl.l WaitFrame
	lda.w #$0000
	sta.l $7E35F0
CODE_9BAEFA:
	lda.w sflags3
	eor.w #$0002
	sta.w sflags3
CODE_9BAF03:
	lda.b $B1
	bit.w #$0020
	bne CODE_9BAF31
	bit.w #$0050
	bne CODE_9BAF56
	lda.b $A9
	bit.w #$2000
	bne CODE_9BAF3D
	bit.w #$1000
	bne CODE_9BAF3A
	lda.b $B1
	bit.w #$0080
	bne CODE_9BAF4C
	bit.w #$4000
	beq CODE_9BAF80
	jsl.l suba4
	jsl.l suba4
	bra CODE_9BAF6E
