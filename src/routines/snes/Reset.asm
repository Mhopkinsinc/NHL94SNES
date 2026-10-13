; Unidentified routine.
Reset:
	clc
	xce
	rep #$30
	ldx.w #$1FFF
	txs
	lda.w #$0000
	tcd
	jml.l Reset_Fast
