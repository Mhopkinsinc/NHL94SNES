; Unidentified routine.
CODE_9D9918:
	lda.b d1
	eor.w #$000F
	sta.b d1
	sta.l $7E34F2
	lda.b d0
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
	sta.b d0
	ldx.w #$0000
	txa
CODE_9D994B:
	sta.l $7E3548,x
	sta.l $7E3558,x
	inx
	inx
	dec.b d0
	bpl CODE_9D994B
CODE_9D9959:
	jml.l maketree
