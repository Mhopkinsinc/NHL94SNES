; Unidentified routine.
CODE_9EB2D4:
	stz.b $A5
	stz.b $A9
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$000E
	beq CODE_9EB326
	pha
	lda.l $7E30F8
	sta.b $A5
	lda.l $7E30FA
	sta.b $A9
	pla
	cmp.w #$0006
	beq CODE_9EB326
	ldy.w $0D71
	sty.b $A5
	ldy.w pucky
	sty.b $A9
	cmp.w #$000C
	bne CODE_9EB326
	dec.b $89
	lda.b ($89)
	inc.b $89
	and.w #$00FF
	asl a
	tay
	lda.w #$0258
	sta.b $A9
	lda.w pfgoal,y
	beq CODE_9EB326
	lda.w #$FDA8
	sta.b $A9
CODE_9EB326:
	lda.b $A5
	sta.b $C5
	sec
	sbc.w #$0046
	bmi CODE_9EB335
	lda.w #$0046
	sta.b $A5
CODE_9EB335:
	lda.b $A5
	sec
	sbc.w #$FFBA
	bpl CODE_9EB342
	lda.w #$FFBA
	sta.b $A5
CODE_9EB342:
	lda.b $A9
	sec
	sbc.w #$00A6
	bmi CODE_9EB35D
	lda.w #$00CE
	sta.b $A9
	lda.w #$0046
	sta.b $A5
	lda.b $C5
	bpl CODE_9EB35D
	lda.w #$FFBA
	sta.b $A5
CODE_9EB35D:
	lda.b $A9
	sec
	sbc.w #$FF5A
	bpl CODE_9EB378
	lda.w #$FF32
	sta.b $A9
	lda.w #$0046
	sta.b $A5
	lda.b $C5
	bpl CODE_9EB378
	lda.w #$FFBA
	sta.b $A5
CODE_9EB378:
	lda.b $A5
	sta.l $7E3136
	lda.b $A9
	sta.l $7E3138
	jsl.l CODE_9FB601
CODE_9EB388:
	lda.b $83
	sec
	sbc.w $0D2B
	cmp.w #$003C
	bcc CODE_9EB393
CODE_9EB393:
	lda.w $0CA9
	bne CODE_9EB39E
	lda.w #$001E
	sta.w $0CA9
CODE_9EB39E:
	lda.w #$7000
	sta.b $64
	lda.w #$0015
	jsl.l CODE_80A17D
	stz.w Pencntdwn
	lda.w #$0004
	tsb.w gmode
	lda.w #$000A
	sta.b $A5
	jml.l SetPA
