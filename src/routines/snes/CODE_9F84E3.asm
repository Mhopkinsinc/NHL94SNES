; Unidentified routine.
CODE_9F84E3:
	lda.w $1EBB
	bne CODE_9F84EB
	stz.w $0CC1
CODE_9F84EB:
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	stz.b $83
	stz.b $85
	stz.w $0D35
	stz.w $0D01
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	lda.w $1D81
	beq CODE_9F8511
	rtl
