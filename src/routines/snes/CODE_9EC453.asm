; Unidentified routine.
CODE_9EC453:
	lda.w #$FFA4
	sta.b $A9
	sec
	sbc.w pucky
	beq CODE_9EC460
	bpl CODE_9EC479
CODE_9EC460:
	ldy.b $89
	lda.w position,y
	bmi CODE_9EC471
	lda.b $A9
	sec
	sbc.w Ypos,y
	beq CODE_9EC471
	bpl CODE_9EC4BC
CODE_9EC471:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC460
CODE_9EC479:
	lda.w #$0040
	sta.b $A5
	lda.w #$8000
	trb.w sflags
	beq CODE_9EC4A9
	lda.l $7E344A
	bne CODE_9EC4A9
	lda.w #$0005
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.w #$0002
	sta.w printx
	sta.w printy
	jsl.l eraser
CODE_9EC4A9:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9EC4BB:
	rtl
