; Unidentified routine.
CODE_9D9918:
	lda.b $A9
	eor.w #$000F
	sta.b $A9
	sta.l $7E34F2
	lda.b $A5
	sta.l $7E34D0
	lda.w #$0000
	sta.l $7E35D4
	lda.w #$0007
	sta.w $0ACF
	lda.l $7E34BC
	cmp.w #$0002
	beq CODE_9D9959
	stz.w $0ACF
	lda.w #$0007
	sta.b $A5
	ldx.w #$0000
	txa
CODE_9D994B:
	sta.l $7E3548,x
	sta.l $7E3558,x
	inx
	inx
	dec.b $A5
	bpl CODE_9D994B
CODE_9D9959:
	jml.l CODE_9D9783
