; While the pause pad holds A or B: pulse the side colour (PulsePauseSide) and send it to CGRAM each frame
PulseUntilRelease:
	jsr.w PulsePauseSide
	lda.w #$007F
	sta.b p0+2
	lda.w #$76C0
	sta.b p0
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l DMAToCGRAM
	ldx.w pausepad
	lda.w JoyPad,x
	bit.w #$8080
	bne PulseUntilRelease
	rts
