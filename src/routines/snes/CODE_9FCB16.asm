; Unidentified routine.
CODE_9FCB16:
	ldy.b $A5
	lda.w $19D4,y
	bpl CODE_9FCB5B
	phx
	ldx.w #$0000
	cpy.w #$000C
	bcc CODE_9FCB29
	ldx.w #$0002
CODE_9FCB29:
	lda.w $19D0,x
	beq CODE_9FCB4D
	ldy.w $0AFD,x
	dey
	dey
	bpl CODE_9FCB38
	ldy.w #$0008
CODE_9FCB38:
	lda.w #$0005
	sta.b $14
	txa
CODE_9FCB3E:
	cmp.w $19F6,y
	bne CODE_9FCB4F
	sty.b $B5
	tya
	sta.w $0AFD,x
	jsl.l CODE_9FCB68
CODE_9FCB4D:
	plx
	rtl
