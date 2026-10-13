; Unidentified routine.
DATA8_9EE43F:
	dw 0,12,15,12,15,6,15,0,0
	dw 0,-15,0,-15,6,-15,12,0,6
	cpx.w $0AD9
	bne CODE_9EE46D
	lda.w $19D4,x
	bmi CODE_9EE47E
CODE_9EE46D:
	jmp.w $8BE6
