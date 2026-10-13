; Unidentified routine.
CODE_9BAFD0:
	sec
	sbc.w #$0015
	jsl.l CODE_9C9A7F
CODE_9BAFD8:
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BB01D
	cmp.w #$0016
	bcs CODE_9BB015
	lda.w $0CB1
	sta.b $64
	lda.w $0CAD
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9BB011
org $9BB001
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CAF
	sta.w $094A,y
CODE_9BB011:
	rep #$20
	bra CODE_9BB01D
