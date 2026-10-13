; Unidentified routine.
CODE_9C8980:
	phy
	lda.b $A9
	pha
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	lda.w #$0003
	sta.w printx
	stx.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	stx.w $1DC9
	lda.b $91
	beq CODE_9C89A5
CODE_9C89A2:
	lda.w #$001A
CODE_9C89A5:
	clc
	adc.w $1DC9
	tax
	lda.w #$0001
	jsl.l CODE_9C8D17
	lda.w #$0011
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0002
	jsl.l CODE_9C8D17
	lda.w #$0014
	sta.w printx
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0003
	jsl.l CODE_9C8D17
	lda.w #$0017
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.b $A5
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0004
	jsl.l CODE_9C8D17
	lda.w #$001A
	sta.w printx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0005
	jsl.l CODE_9C8D17
	lda.w #$001D
	sta.w printx
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	pla
	sta.b $A9
	ply
	rtl
