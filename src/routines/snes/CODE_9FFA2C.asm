; Unidentified routine.
CODE_9FFA2C:
	lda.b $C3
	bit.w #$0008
	beq CODE_9FFA6B
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.b $C9
	sta.b $0C
	lda.b $CB
	sta.b $0E
	ldy.b $C5
	ldx.b $C7
	jsl.l CODE_808723
	lda.b $C3
	bit.w #$0200
	beq CODE_9FFA60
CODE_9FFA50:
	lda.b $D1
	sta.b $0C
	lda.b $D3
	sta.b $0E
	ldy.b $CD
	ldx.b $CF
	jsl.l CODE_808723
CODE_9FFA60:
	pla
	sta.b $0E
	pla
	sta.b $0C
	lda.w #$0208
	trb.b $C3
CODE_9FFA6B:
	lda.b $C3
	bit.w #$0010
	beq CODE_9FFA8F
	sep #$20
	lda.b $D5
	sta.w BG1HOFS
	lda.b $D6
	sta.w BG1HOFS
	lda.b $D7
	sta.w BG1VOFS
	lda.b $D8
	sta.w BG1VOFS
	rep #$20
	lda.w #$0010
	trb.b $C3
CODE_9FFA8F:
	lda.b $C3
	bit.w #$0040
	beq CODE_9FFAB3
	sep #$20
	lda.b $D9
	sta.w M7A
	lda.b $DA
	sta.w M7A
	lda.b $DB
	sta.w M7D
	lda.b $DC
	sta.w M7D
	rep #$20
	lda.w #$0040
	trb.b $C3
CODE_9FFAB3:
	rtl
