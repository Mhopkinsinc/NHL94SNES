; Unidentified routine.
CODE_9E9212:
	stz.b $A9
	lda.w pucky
	eor.b $0C
	bmi CODE_9E91EC
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w $14DF
	bne CODE_9E91EC
	lda.w $0DF9
	cmp.w #$000D
	beq CODE_9E9246
	lda.b $AD
	cmp.w #$0012
	bpl CODE_9E9246
	lda.b $AD
	cmp.w #$FFEF
	bpl CODE_9E920F
CODE_9E9246:
	jsl.l CODE_9EF213
	stz.w $1E8B
	stz.w $1E89
	lda.w #$0009
	jsl.l CODE_9C9ABC
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w $19BE
	clc
	adc.w #$0028
	bmi CODE_9E9274
	sta.w $19BE
CODE_9E9274:
	jsl.l RandomWord
	and.w #$0FFF
	sta.b $A5
	lda.w pucky
	bmi CODE_9E928A
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E928A:
	lda.b $A5
	sta.w puckvy
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w puckvx
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w $0E01
	jmp.w $DE5E
