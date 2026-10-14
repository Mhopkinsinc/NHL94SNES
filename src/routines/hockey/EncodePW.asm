; After a playoff game, work out the winners and the new password
EncodePW:
	lda.l $7E34BC
	bne .t2
	jmp.w CODE_9BC7FA

.t2:
	lda.w #$0001
	sta.l $7E34BC
	jsl.l ResolveGames
	jsl.l maketree
	lda.l playoffRoundIdx
	cmp.w #$0004
	beq .t1
	lda.l $7E35D6
	bpl .1
	lda.l $7E34CE
	sec
	sbc.w #$0002
	bmi CODE_9BC7D9
	lda.l playoffRoundIdx
	cmp.w #$0001
	bne CODE_9BC7D9
	lda.l $7E34F2
	eor.w #$0001
	sta.l $7E34F2
	lda.l $7E34CE
	eor.w #$0001
	sta.l $7E34CE
.1:
	jsl.l WritePassBits
	jsl.l BitstoPW
	lda.w sflags3
	bit.w #$0004
	beq .2
	ldx.w #$000E
.loop:
	lda.l $7E3518,x
	sta.l passbits,x
	dex
	dex
	bpl .loop
	jsl.l ReadPassBits
.2:
	jml.l maketree

.t1:
	jsl.l CODE_9BCDE2
CODE_9BC7D9:
	lda.w #$0080
	ora.l PassWord
	sta.l PassWord
	lda.w #$0002
	sta.l $7E34BC
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9BC7FA
	lda.w #$0003
	sta.l $7E34BC
CODE_9BC7FA:
	rtl
