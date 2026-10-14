; Unidentified routine.
CODE_9FF6BA:
	lda.b $BB
	bne .t1
	lda.w #$0000
	jsl.l CODE_80A200
	jsr.w CODE_9FF8DC
	bra .2

.t1:
	jsr.w CODE_9FF8D4
.2:
	lda.w #DATA8_9ADBD3
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l CODE_9FF8EA
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0004
	ldx.b $BB
	bne .1
	sta.b d5
	lda.w #$0000
.1:
	sta.b $B7
	jmp.w CODE_9FF898
