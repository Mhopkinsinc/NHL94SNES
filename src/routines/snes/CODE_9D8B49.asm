; Unidentified routine.
CODE_9D8B49:
	sep #$20
	lda.b #$A0
	sta.w WOBJSEL
	lda.b #$0C
	sta.w WH0
	lda.b #$B3
	sta.w WH1
	lda.b #$10
	sta.w CGWSEL
	lda.b #$02
	sta.w CGADSUB
	lda.b #$E5
	sta.w COLDATA
	lda.b #$44
	sta.w DMAP2
	lda.b #$9D
	sta.w A1B2
	sta.w DASB2
	ldx.w #DATA8_9D8BA9
	stx.w A1T2L
	lda.b #$26
	sta.w BBAD2
	lda.b #$40
	sta.w DMAP3
	lda.b #$9D
	sta.w A1B3
	sta.w DASB3
	ldx.w #DATA8_9D8BB5
	stx.w A1T3L
	lda.b #$32
	sta.w BBAD3
	lda.b #$0C
	sta.w HDMAEN
	rep #$20
	rtl
