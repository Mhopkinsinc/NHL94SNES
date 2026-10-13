; Unidentified routine.
CODE_9FB5CD:
	ldy.w #$0000
CODE_9FB5D0:
	lda.w $19F6,y
	cmp.b $91
	beq CODE_9FB5E3
	iny
	iny
	cpy.w #$000A
	bcc CODE_9FB5D0
	lda.w #$FFFF
	bra CODE_9FB5E4
