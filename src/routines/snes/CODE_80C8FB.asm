; Unidentified routine.
CODE_80C8FB:
	tay
	sep #$20
	lda.w awayshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$000C
	sta.w $1E8D
	lda.w #$0002
	sta.w $1E91
	bra CODE_80C93E
