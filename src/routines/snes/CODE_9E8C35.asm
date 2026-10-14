; Unidentified routine.
CODE_9E8C35:
	stz.w $0CDB
	lda.w sfhormode
	beq CODE_9E8C45
	lda.b d2
	ldy.b d3
	sty.b d2
	sta.b d3
CODE_9E8C45:
	lda.w $1563,x
	bne CODE_9E8CA8
	lda.b d3
	pha
	lda.b d2
	pha
	lda.w Xpos,x
	sta.b d2
	lda.w Ypos,x
	sta.b d3
	lda.w $10C3,x
	sta.w $0D3B
	lda.w $10E3,x
	sta.w $0D3D
	jsl.l checkwallcoll
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8C99
	cpx.w #$0018
	bcs CODE_9E8C99
	txa
	jsl.l CODE_9BC002
	lda.w Xpos,x
	clc
	adc.b d0
	sta.b d2
	lda.w Ypos,x
	clc
	adc.b d1
	sta.b d3
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l checkwallcoll
CODE_9E8C99:
	pla
	sta.b d2
	pla
	sta.b d3
	lda.w position,x
	bmi CODE_9E8CA8
	jsl.l CODE_9E9484
CODE_9E8CA8:
	lda.w $0CDB
	beq CODE_9E8CB0
	jmp.w CODE_9E8D29
