; Players on the bench get some energy back
RestoreBenchEnergy:
	lda.l $7E34C6
	beq CODE_9FDE12
	stz.b a2
	jsl.l CODE_9FDDDE
	lda.w #$0002
	sta.b a2
CODE_9FDDDE:
	lda.w #$0032
	sta.b d0
CODE_9FDDE3:
	lda.b a2
	beq CODE_9FDDEA
	lda.w #$0034
CODE_9FDDEA:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$FFFE
	bne CODE_9FDE0C
	lda.w tmpde,y
	clc
	adc.w #$000A
	sta.w tmpde,y
	sec
	sbc.w #$1000
	bmi CODE_9FDE0C
	lda.w #$1000
	sta.w tmpde,y
CODE_9FDE0C:
	dec.b d0
	dec.b d0
	bpl CODE_9FDDE3
CODE_9FDE12:
	rtl
