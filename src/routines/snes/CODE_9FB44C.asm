; Unidentified routine.
CODE_9FB44C:
	lda.l $7E34C6
	bne .t1
	jmp.w CODE_9FB517

.t1:
	lda.b d0
	cmp.w $1C84
	bne .t3
	jmp.w CODE_9FB517

.t3:
	cmp.w $1C86
	bne .t1x
	jmp.w CODE_9FB517

.t1x:
	cmp.w $1C88
	bne .t2
	jmp.w CODE_9FB517

.t2:
	cmp.w $1C8A
	bne .t1xx
	jmp.w CODE_9FB517

.t1xx:
	cmp.w $1C8C
	bne CODE_9FB47F
	jmp.w CODE_9FB517
