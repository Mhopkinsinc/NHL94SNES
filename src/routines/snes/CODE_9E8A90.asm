; Unidentified routine.
CODE_9E8A90:
	lda.w $15D6
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
	sta.w $1083,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8ABE:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9E8ACC
	jmp.w CODE_9E8B79
