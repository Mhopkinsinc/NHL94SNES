; Unidentified routine.
CODE_9FF794:
	jsr.w CODE_9FF8D4
CODE_9FF797:
	jsl.l CODE_9FF8E4
	lda.w #DATA8_9AEE5C
	sta.b tmp2
	lda.w #$009A
	sta.b $CB
	lda.w #$0020
	sta.b tmp0
	lda.w #$0010
	sta.b tmp1
	lda.w #$00C8
	tsb.b $C3
	lda.w #$000B
	ldx.b $BB
	bne CODE_9FF7C0
	sta.b d5
	lda.w #$0000
CODE_9FF7C0:
	sta.b $B7
	jmp.w CODE_9FF898
