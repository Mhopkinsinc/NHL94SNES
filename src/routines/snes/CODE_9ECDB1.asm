; Unidentified routine.
CODE_9ECDB1:
	bvc CODE_9ECDAE
CODE_9ECDB3:
	dec.w VertLineScrolling
	lda.w #$0007
	sta.b $14
	lda.w #$007E
	sta.b $12
	lda.w #$3B78
	sta.b $10
	lda.b $12
	sta.b $0E
.loop:
	ldx.w #$0028
	lda.b $10
	clc
	adc.w #$0040
	sta.b $0C
	jsl.l CODE_808F2F
	lda.b $0C
	sta.b $10
	dec.b $14
	bpl .loop
	rtl
