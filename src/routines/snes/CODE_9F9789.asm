; Unidentified routine.
CODE_9F9789:
	lda.w #$0001
	sta.l $7E35F2
	jsl.l CODE_9F992E
CODE_9F9794:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9F97CE
	sta.b $89
	ldy.b $B5
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	stx.b $87
	ldx.w #$0012
CODE_9F97C4:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9F97C4
	ldx.b $87
	rtl
