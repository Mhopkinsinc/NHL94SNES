; Fill the stats row order with 0, 1, 2 ...
InitStatsOrder:
	lda.w #$0000
	ldy.w #$FFFF
.loop:
	iny
	sep #$20
	sta.w statsorder,y
	rep #$20
	inc a
	cpy.w listend
	bcc .loop
	rtl
