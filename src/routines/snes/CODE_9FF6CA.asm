; Unidentified routine.
CODE_9FF6CA:
	jsr.w CODE_9FF8D4
CODE_9FF6CD:
	lda.w #DATA8_9ADBD3
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l CODE_9FF8EA
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0004
	ldx.b $BB
	bne CODE_9FF6EC
	sta.b d5
	lda.w #$0000
CODE_9FF6EC:
	sta.b $B7
	jmp.w CODE_9FF898
