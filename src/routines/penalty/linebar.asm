; Unidentified routine.
linebar:
	jsl.l CODE_9FDF0C
	lda.w printa
	pha
	phx
	lda.w #$3000
	sta.w printa
	lda.b $A5
	cmp.w #$1000
	bcc CODE_9FDFBF
	lda.w #$1000
CODE_9FDFBF:
	sta.b $A5
	tax
	lda.w #$002F
	jsl.l CODE_808F98
	lda.b $0A
	clc
	adc.w #$001D
	sta.w $0A2C
	sta.w $0A2D
	sta.w $0A2E
	sta.w $0A2F
	sta.w $0A30
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	ldx.b $A5
	lda.w #$0054
	jsl.l CODE_808F98
	plx
	lda.b $0A
	inc a
	inc a
	sta.b [$8D]
	jsl.l CODE_9EC7BE
	pla
	sta.w printa
org $9FE000
	rtl
