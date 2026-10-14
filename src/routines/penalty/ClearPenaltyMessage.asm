; Clear the penalty message area on the horizontal rink (a 24 x 3 frame at 4, $0C)
ClearPenaltyMessage:
	lda.b d0
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ClearPenaltyMessagePos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l Framer
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ClearPenaltyMessagePos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b d0
	rtl
