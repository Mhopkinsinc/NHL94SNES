; Unidentified routine.
CODE_9EC01D:
	dec a
	sta.w tmpdst,y
	bit.w #$0800
	bne .t2
	jmp.w CODE_9EBF9E

.t2:
	bit.w #$1000
	bne .t1
	lda.w #$1000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList

.t1:
	lda.w #$0000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList
