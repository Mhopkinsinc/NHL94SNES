; Unidentified routine.
CODE_9E9A49:
	ldy.b a2
	cpy.w $0AD9
	beq CODE_9E9A61
	lda.w #$0003
	jsl.l CODE_9C9ABC
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
CODE_9E9A61:
	ldy.b a2
	sty.w $0AD9
	sty.b d0
	stz.b a0
	lda.w #$0002
	sta.b a1
	lda.w pfteam,y
	bne CODE_9E9A7B
	stz.b a1
	lda.w #$0002
	sta.b a0
CODE_9E9A7B:
	ldy.b a0
	lda.w #$FFFF
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmflags,y
	ora.w #$0004
	sta.w tmflags,y
	lda.w #$0010
	trb.w sflags3
	beq CODE_9E9AB1
	ldy.b a1
	lda.w $1792,y
	inc a
	sta.w $1792,y
	lda.l $7E35E0
	clc
	adc.w #$00C8
	sta.l $7E35E0
	lda.w #$0014
	sta.b $81
CODE_9E9AB1:
	lda.w gmclock
	bne CODE_9E9AC6
	lda.b a2
	cmp.w $0D07
	bne CODE_9E9AC6
	ldy.b a1
	lda.w $17BA,y
	inc a
	sta.w $17BA,y
CODE_9E9AC6:
	lda.w #$000C
	trb.w sflags
	ldy.b a2
	lda.w position,y
	bne CODE_9E9AED
	jsl.l CODE_9EF213
	ldy.b a2
	lda.w #$008C
	sta.w $1083,y
	lda.w SPA,y
	cmp.w #$E4B6
	bne CODE_9E9AED
CODE_9E9AE7:
	lda.w #$0005
	sta.w $1083,y
CODE_9E9AED:
	lda.b a2
	cmp.w $0D07
	bne CODE_9E9B03
	ldy.b a1
	lda.w $0B01,y
	sta.b d4
	bmi CODE_9E9B03
	jsl.l CODE_9FCB5C
	bra CODE_9E9B07
