; Give every player of team a2 full energy
reenergizeteam:
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
	lda.w #$1000
	sta.w tmpde,y
	lda.w tmpdst,y
	cmp.w #TMPDOUT
	bne .nb
	cmp.w #rosterNone
	bne .nb
	lda.w #TMPDBENCH
	sta.w tmpdst,y
.nb:
	dec.b d0
	dec.b d0
	bpl .top
	rtl
