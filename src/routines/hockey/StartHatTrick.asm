; Start the hat trick sprites: clear the ten slots ($7E340C) and set $7E3448
StartHatTrick:
	phx
	ldx.w #$0012
	lda.w #$0000
.loop:
	sta.l $7E340C,x
	dex
	dex
	bpl .loop
	plx
	lda.w #$0001
	sta.l $7E3448
	rtl
