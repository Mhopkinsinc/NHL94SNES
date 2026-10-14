; Unidentified routine.
CODE_9BAF8B:
	jsl.l adda4
	lda.b d7
	beq CODE_9BAF6E
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BAFD8
	cmp.w #$0016
	bcs CODE_9BAFD0
	lda.w $0CB7
	sta.b $64
	lda.w $0CB3
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9BAFCC
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CB5
	sta.w $094A,y
CODE_9BAFCC:
	rep #$20
	bra CODE_9BAFD8
