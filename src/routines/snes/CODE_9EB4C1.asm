; Unidentified routine.
CODE_9EB4C1:
	lda.b [$89]
	inc.b $89
	inc.b $89
	cmp.w #$0000
	bne CODE_9EB4C1
	dec.b $89
	dec.b $89
	dec.b $89
	dec.b $89
	lda.b [$89]
	pha
	and.w #$7FFF
	sta.b [$89]
	pla
	bmi CODE_9EB4F9
	lda.b [$89]
	xba
	and.w #$00FF
	asl a
	sta.b $A9
	tay
	lda.w position,y
	bmi CODE_9EB4F1
	jmp.w $B6CC
