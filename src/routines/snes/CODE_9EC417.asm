; Unidentified routine.
CODE_9EC417:
	lda.w gmode
	bit.w #$0020
	bne .t2
	jmp.w CODE_9EC4BB

.t2:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w #$0005
	sta.b d0
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$000C
.1:
	sty.b a0
	lda.w #$005C
	sta.b d1
	lda.w pfgoal,x
	beq .t1
	jmp.w CODE_9EC4D4

.t1:
	lda.w #$FFA4
	sta.b d1
	sec
	sbc.w pucky
	beq .1x
	bpl CODE_9EC479
.1x:
	ldy.b a0
	lda.w position,y
	bmi .2
	lda.b d1
	sec
	sbc.w Ypos,y
	beq .2
	bpl CODE_9EC4BC
.2:
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .1x
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
