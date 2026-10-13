; Unidentified routine.
CODE_9DA316:
	lda.b $AB
	beq CODE_9DA333
	ldx.w #$0000
	lda.w #$0000
CODE_9DA320:
	ora.w $1C84,x
	inx
	inx
	cpx.w #$000A
	bcc CODE_9DA320
	bit.w #$0001
	beq CODE_9DA363
	jsl.l CODE_9D995D
CODE_9DA333:
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA35F
	ldx.w #$0005
CODE_9DA33F:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq CODE_9DA35C
	sta.b $14
	txa
	dec a
	sta.b $16
CODE_9DA34D:
	lda.b $16
	asl a
	tay
	lda.w $1C84,y
	cmp.b $14
	beq CODE_9DA3A1
	dec.b $16
	bpl CODE_9DA34D
CODE_9DA35C:
	dex
	bne CODE_9DA33F
CODE_9DA35F:
	stz.w $0AD7
	rtl
