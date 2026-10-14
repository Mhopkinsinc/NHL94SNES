; Unidentified routine.
CODE_9FC988:
	jsl.l CODE_9CA58C
	lda.w $1E9B
	bne CODE_9FC9B2
	ldy.w #$0008
CODE_9FC994:
	lda.w $19F6,y
	and.w #$FF00
	cmp.w #$8000
	bne CODE_9FC9AE
	lda.w $19F6,y
	and.w #$00FF
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FC9AE:
	dey
	dey
	bpl CODE_9FC994
CODE_9FC9B2:
	lda.w $19D0
	cmp.w #$0004
	bcc CODE_9FCA12
	ldx.w #$000A
	ldy.w #$0000
CODE_9FC9C0:
	lda.w position,x
	beq CODE_9FC9C8
	bmi CODE_9FC9C8
	iny
CODE_9FC9C8:
	dex
	dex
	bpl CODE_9FC9C0
	sty.b d0
	ldx.w #$0008
	ldy.w #$0000
CODE_9FC9D4:
	lda.w $19F6,x
	cmp.w #$0000
	bne CODE_9FC9DD
	iny
CODE_9FC9DD:
	dex
	dex
	bpl CODE_9FC9D4
	cpy.b d0
	bcs CODE_9FCA12
	cpy.w $19D0
	beq CODE_9FCA12
	ldy.w $0AF9
CODE_9FC9ED:
	iny
	iny
	cpy.w #$000A
	bne CODE_9FC9F7
	ldy.w #$0000
CODE_9FC9F7:
	lda.w $19F6,y
	bpl CODE_9FC9ED
	and.w #$00FF
	cmp.w #$0080
	beq CODE_9FC9ED
	cmp.w #$0000
	bne CODE_9FC9ED
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FCA12:
	lda.w $19D2
	cmp.w #$0004
	bcc CODE_9FCA75
	ldx.w #$0016
	ldy.w #$0000
CODE_9FCA20:
	lda.w position,x
	beq CODE_9FCA28
	bmi CODE_9FCA28
	iny
CODE_9FCA28:
	dex
	dex
	cpx.w #$000C
	bpl CODE_9FCA20
	sty.b d0
	ldx.w #$0008
	ldy.w #$0000
CODE_9FCA37:
	lda.w $19F6,x
	cmp.w #$0002
	bne CODE_9FCA40
	iny
CODE_9FCA40:
	dex
	dex
	bpl CODE_9FCA37
	cpy.b d0
	bcs CODE_9FCA75
	cpy.w $19D0
	beq CODE_9FCA75
	ldy.w $0AFB
CODE_9FCA50:
	iny
	iny
	cpy.w #$000A
	bne CODE_9FCA5A
	ldy.w #$0000
CODE_9FCA5A:
	lda.w $19F6,y
	bpl CODE_9FCA50
	and.w #$00FF
	cmp.w #$0080
	beq CODE_9FCA50
	cmp.w #$0002
	bne CODE_9FCA50
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FCA75:
	stz.w $0C23
	ldx.w #$0016
	lda.w #$FFFF
CODE_9FCA7E:
	sta.w $19D4,x
	stz.w $0B05,x
	stz.w $0BCB,x
	stz.w $0BEB,x
	stz.w $0C0B,x
	dex
	dex
	bpl CODE_9FCA7E
	sta.w $0BA3
	ldx.w #$0008
CODE_9FCA97:
	sta.w $19EC,x
	dex
	dex
	bpl CODE_9FCA97
	lda.w $19D0
	beq CODE_9FCAD8
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF5
	lda.w #$FFFF
	sta.w $0AF5
	dex
	dex
	bpl CODE_9FCAB8
	ldx.w #$0008
CODE_9FCAB8:
	lda.w $19F6,x
	bne CODE_9FCACD
	stx.b d4
	phx
	lda.w $0AF5
	bpl CODE_9FCAC8
	stx.w $0AF5
CODE_9FCAC8:
	jsl.l findpc
	plx
CODE_9FCACD:
	dex
	dex
	bpl CODE_9FCAD4
	ldx.w #$0008
CODE_9FCAD4:
	dec.b $0C
	bne CODE_9FCAB8
CODE_9FCAD8:
	lda.w $19D2
	beq CODE_9FCB15
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF7
	lda.w #$FFFF
	sta.w $0AF7
	dex
	dex
	bpl CODE_9FCAF2
	ldx.w #$0008
CODE_9FCAF2:
	lda.w $19F6,x
	cmp.w #$0002
	bne CODE_9FCB0A
	stx.b d4
	phx
	lda.w $0AF7
	bpl CODE_9FCB05
	stx.w $0AF7
CODE_9FCB05:
	jsl.l findpc
	plx
CODE_9FCB0A:
	dex
	dex
	bpl CODE_9FCB11
	ldx.w #$0008
CODE_9FCB11:
	dec.b $0C
	bne CODE_9FCAF2
CODE_9FCB15:
	rtl
