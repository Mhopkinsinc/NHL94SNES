; Unidentified routine.
CODE_9D9494:
	lda.b #$01
	pha
	ldy.w #$0007
.1:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra .2

.t1:
	lda.b #$00
	sta.l $7F6700,x
.2:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1x
	lda.b #$FF
	sta.l $7F6700,x
	bra .3

.t1x:
	lda.b #$00
	sta.l $7F6700,x
.3:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1xx
	lda.b #$FF
	sta.l $7F6700,x
	bra .4

.t1xx:
	lda.b #$00
	sta.l $7F6700,x
.4:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1xxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .5

.t1xxx:
	lda.b #$00
	sta.l $7F6700,x
.5:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl .1
	pla
	rts
