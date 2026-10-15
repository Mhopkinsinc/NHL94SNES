; Show the next player card.
NextPlayerCard:
	lda.w curitem
	cmp.w listend
	bpl PlayerCardsWait
	inc.w curitem
	lda.w curitem
	sec
	sbc.w #$0007
	bmi .1
	sta.w curplayer
	ldy.b a2
	lda.w #$009C
	sta.b a3+2
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
.loop:
	inc.w curplayer
	ldy.w #$0000
.loop2:
	lda.b [a3],y
	and.w #$00FF
	cmp.w curplayer
	beq .loop
	iny
	cpy.w #$0006
	bmi .loop2
	dec.w curplayer
	lda.w curplayer
	clc
	adc.w #$0007
	sta.w curitem
.1:
	jsl.l DrawPlayerCard
	jmp.w PlayerCardsRedraw
