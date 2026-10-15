; After a playoff game, work out the winners and the new password
EncodePW:
	lda.l $7E34BC
	bne .t2
	jmp.w .4

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
	bmi .3
	lda.l playoffRoundIdx
	cmp.w #$0001
	bne .3
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
	jsl.l ResetPassWord
.3:
	lda.w #$0080
	ora.l PassWord
	sta.l PassWord
	lda.w #$0002
	sta.l $7E34BC
	lda.w bosgames
	cmp.w #$0007
	beq .4
	lda.w #$0003
	sta.l $7E34BC
.4:
	rtl
