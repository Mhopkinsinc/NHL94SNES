; Roster column: the player's energy as a percentage
AttribEnergy:
	asl.b d0
	lda.b a2
	beq .5
	lda.w #$0034
.5:
	adc.b d0
	tay
	lda.w tmpde,y
	sta.b $08
	lda.l OptLine
	cmp.w #$0002
	bne .2
.1:
	lda.w #$1000
	sta.b $08
.2:
	lda.w #$0028
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	cmp.w #$0065
	bcc .3
	lda.w #$0064
.3:
	sta.b d0
	bra AttribRating
