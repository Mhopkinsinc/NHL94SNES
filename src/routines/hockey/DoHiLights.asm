; Playoffs: play the highlight of each game of the round that has one
DoHiLights:
	lda.l $7E34BC
	beq CODE_9FA668
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
CODE_9FA645:
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FA660
	bit.w #$0002
	beq CODE_9FA660
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9F8DFA
CODE_9FA660:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9FA645
CODE_9FA668:
	rtl
