; Start the puck spinning
puckflip:
	lda.b d0
	and.w #$0001
	sta.b d0
	eor.w $117F
	and.w #$0003
	sta.w $117F
	lda.w #$FFFF
	sta.w $11FF
	phx
	ldx.w #$001C
	lda.w #$E978
	jsl.l SetSPAFromA
	plx
	rtl
