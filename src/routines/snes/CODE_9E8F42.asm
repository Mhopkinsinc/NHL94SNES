; Unidentified routine.
CODE_9E8F42:
	lda.b $A5
	sta.w $1103,x
	lda.b $A9
	sta.w $1123,x
	lda.b $AD
	pha
	lda.b $B1
	pha
	lda.b $A9
	pha
	lda.b $A5
	pha
	txy
	ldx.w Yvel,y
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $A5
	ldx.w Xvel,y
	lda.b $A9
	jsl.l CODE_808FEB
	lda.b $A5
	sec
	sbc.b $09
	eor.w #$FFFF
	inc a
	sta.b $AD
	ldx.w Xvel,y
	lda.b $01,s
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $A5
	ldx.w Yvel,y
	lda.b $A9
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b $A5
	sta.b $B1
	tyx
	cpx.w #$001C
	beq CODE_9E8F9E
	jmp.w $900A
