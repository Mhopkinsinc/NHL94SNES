; The puck slides and stops spinning.
pucknothing:
	lda.w SPAnum+puckobj
	cmp.w #$0008
	bcc .k
	cmp.w #$0018
	bcs .k
	lda.w facedir+puckobj
	eor.w #$0002
	sta.w facedir+puckobj
.k:
	lda.w #$0004
	tsb.w facedir+puckobj
	stz.w SPAnum+puckobj
	lda.w #$FFFF
	sta.w SPAcnt+puckobj
	rtl
