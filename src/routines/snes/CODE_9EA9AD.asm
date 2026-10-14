; Unidentified routine.
CODE_9EA9AD:
	stz.w $1523,x
CODE_9EA9B0:
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w facedir,x
	sta.b d2
	lda.b d0
	sec
	sbc.b d2
	and.w #$0007
	asl a
	sta.b d0
	tax
	lda.l DATA8_9EAAA3,x
	ldx.b a3
	cmp.w #$0000
	bne CODE_9EA9D5
	jmp.w noturn0
