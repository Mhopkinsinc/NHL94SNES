; Put the player at the cursor in shooter row $1DB9; if that player is already in the list, the two swap
SetShooter:
	ldy.b d1
	phy
	lda.w #$0009
	sec
	sbc.w $1D9B
	clc
	adc.w $1DA7
	and.w #$00FF
	sta.b d0
	lda.w #homeshooters>>16
	sta.b $8F
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq .1
	lda.w #awayshooters>>16
	sta.b $8F
	lda.w #awayshooters
	sta.b a1
.1:
	ldy.w $1DB9
	sep #$20
	lda.b [a1],y
	rep #$20
	and.w #$00FF
	sta.b d1
	lda.b d0
	ldy.w #$0001
.loop:
	sep #$20
	cmp.b [a1],y
	rep #$20
	beq .t1
	iny
	cpy.w #$0007
	bmi .loop
	bra .2

.t1:
	lda.b d1
	sep #$20
	sta.b [a1],y
	rep #$20
.2:
	ldy.w $1DB9
	lda.b d0
	sep #$20
	sta.b [a1],y
	rep #$20
	pla
	sta.b d1
	rtl
