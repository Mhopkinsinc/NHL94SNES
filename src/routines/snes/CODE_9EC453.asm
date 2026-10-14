; Unidentified routine.
CODE_9EC453:
	lda.w #$FFA4
	sta.b d1
	sec
	sbc.w pucky
	beq CODE_9EC460
	bpl CODE_9EC479
CODE_9EC460:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EC471
	lda.b d1
	sec
	sbc.w Ypos,y
	beq CODE_9EC471
	bpl CODE_9EC4BC
CODE_9EC471:
	inc.b a0
	inc.b a0
	dec.b d0
	bpl CODE_9EC460
CODE_9EC479:
	lda.w #$0040
	sta.b d0
	lda.w #$8000
	trb.w sflags
	beq CODE_9EC4A9
	lda.l $7E344A
	bne CODE_9EC4A9
	lda.w #$0005
	sta.b d0
	lda.w #$0005
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	lda.w #$0002
	sta.w printx
	sta.w printy
	jsl.l eraser
CODE_9EC4A9:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
CODE_9EC4BB:
	rtl
