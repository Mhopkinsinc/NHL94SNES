; Unidentified routine.
CODE_9FB54F:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	bmi CODE_9FB517
CODE_9FB55A:
	lda.w $1043,y
	asl a
	sta.b d1
	tay
	stz.b a0
	stz.b a2
	lda.w pfteam,y
	beq CODE_9FB56F
	lda.w #$0002
	sta.b a2
CODE_9FB56F:
	phy
	ldy.b a2
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FB58F
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	ora.w #$FF00
	sta.w $1003,y
	ldx.b a3
	jmp.w SetLCmode2
