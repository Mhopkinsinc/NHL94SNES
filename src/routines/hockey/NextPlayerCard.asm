; Show the next player card.
NextPlayerCard:
	lda.w $1DB9
	cmp.w $1DC1
	bpl PlayerCardsWait
	inc.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi .1
	sta.w $1D9B
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
.loop:
	inc.w $1D9B
	ldy.w #$0000
.loop2:
	lda.b [a3],y
	and.w #$00FF
	cmp.w $1D9B
	beq .loop
	iny
	cpy.w #$0006
	bmi .loop2
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
.1:
	jsl.l DrawPlayerCard
	jmp.w PlayerCardsRedraw
