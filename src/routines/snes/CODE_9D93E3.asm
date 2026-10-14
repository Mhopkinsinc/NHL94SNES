; Unidentified routine.
CODE_9D93E3:
	txa
	asl a
	asl a
	asl a
	asl a
	pha
	sep #$20
	txa
	lsr a
	sta.l $7F7500,x
	inc a
	sta.l $7F7502,x
	tya
	lsr a
	lsr a
	lsr a
	and.b #$1C
	clc
	adc.b #$30
	cpx.w #$0200
	bcc .1
	ora.b #$01
.1:
	sta.l $7F7501,x
	sta.l $7F7503,x
	lda.b $01,s
	tax
	tya
	lsr a
	and.b #$0F
	sta.b $00
	jsr.w .t1
	rep #$20
	pla
	clc
	adc.w #$0020
	tax
	sep #$20
	jsr.w CODE_9D9494
	rep #$20
	rts

.t1:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D9430:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D9445

.t1:
	lda.b #$80
	sta.l $7F6700,x
CODE_9D9445:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D945A

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D945A:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9473

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9473:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9488

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9488:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D9430
	pla
	rts
