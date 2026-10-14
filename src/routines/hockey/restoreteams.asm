; Put both teams' players on the bench
restoreteams:
	stz.b a2
	jsl.l .r
	lda.w #$0002
	sta.b a2
.r:
	ldy.b a2
	lda.w #$0006
	sta.w tmap,y
	lda.w #$0032
	sta.b d0
.0:
	lda.b a2
	beq .home
	lda.w #$0034
.home:
	clc
	adc.b d0
	tay
	lda.w #TMPDBENCH
	sta.w tmpdst,y
	dec.b d0
	dec.b d0
	bpl .0
	rtl
