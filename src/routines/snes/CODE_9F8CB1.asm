; Unidentified routine.
CODE_9F8CB1:
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l WaitFrame
	jsl.l WaitFrame
CODE_9F8CC1:
	lda.w $0AD3
	bne CODE_9F8CC1
	lda.w SoundFadeSpeed
	bne CODE_9F8CC1
	jsl.l CODE_8086A9
	lda.w $1D81
	bne CODE_9F8D0B
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq CODE_9F8CFD
	cmp.w #$0004
	beq CODE_9F8CFD
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9F8CFD
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w CODE_9F8D0B
