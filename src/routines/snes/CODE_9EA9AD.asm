; Unidentified routine.
CODE_9EA9AD:
	stz.w $1523,x
CODE_9EA9B0:
	pla
	sta.b $A5
	pla
	sta.b $A9
	lda.w $1163,x
	sta.b $AD
	lda.b $A5
	sec
	sbc.b $AD
	and.w #$0007
	asl a
	sta.b $A5
	tax
	lda.l DATA8_9EAAA3,x
	ldx.b $95
	cmp.w #$0000
	bne CODE_9EA9D5
	jmp.w CODE_9EAAB3
