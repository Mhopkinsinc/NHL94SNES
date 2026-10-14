; Unidentified routine.
CODE_9D9494:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D949A:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94AF

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94AF:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94C4

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94C4:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94DD

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94DD:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94F2

.t1:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94F2:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D949A
	pla
	rts
