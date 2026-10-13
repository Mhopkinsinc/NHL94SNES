; Unidentified routine.
puckflip:
	lda.b $A5
	and.w #$0001
	sta.b $A5
	eor.w $117F
	and.w #$0003
	sta.w $117F
	lda.w #$FFFF
	sta.w $11FF
	phx
	ldx.w #$001C
	lda.w #SPApflip
	jsl.l CODE_9EA3F1
	plx
	rtl
