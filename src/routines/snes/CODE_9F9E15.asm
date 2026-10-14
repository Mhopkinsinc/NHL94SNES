; Unidentified routine.
CODE_9F9E15:
	lda.b d0
.loop:
	cmp.w #$0064
	bcc .t1
	sbc.w #$0064
	bra .loop

.t1:
	sta.b d0
	rtl
