; Unidentified routine.
CODE_9DB954:
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80E2E0
	sta.b $8D
	lda.w #$0000
	ldx.w #$0080
	ldy.w #$00B8
	jsl.l CODE_9C9415
	lda.w #$0080
	sta.b $8F
	lda.w #$E2F7
	sta.b $8D
	lda.w #$0000
	ldx.w #$0080
	ldy.w #$00C8
	jsl.l CODE_9C9415
	rts
