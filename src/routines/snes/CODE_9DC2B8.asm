; Unidentified routine.
CODE_9DC2B8:
	lda.b [$95],y
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC4D0
	txa
	sta.b $A9
	lda.b [$8D]
	dec a
	dec a
	lsr a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $A9
	tax
	ldy.w printy
	jsl.l CODE_9C9590
	rtl
