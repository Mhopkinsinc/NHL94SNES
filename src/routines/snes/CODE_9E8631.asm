; Unidentified routine.
CODE_9E8631:
	lda.w gmclock
	bne CODE_9E862E
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E862D
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8659
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9E8659:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bmi CODE_9E8667
	jmp.w $87E9
