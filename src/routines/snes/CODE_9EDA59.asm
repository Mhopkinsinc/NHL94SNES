; Unidentified routine.
CODE_9EDA59:
	ldy.w puckc
	bmi CODE_9EDAA4
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9EDAA4
	lda.w SPA,y
	cmp.w #SPAshotf
	bcc CODE_9EDAA1
	cmp.w #DATA8_9DF020+1
	bcs CODE_9EDAA1
	lda.w Yvel,y
	bit.w #$8000
	beq CODE_9EDA7F
	eor.w #$FFFF
	inc a
CODE_9EDA7F:
	sta.b $00
	lda.w Xvel,y
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
	stz.w Xvel,x
	stz.w Yvel,x
	inc.w $0BA1
	rtl
