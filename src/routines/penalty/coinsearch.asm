; Count team a2's players kept off the ice by penalties to set how many it has on the ice
coinsearch:
	lda.w #$0006
	sta.b d1
	lda.w #$0032
	sta.b d0
.top:
	lda.b a2
	beq .tm
	lda.w #$0034
.tm:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi .nap
	beq .nap
	and.w #$DFFF
	sta.w tmpdst,y
	bit.w #(TMPDINJ|$4000)
	bne .nap
	lda.b d1
	cmp.w #$0004
	beq .nap
	dec.b d1
.nap:
	dec.b d0
	dec.b d0
	bpl .top
	ldy.b a2
	lda.b d1
	sta.w tmap,y
	rtl
