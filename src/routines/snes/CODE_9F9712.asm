; Unidentified routine.
CODE_9F9712:
	jsl.l GetShifter
	lda.b $A9
	sta.w $0D31
	asl a
	sta.b $89
CODE_9F971E:
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9F973C
	ldx.b $89
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	bit.w #$0004
	bne CODE_9F973C
	jsl.l CODE_9F9EB7
CODE_9F973C:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F971E
	rtl
