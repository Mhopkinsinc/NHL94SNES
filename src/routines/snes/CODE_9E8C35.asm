; Unidentified routine.
CODE_9E8C35:
	stz.w $0CDB
	lda.w sfhormode
	beq CODE_9E8C45
	lda.b $AD
	ldy.b $B1
	sty.b $AD
	sta.b $B1
CODE_9E8C45:
	lda.w pfnc,x
	bne CODE_9E8CA8
	lda.b $B1
	pha
	lda.b $AD
	pha
	lda.w Xpos,x
	sta.b $AD
	lda.w Ypos,x
	sta.b $B1
	lda.w $10C3,x
	sta.w $0D3B
	lda.w $10E3,x
	sta.w $0D3D
	jsl.l CODE_9E8D3E
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8C99
	cpx.w #$0018
	bcs CODE_9E8C99
	txa
	jsl.l CODE_9BC002
	lda.w Xpos,x
	clc
	adc.b $A5
	sta.b $AD
	lda.w Ypos,x
	clc
	adc.b $A9
	sta.b $B1
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l CODE_9E8D3E
CODE_9E8C99:
	pla
	sta.b $AD
	pla
	sta.b $B1
	lda.w position,x
	bmi CODE_9E8CA8
	jsl.l CODE_9E9484
CODE_9E8CA8:
	lda.w $0CDB
	beq CODE_9E8CB0
	jmp.w $8D29
