; Unidentified routine.
CODE_9FA5AD:
	lda.b $83
	ldy.b $85
	sbc.w $0D51
	sta.b $C5
	tya
	sbc.w $0D53
	bne CODE_9FA5E9
	lda.w sfhormode
	beq CODE_9FA5E9
	lda.w $1A10
	beq CODE_9FA5E9
	stz.w $0CC5
	stz.w $0CD3
	lda.w #$2000
	sta.w $0CC9
	lda.b $C5
	lsr a
	lsr a
	sta.w $0CCF
	lda.w #$00C8
	sta.w $0CD1
	lda.w #$01C0
	sta.w $0CCD
	jsl.l CODE_9BBFB9
CODE_9FA5E9:
	rtl
