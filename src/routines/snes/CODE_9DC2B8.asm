; Unidentified routine.
CODE_9DC2B8:
	lda.b [a3],y
	and.w #$00FF
	dec a
	sta.b d0
	jsl.l PlayerShortName
	txa
	sta.b d1
	lda.b [a1]
	dec a
	dec a
	lsr a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b d1
	tax
	ldy.w printy
	jsl.l CODE_9C9590
	rtl
