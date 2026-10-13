; Unidentified routine.
CODE_9FF94F:
	php
	sta.w DAS0L
	lda.b $0C
	sta.w A1T0L
	stx.w VMADDL
	sep #$20
	lda.b $0E
	sta.w A1B0
	lda.b #$01
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.b #$01
	sta.w MDMAEN
	rep #$30
	plp
	rtl
