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
	jsr.w .7
	rep #$20
	rts

.t1:
	lda.b #$01
	pha
	ldy.w #$0007
.2:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1x
	lda.b #$FF
	sta.l $7F6700,x
	bra .3

.t1x:
	lda.b #$80
	sta.l $7F6700,x
.3:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1xx
	lda.b #$7F
	sta.l $7F6700,x
	bra .4

.t1xx:
	lda.b #$00
	sta.l $7F6700,x
.4:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1xxx
	lda.b #$7F
	sta.l $7F6700,x
	bra .5

.t1xxx:
	lda.b #$00
	sta.l $7F6700,x
.5:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1xxxx
	lda.b #$7F
	sta.l $7F6700,x
	bra .6

.t1xxxx:
	lda.b #$00
	sta.l $7F6700,x
.6:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl .2
	pla
	rts
.7:
	lda.b #$01
	pha
	ldy.w #$0007
.1x:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1xxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .2x

.t1xxxxx:
	lda.b #$00
	sta.l $7F6700,x
.2x:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1xxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .3x

.t1xxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.3x:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1xxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .4x

.t1xxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.4x:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1xxxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .5x

.t1xxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.5x:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl .1x
	pla
	rts
