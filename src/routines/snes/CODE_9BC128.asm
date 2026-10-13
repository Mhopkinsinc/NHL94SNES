; Unidentified routine.
CODE_9BC128:
	lda.b $A5
	sec
	sbc.w $0CEB
	sta.b $A5
	lda.b $A9
	sec
	sbc.w $0D37
	sta.b $A9
CODE_9BC138:
	lda.b $A5
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #$0091
	bpl CODE_9BC16E
	lda.b $A5
	clc
	adc.w #$0080
	sta.b $A5
	lda.b $AD
	asl a
	clc
	adc.b $AD
	pha
	asl a
	pla
	ror a
	clc
	adc.b $A9
	sta.b $A9
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #$0091
	bpl CODE_9BC16E
	lda.w #$0070
	sec
	sbc.b $A9
	sta.b $A9
	rtl
