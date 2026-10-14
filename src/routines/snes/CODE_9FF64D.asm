; Unidentified routine.
CODE_9FF64D:
	ldx.b $BB
	bne .t1
	lda.b $D9
	clc
	adc.w #$000C
	sta.b $D9
	sta.b $DB
	cmp.w #$0100
	bpl .t1
	lda.w #$0040
	tsb.b $C3
	bra .1

.t1:
	jsr.w CODE_9FF8D4
	lda.w #$0040
	tsb.b $C3
	lda.b d5
	sta.b $B7
.1:
	jmp.w CODE_9FF898
