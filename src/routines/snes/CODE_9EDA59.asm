; Unidentified routine.
CODE_9EDA59:
	ldy.w $0AD9
	bmi CODE_9EDAA4
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9EDAA4
	lda.w SPA,y
	cmp.w #$ED4A
	bcc CODE_9EDAA1
	cmp.w #$F021
	bcs CODE_9EDAA1
	lda.w $0EE3,y
	bit.w #$8000
	beq CODE_9EDA7F
	eor.w #$FFFF
	inc a
CODE_9EDA7F:
	sta.b $00
	lda.w $0EC3,y
	bit.w #$8000
	beq CODE_9EDA8D
	eor.w #$FFFF
	inc a
CODE_9EDA8D:
	lsr a
	cmp.b $00
	bcs CODE_9EDAA1
	lda.w $0BA1
	bne CODE_9EDAA4
	stz.w $0EC3,x
	stz.w $0EE3,x
	inc.w $0BA1
	rtl
