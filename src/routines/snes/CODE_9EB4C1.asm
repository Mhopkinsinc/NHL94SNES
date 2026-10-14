; Unidentified routine.
CODE_9EB4C1:
	lda.b [a0]
	inc.b a0
	inc.b a0
	cmp.w #$0000
	bne CODE_9EB4C1
	dec.b a0
	dec.b a0
	dec.b a0
	dec.b a0
	lda.b [a0]
	pha
	and.w #$7FFF
	sta.b [a0]
	pla
	bmi CODE_9EB4F9
	lda.b [a0]
	xba
	and.w #$00FF
	asl a
	sta.b d1
	tay
	lda.w position,y
	bmi CODE_9EB4F1
	jmp.w CODE_9EB6CC
