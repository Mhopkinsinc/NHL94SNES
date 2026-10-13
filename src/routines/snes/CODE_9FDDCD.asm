; Unidentified routine.
CODE_9FDDCD:
	lda.l $7E34C6
	beq CODE_9FDE12
	stz.b $91
	jsl.l CODE_9FDDDE
	lda.w #$0002
	sta.b $91
CODE_9FDDDE:
	lda.w #$0032
	sta.b $A5
CODE_9FDDE3:
	lda.b $91
	beq CODE_9FDDEA
	lda.w #$0034
CODE_9FDDEA:
	clc
	adc.b $A5
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
	dec.b $A5
	dec.b $A5
	bpl CODE_9FDDE3
CODE_9FDE12:
	rtl
