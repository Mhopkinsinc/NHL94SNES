; Unidentified routine.
DATA8_9EE43F:
	dw 0,12,15,12,15,6,15,0,0
	dw 0,-15,0,-15,6,-15,12,0,6
	cpx.w shotPlIdx
	bne .1
	lda.w $19D4,x
	bmi CODE_9EE47E
.1:
	jmp.w CODE_9E8BE6

.t1:
	rtl
