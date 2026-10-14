; Unidentified routine.
CODE_9FC76C:
	stz.b a2
	lda.w #$0001
	sta.b $93
	ldx.w $0AC6
	bpl CODE_9FC792
	txa
	eor.w #$FFFF
	inc a
	sta.b $93
	ldx.w #$0000
CODE_9FC782:
	lda.w $1C84,x
	cmp.b $93
	beq CODE_9FC792
	inx
	inx
	cpx.w #$000A
	bcc CODE_9FC782
	bra CODE_9FC79E
