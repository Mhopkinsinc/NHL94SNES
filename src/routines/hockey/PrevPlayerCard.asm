; Show the previous player card.
PrevPlayerCard:
	lda.w curitem
	beq PlayerCardsWait
	dec.w curitem
	lda.w curitem
	sec
	sbc.w #$0007
	bmi .2
	inc a
	inc a
	sta.w curplayer
	ldy.b a2
	lda.w #TeamList>>16
	sta.b a3+2
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
.loop:
	dec.w curplayer
	beq .1
	bmi .1
	ldy.w #$0000
.loop2:
	lda.b [a3],y
	and.w #$00FF
	cmp.w curplayer
	beq .loop
	iny
	cpy.w #$0006
	bmi .loop2
.1:
	dec.w curplayer
	lda.w curplayer
	clc
	adc.w #$0007
	sta.w curitem
.2:
	jsl.l DrawPlayerCard
	jmp.w PlayerCardsRedraw
