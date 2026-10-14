; Roster column: the fighting rating, then the rating printer AttribRating
AttribFighting:
	lda.b d0
	and.w #$000E
	sta.b d0
	dec.b d1
AttribRating:
	lda.w #$0004
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #AttribFightingPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
