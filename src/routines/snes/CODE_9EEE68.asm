; Unidentified routine.
CODE_9EEE68:
	cmp.w #$0020
	bcs CODE_9EEE70
	lda.w #$0020
CODE_9EEE70:
	sta.b d3
	ldx.b d0
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b d3
	ldx.b d1
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvy
	asl a
	asl a
	asl a
	asl a
	lda.w #$03C0
	sec
	sbc.b d4
	jsl.l CODE_9BB370
	clc
	adc.w #$10E0
	sta.w $0E01
	jsl.l puckflip
	ldx.b $E4
	lda.w #$FFFF
	sta.w $0BA3
	sta.w $0AD9
	lda.w #$001E
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	jmp.w CODE_9EEACC
