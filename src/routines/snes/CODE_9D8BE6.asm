; Unidentified routine.
CODE_9D8BE6:
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9D8C15
	lda.w $07ED
	cmp.w #$ED31
	beq CODE_9D8C15
	jsl.l CODE_9C9786
	jsl.l CODE_8086A9
CODE_9D8BFF:
	lda.w MusicOn
	bne CODE_9D8BFF
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w CODE_9D8C19
