; Title: raise the mode 7 scale $0BFB to $200 while the BG1 scroll moves to $120, $140
TitleZoomOutLeft:
	lda.w TitleM7Scale
	inc a
	cmp.w #$0200
	bcs .t1
	sta.w TitleM7Scale
	sec
	sbc.w #$0100
	pha
	ldx.w #$0070
	jsl.l Mul8U
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0190
	sta.w TitleM7HOfs
	pla
	ldx.w #$0040
	jsl.l Mul8U
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0180
	sta.w TitleM7VOfs
	ldx.w #$03E8
	jsr.w TitleDelay
	bra TitleZoomOutLeft

.t1:
	lda.w #$0200
	sta.w TitleM7Scale
	lda.w #$0120
	sta.w TitleM7HOfs
	lda.w #$0140
	sta.w TitleM7VOfs
	rts
