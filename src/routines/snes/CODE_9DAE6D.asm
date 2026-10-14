; Unidentified routine.
CODE_9DAE6D:
	lda.b a2
	pha
	phx
	lda.w #$0001
	sta.l $7E3466
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b d1
	cmp.w HomeTeam
	bne CODE_9DAE96
	ldx.w #$1C00
	stx.b $14
	ldy.w #$0070
	lda.w #$0018
	sta.l $7E3466
CODE_9DAE96:
	lda.b d1
	asl a
	asl a
	tax
	lda.l DATA8_9C850F+2,x
	sta.b $0E
	lda.l DATA8_9C850F,x
	sta.b $0C
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w HomeTeam
	cmp.w VisTeam
	bne CODE_9DAEC9
	lda.b $14
	cmp.w #$1800
	beq CODE_9DAEC9
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b d1
	bra CODE_9DAE96
