; Unidentified routine.
CODE_80C926:
	tay
	sep #$20
	lda.w homeshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$0000
	sta.w $1E8D
	stz.w $1E91
CODE_80C93E:
	jsl.l CODE_9F8511
	rtl
