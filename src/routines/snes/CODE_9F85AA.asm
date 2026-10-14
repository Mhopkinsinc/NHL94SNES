; Unidentified routine.
CODE_9F85AA:
	ldx.b d7
CODE_9F85AC:
	lda.w gameclock
	beq CODE_9F85D0
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs CODE_9F85D0
	dec.w gameclock
	lda.w $19BE
	clc
	adc.w #$FFFD
	bmi CODE_9F85CC
	sta.w $19BE
CODE_9F85CC:
	jsl.l CODE_9B9BF8
CODE_9F85D0:
	dex
	bne CODE_9F85AC
CODE_9F85D3:
	lda.w $0CE7
	beq CODE_9F85F0
	lda.b $83
	sec
	sbc.w $0CE9
	cmp.w #$0096
	bcc CODE_9F85F0
	dec.w $0CE7
	lda.w $0CE9
	clc
	adc.w #$0096
	sta.w $0CE9
CODE_9F85F0:
	jsl.l CODE_9F8625
	jsl.l CODE_9F967B
	lda.w sflags
	bit.w #$0001
	bne CODE_9F8613
	lda.w $1A0E
	beq CODE_9F8617
	lda.w gmode
	bit.w #$0010
	bne CODE_9F8617
	lda.w #$0001
	tsb.w sflags
CODE_9F8613:
	jsl.l CODE_9F937B
CODE_9F8617:
	lda.w $1D81
	beq CODE_9F8622
	lda.w $1D87
	beq CODE_9F8622
	rtl
