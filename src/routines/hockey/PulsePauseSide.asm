; Pulse the palette colour of the pausing pad's side ($7F76DE or $7F76FE, PulseColour), the other side white; both white with no side
PulsePauseSide:
	lda.l $7E34CC
	beq .2
	ldx.w pausepad
	bmi .2
	lda.w $1C84,x
	beq .2
	dec a
	beq .t1
	ldx.w #$76DE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76FE
	bra .1

.t1:
	ldx.w #$76FE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76DE
.1:
	jsl.l PulseColour
	bra .3
.2:
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
.3:
	rts
