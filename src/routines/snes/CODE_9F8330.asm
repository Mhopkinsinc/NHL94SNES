; Unidentified routine.
CODE_9F8330:
	jsl.l CODE_9D8BBF
CODE_9F8334:
	jsl.l CODE_9FE0E8
	jsl.l CODE_9D8129
CODE_9F833C:
	lda.w #$FFFF
	sta.w $07C6
	jsl.l CODE_9F96F7
	ldx.w #$0AD7
	lda.w #$0000
CODE_9F834C:
	sta.b $00,x
	inx
	cpx.w #$1A11
	bne CODE_9F834C
	ldx.w #$30F4
CODE_9F8357:
	sta.l $7E0000,x
	inx
	cpx.w #$3479
	bne CODE_9F8357
	lda.l $7E347A
	inc a
	sta.l $7E347A
	stz.w gmode
	lda.l $7E34C4
	cmp.w #$0001
	bne CODE_9F837C
	lda.w #$0020
	tsb.w gmode
CODE_9F837C:
	jsl.l ClearTeamStats
	jsl.l restoreteams
	jsl.l CODE_9FC833
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	lda.w #$0010
	trb.w sflags
	lda.b $91
	pha
	lda.w #$0000
	sta.b $91
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9B9334
	pla
	sta.b $91
	lda.l $7E34C8
	sta.w $1C90
	sta.w $1C92
	lda.w #$0001
	sta.w $17E2
	sta.w $17E4
	stz.w $1E9B
	stz.w $1E9D
	stz.w $1EAD
	lda.w #$0001
	sta.l $7E344E
	stz.w $19D0
	stz.w $19D2
	ldx.w #$0008
CODE_9F83DE:
	lda.w $1C84,x
	cmp.w #$0001
	bne CODE_9F83EB
	inc.w $19D0
	bra CODE_9F83F3
