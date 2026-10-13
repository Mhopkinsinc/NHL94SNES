; Unidentified routine.
CODE_9EEADD:
	lda.w puckvy
	bmi CODE_9EEAE9
CODE_9EEAE2:
	eor.w #$FFFF
	inc a
	sta.w puckvy
CODE_9EEAE9:
	lda.w puckvx
	sta.b $A5
	lda.w puckvy
	sta.b $A9
	jsl.l vtoa
	ldy.w #SPAgswing
	lda.w position,x
	beq CODE_9EEB0B
	ldy.w #SPApassf
	jsl.l Findhittype
	beq CODE_9EEB0B
	ldy.w #SPApassb
CODE_9EEB0B:
	sty.b $A9
	jsl.l SetSPA
	lda.w #$0001
	sta.w pfalock,x
	lda.w position,x
	bne CODE_9EEB2D
	lda.w $19D4,x
	bmi CODE_9EEB2D
	stz.w Xvel,x
	stz.w Yvel,x
	sta.b $B5
	jsl.l CODE_9FCBB6
CODE_9EEB2D:
	rtl
