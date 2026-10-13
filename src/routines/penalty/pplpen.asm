; Unidentified routine.
pplpen:
	lda.w printy
	cmp.w #$000B
	bcs CODE_9FA1B7
	lda.b $91
	beq CODE_9FA22D
	lda.w #$0034
CODE_9FA22D:
	adc.b $A5
	tay
	lda.w tmpdst,y
	and.w #$07FF
	sta.b $AD
	lda.w #$009C
	sta.b $8F
	ldy.b $91
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0000
	adc.b [$8D],y
	sta.b $8D
	lsr.b $A5
CODE_9FA24D:
	lda.b [$8D]
	clc
	adc.b $8D
	adc.w #$0008
	sta.b $8D
	dec.b $A5
	bpl CODE_9FA24D
	lda.b $8D
	sec
	sbc.w #$0008
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	sta.b $A5
	lda.w printx
	pha
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2C
	sta.b $8D
	jsl.l PutDigits2
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0004
	sta.b [$8D]
	jsl.l CODE_9EC7BE
	lda.b $AD
	sta.b $A5
	jsl.l PushTime
	inc.w printx
	jsl.l CODE_9EC7BE
	pla
	sta.w printx
	inc.w printy
	rtl
