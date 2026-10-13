; Unidentified routine.
assnearest:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E802A
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp3,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	stz.w temp1,x
CODE_9E802A:
	lda.w position,x
	beq CODE_9E8042
	cpx.w puckc
	bne CODE_9E8046
	lda.w #$0011
	sta.b $A5
	lda.w $19D4,x
	bpl CODE_9E8041
	jmp.w $8C0E
