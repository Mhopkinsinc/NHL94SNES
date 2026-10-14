; Players on the bench get some energy back
RestoreBenchEnergy:
	lda.l $7E34C6
	beq .rtl
	stz.b a2
	jsl.l .1
	lda.w #$0002
	sta.b a2
.1:
	lda.w #$0032
	sta.b d0
.loop:
	lda.b a2
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$FFFE
	bne .3
	lda.w tmpde,y
	clc
	adc.w #$000A
	sta.w tmpde,y
	sec
	sbc.w #$1000
	bmi .3
	lda.w #$1000
	sta.w tmpde,y
.3:
	dec.b d0
	dec.b d0
	bpl .loop
.rtl:
	rtl
