; Draw the energy bar of line d0
linebar:
	jsl.l getlinee
	lda.w $0D0D
	pha
	phx
	lda.w #$3000
	sta.w $0D0D
	lda.b d0
	cmp.w #$1000
	bcc .1
	lda.w #$1000
.1:
	sta.b d0
	tax
	lda.w #$002F
	jsl.l Mul16x8U
	lda.b $0A
	clc
	adc.w #$001D
	sta.w mesarea+2
	sta.w $0A2D
	sta.w $0A2E
	sta.w $0A2F
	sta.w $0A30
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	ldx.b d0
	lda.w #$0054
	jsl.l Mul16x8U
	plx
	lda.b $0A
	inc a
	inc a
	sta.b [a1]
	jsl.l print
	pla
	sta.w $0D0D
org $9FE000
	rtl
