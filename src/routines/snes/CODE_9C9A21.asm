; Unidentified routine.
CODE_9C9A21:
	cmp.w #$0003
	beq .1
	jsl.l SPCStreamNext
	cmp.w #$0000
	beq .t1
	lda.l $7E35E8
	cmp.w #$0001
	bne CODE_9C9A20
	lda.w #$0002
	sta.l $7E35E8
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A17D
	rtl

.t1:
	lda.w #$0003
	sta.l $7E35E8
.1:
	rtl
