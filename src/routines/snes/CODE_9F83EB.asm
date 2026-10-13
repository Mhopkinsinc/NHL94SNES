; Unidentified routine.
CODE_9F83EB:
	cmp.w #$0002
	bne CODE_9F83F3
	inc.w $19D2
CODE_9F83F3:
	dex
	dex
	bpl CODE_9F83DE
	jsl.l CODE_9FB69E
	stz.w $1EBB
	ldx.w #$0000
CODE_9F8401:
	lda.w $1C84,x
	dec a
	asl a
	sta.w $19F6,x
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F8401
	ldx.w #$0000
CODE_9F8413:
	lda.w $1C84,x
	bne CODE_9F8421
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F8413
	bra CODE_9F8427
