; Unidentified routine.
CODE_9C9ABC:
	pha
	lda.w puckvx
	cmp.w #$8000
	ror a
	sta.b $0C
	lda.w puckvy
	cmp.w #$8000
	ror a
	sta.b $0E
	pla
CODE_9C9AD0:
	phx
	sta.b $12
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $0D
	and.w #$00FF
	cmp.w #$0080
	bcc .1
	ora.w #$FF00
.1:
	tax
	jsl.l CODE_808F7D
	sta.b $64
	lda.b $0F
	and.w #$00FF
	cmp.w #$0080
	bcc .2
	ora.w #$FF00
.2:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $64
	lsr a
	lsr a
	lsr a
	sta.b $64
	cmp.w #$0070
	bcs .t1
	xba
	sta.b $64
	bra CODE_9C9B19

.t1:
	lda.w #$7000
	sta.b $64
CODE_9C9B19:
	ldy.w #$0002
	lda.b [$4E],y
	tax
	lda.w $0792
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
	dec.w SoundLock
	lda.w $08F2,y
	cmp.b #$02
	bne .1
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.b $0C
	sta.w $094A,y
	sta.w $0CAF
.1:
	sep #$20
	inc.w SoundLock
	rep #$20
	plx
	rtl
