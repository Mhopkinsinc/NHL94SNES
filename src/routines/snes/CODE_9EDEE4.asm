; Unidentified routine.
CODE_9EDEE4:
	lda.w $163A
	bne CODE_9EDF0C
	jsl.l CODE_9E8272
	bne CODE_9EDF0C
	lda.w $0D2D
	beq CODE_9EDF0C
	lda.w Ypos,x
	cmp.w #$FF13
	bmi CODE_9EDF0C
	cmp.w #$00ED
	bpl CODE_9EDF0C
	lda.w seed
	and.w #$0003
	bne CODE_9EDF0C
	jmp.w $ED85
