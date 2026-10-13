; Unidentified routine.
CODE_9FE0E8:
	ldx.w #$026F
CODE_9FE0EB:
	lda.w #$000E
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc CODE_9FE0FA
	lda.w #$000C
CODE_9FE0FA:
	sta.b $14
	lda.w seed
	and.w #$0010
	beq CODE_9FE111
	sep #$20
	lda.b $14
	sta.w $1A12,x
CODE_9FE10B:
	rep #$20
	dex
	bpl CODE_9FE0EB
	rtl
