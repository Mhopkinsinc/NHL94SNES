; Unidentified routine.
CODE_9EB2D4:
	stz.b d0
	stz.b d1
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$000E
	beq CODE_9EB326
	pha
	lda.l $7E30F8
	sta.b d0
	lda.l $7E30FA
	sta.b d1
	pla
	cmp.w #$0006
	beq CODE_9EB326
	ldy.w $0D71
	sty.b d0
	ldy.w pucky
	sty.b d1
	cmp.w #$000C
	bne CODE_9EB326
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	asl a
	tay
	lda.w #$0258
	sta.b d1
	lda.w pfgoal,y
	beq CODE_9EB326
	lda.w #$FDA8
	sta.b d1
CODE_9EB326:
	lda.b d0
	sta.b tmp0
	sec
	sbc.w #$0046
	bmi CODE_9EB335
	lda.w #$0046
	sta.b d0
CODE_9EB335:
	lda.b d0
	sec
	sbc.w #$FFBA
	bpl CODE_9EB342
	lda.w #$FFBA
	sta.b d0
CODE_9EB342:
	lda.b d1
	sec
	sbc.w #$00A6
	bmi CODE_9EB35D
	lda.w #$00CE
	sta.b d1
	lda.w #$0046
	sta.b d0
	lda.b tmp0
	bpl CODE_9EB35D
	lda.w #$FFBA
	sta.b d0
CODE_9EB35D:
	lda.b d1
	sec
	sbc.w #$FF5A
	bpl CODE_9EB378
	lda.w #$FF32
	sta.b d1
	lda.w #$0046
	sta.b d0
	lda.b tmp0
	bpl CODE_9EB378
	lda.w #$FFBA
	sta.b d0
CODE_9EB378:
	lda.b d0
	sta.l $7E3136
	lda.b d1
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
	sta.b d0
	jml.l SetPA
