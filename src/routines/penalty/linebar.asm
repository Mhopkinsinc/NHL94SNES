; Unidentified routine.
linebar:
	jsl.l CODE_9FDF0C
	lda.w printa
	pha
	phx
	lda.w #$3000
	sta.w printa
	lda.b d0
	cmp.w #$1000
	bcc .1
	lda.w #$1000
.1:
	sta.b d0
	tax
	lda.w #$002F
	jsl.l CODE_808F98
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
	jsl.l CODE_808F98
	plx
	lda.b $0A
	inc a
	inc a
	sta.b [a1]
	jsl.l print
	pla
	sta.w printa
org $9FE000
	rtl
