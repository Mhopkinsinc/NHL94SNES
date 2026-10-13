; Unidentified routine.
CODE_9C9B14:
	lda.w #$7000
	sta.b $64
CODE_9C9B19:
	ldy.w #$0002
	lda.b [$4E],y
	tax
	lda.w seed
	and.w #$003F
	clc
	adc.w #$00C0
	jsl.l CODE_808F98
	lda.b $09
	sta.b $0C
	lda.b $12
	jsl.l CODE_80A17D
	tay
	sep #$20
	dec.w $07E5
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9C9B56
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.b $0C
	sta.w $094A,y
	sta.w $0CAF
CODE_9C9B56:
	sep #$20
	inc.w $07E5
	rep #$20
	plx
	rtl
