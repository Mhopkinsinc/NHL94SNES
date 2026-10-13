; Unidentified routine.
CODE_9FF7C5:
	lda.w #DATA8_9AEE7C
	sta.b $C9
	lda.w #$009A
	sta.b $CB
	lda.w #$0010
	sta.b $C5
	lda.w #$0010
	sta.b $C7
	lda.w #$0008
	tsb.b $C3
	lda.w #$000D
	sta.b $B7
	jmp.w $F898
