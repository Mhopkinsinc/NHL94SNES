; Unidentified routine.
CODE_9BC767:
	lda.w #$0001
	sta.l $7E34BC
	jsl.l CODE_9F94AE
	jsl.l CODE_9D9783
	lda.l $7E35D4
	cmp.w #$0004
	beq CODE_9BC7D5
	lda.l $7E35D6
	bpl CODE_9BC7AE
	lda.l $7E34CE
	sec
	sbc.w #$0002
	bmi CODE_9BC7D9
	lda.l $7E35D4
	cmp.w #$0001
	bne CODE_9BC7D9
	lda.l $7E34F2
	eor.w #$0001
	sta.l $7E34F2
	lda.l $7E34CE
	eor.w #$0001
	sta.l $7E34CE
CODE_9BC7AE:
	jsl.l CODE_9BC623
	jsl.l CODE_9BCD30
	lda.w sflags3
	bit.w #$0004
	beq CODE_9BC7D1
	ldx.w #$000E
CODE_9BC7C1:
	lda.l $7E3518,x
	sta.l $7E3508,x
	dex
	dex
	bpl CODE_9BC7C1
	jsl.l CODE_9BCC41
CODE_9BC7D1:
	jml.l CODE_9D9783
