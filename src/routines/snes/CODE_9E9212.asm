; Unidentified routine.
CODE_9E9212:
	stz.b d1
	lda.w pucky
	eor.b $0C
	bmi CODE_9E91EC
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w $14DF
	bne CODE_9E91EC
	lda.w $0DF9
	cmp.w #$000D
	beq .1
	lda.b d2
	cmp.w #$0012
	bpl .1
	lda.b d2
	cmp.w #$FFEF
	bpl CODE_9E920F
.1:
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
	bmi .2
	sta.w $19BE
.2:
	jsl.l RandomWord
	and.w #$0FFF
	sta.b d0
	lda.w pucky
	bmi .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3:
	lda.b d0
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
	jmp.w puckflip
