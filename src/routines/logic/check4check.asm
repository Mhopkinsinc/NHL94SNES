; Look for a good chance to check an opponent
check4check:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b d0
	lda.l OptPen
	beq .1
	asl.b d0
.1:
	lda.b d0
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcc .2
	lda.b d0
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcs CODE_9EA1BC
.2:
	lda.w #$0005
	sta.b d2
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA19B
	ldy.w #$000C
CODE_9EA19B:
	sty.b a0
	lda.w position,y
	beq CODE_9EA1B4
	lda.w SPA,y
	cmp.w #$F3A6
	bcc .3
	cmp.w #$F46B
	bcc CODE_9EA1BD
.3:
	lda.w pfalock,y
	beq CODE_9EA1BD
CODE_9EA1B4:
	ldy.b a0
	iny
	iny
	dec.b d2
	bpl CODE_9EA19B
CODE_9EA1BC:
	rtl
