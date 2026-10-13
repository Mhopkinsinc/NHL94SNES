; Unidentified routine.
CODE_9EA164:
	lda.w #$0014
	sec
	sbc.w aggress,x
	sta.b $A5
	lda.l $7E34C4
	beq CODE_9EA175
	asl.b $A5
CODE_9EA175:
	lda.b $A5
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcc CODE_9EA18B
	lda.b $A5
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcs CODE_9EA1BC
CODE_9EA18B:
	lda.w #$0005
	sta.b $AD
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA19B
	ldy.w #$000C
CODE_9EA19B:
	sty.b $89
	lda.w position,y
	beq CODE_9EA1B4
	lda.w SPA,y
	cmp.w #DATA8_9DF3A6
	bcc CODE_9EA1AF
	cmp.w #DATA8_9DF46A+1
	bcc CODE_9EA1BD
CODE_9EA1AF:
	lda.w pfalock,y
	beq CODE_9EA1BD
CODE_9EA1B4:
	ldy.b $89
	iny
	iny
	dec.b $AD
	bpl CODE_9EA19B
CODE_9EA1BC:
	rtl
