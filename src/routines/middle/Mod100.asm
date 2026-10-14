; d0 = d0 mod 100
Mod100:
	lda.b d0
.loop:
	cmp.w #$0064
	bcc .t1
	sbc.w #$0064
	bra .loop

.t1:
	sta.b d0
	rtl
