; Shootout: the 6 starters of the home or away team as the shooter list
InitShooters:
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .0
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
.0:
	ldy.b a2
	lda.w #TeamList>>16
	sta.b a1+2
	lda.w tmdata,y
	sta.b a1
	ldy.w #$000C
	clc
	adc.b [a1],y
	sta.b a1
	lda.w #$0007
	sta.b d0
.loop:
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	dec.b d0
	bpl .loop
	rtl
