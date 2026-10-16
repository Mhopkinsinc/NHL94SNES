; Each frame: step the cheering bench through its frames (benchframe), and end it ($FFFF) after its rounds
UpdateBenchCheer:
	lda.w benchcheer
	beq .5
	lda.w benchframe
	and.w #$0007
	sta.w benchframe
	lda.w benchtimer
	sec
	sbc.w timestep
	bpl .t1
	clc
	adc.w #$000B
	sta.w benchtimer
	lda.w benchrounds
	cmp.w #$0004
	beq .2
	lda.w benchframe
	inc a
	cmp.w #$0006
	bne .3
	lda.w benchrounds
	inc a
	sta.w benchrounds
	cmp.w #$0004
	beq .4
	lda.w #$0002
	bra .3

.t1:
	sta.w benchtimer
	bra .4
.1:
	stz.w benchcheer
	bra .5
.2:
	lda.w benchframe
	dec a
	bmi .1
.3:
	sta.w benchframe
.4:
	lda.w benchcheer
	asl a
	asl a
	asl a
	adc.w benchframe
	sta.w benchframe
	rtl
.5:
	lda.w #$FFFF
	sta.w benchframe
	rtl
