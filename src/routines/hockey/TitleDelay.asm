; A busy-wait of X loops, skipped once a pad press has ended the title (titleskip)
TitleDelay:
	phx
	ldx.w titleskip
	bne .1
	plx
.loop:
	dex
	bne .loop
	phx
.1:
	plx
	rts
