; Unidentified routine.
CODE_9FB54F:
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w $1003,y
	bmi CODE_9FB517
CODE_9FB55A:
	lda.w $1043,y
	asl a
	sta.b $A9
	tay
	stz.b $89
	stz.b $91
	lda.w pfteam,y
	beq CODE_9FB56F
	lda.w #$0002
	sta.b $91
CODE_9FB56F:
	phy
	ldy.b $91
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FB58F
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w $1003,y
	ora.w #$FF00
	sta.w $1003,y
	ldx.b $95
	jmp.w $D325
