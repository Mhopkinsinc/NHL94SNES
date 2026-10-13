; Unidentified routine.
CODE_9FCBB6:
	stx.b $87
	ldx.w #$0000
CODE_9FCBBB:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FCBBB
	ldx.b $87
	lda.w #$0008
	sta.b $00
	ldy.w $0AD9
	bmi CODE_9FCC06
	lda.w position,x
	beq CODE_9FCBEB
	lda.w $19D4,x
	bmi CODE_9FCBEB
	lda.w $14E3,x
	bne CODE_9FCBEB
	lda.w $0B3D,x
	cmp.w #$0064
	bcs CODE_9FCBEB
	jmp.w $CCAE
