; Unidentified routine.
CODE_9E8A90:
	lda.w gmclock
	bne CODE_9E8A85
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E8A84
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8ABE
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w temp5,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9E8ABE:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bmi CODE_9E8ACC
	jmp.w $8B79
