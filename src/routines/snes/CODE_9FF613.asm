; Unidentified routine.
CODE_9FF613:
	lda.b $B7
	sta.b d4
	lda.b d4
	cmp.w #$000D
	beq .1
	lda.w JoyPad
	beq .1
.1:
	lda.b $C3
	beq .t1
	jmp.w CODE_9FF898

.t1:
	lda.b d4
	asl a
	tax
	jmp (DATA8_9FF631,x)
