; Unidentified routine.
CODE_9FC331:
	cpx.w puckc
	beq CODE_9FC371
	lda.b d1
	bit.w #$8000
	bne CODE_9FC326
	bit.w #$0040
	beq .t1
	jmp.w CODE_9FC2BA

.t1:
	bit.w #$0080
	beq CODE_9FC371
	ldy.w $0D07
	bmi CODE_9FC371
	lda.w pflags,y
	and.w #$1000
	ora.w pfalock,y
	bne CODE_9FC371
	lda.w $19D4,y
	bpl CODE_9FC371
	lda.w pfteam,y
	cmp.w pfteam,x
	bne CODE_9FC371
	sty.b d0
	inc.w $0BAB
	jsl.l CODE_9FCB68
	rtl
