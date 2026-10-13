; Unidentified routine.
CODE_9FA636:
	lda.l $7E34BC
	beq CODE_9FA668
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9FA645:
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FA660
	bit.w #$0002
	beq CODE_9FA660
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9F8DFA
CODE_9FA660:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9FA645
CODE_9FA668:
	rtl
