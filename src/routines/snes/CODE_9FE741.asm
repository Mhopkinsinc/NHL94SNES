; Unidentified routine.
CODE_9FE741:
	lda.b d1
	bit.w #$8080
	bne .t2
	jmp.w CODE_9FE19E

.t2:
	jsl.l CODE_9FF00B
	cmp.w #$0000
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	stz.w $07C6
	jml.l CODE_9F82D2
