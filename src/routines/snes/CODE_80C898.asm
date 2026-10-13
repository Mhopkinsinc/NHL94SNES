; Unidentified routine.
CODE_80C898:		; a shootout turn of team $91: the shooter of this round from its list
	stz.w $1D83
	stz.w $1D87
	lda.b $91
	pha
	jsl.l ClearPenaltyBuffer
	stz.w gmode
	lda.b $91
	beq CODE_80C8B2
	lda.w #$0002
	sta.w gmode
CODE_80C8B2:
	jsl.l CODE_9F8433
	pla
	sta.b $91
	lda.w #$0000
	sta.w $1E8D
	lda.b $91
	beq CODE_80C8C9
	lda.w #$000C
	sta.w $1E8D
CODE_80C8C9:
	ldy.w #$0000
CODE_80C8CC:
	lda.w $19F6,y
	cmp.b $91
	beq CODE_80C8E2
	iny
	iny
	cpy.w #$000A
	bcc CODE_80C8CC
	lda.w #$FFFF
	sta.w $1E93
	bra CODE_80C8E5
