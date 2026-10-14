; Unidentified routine.
CODE_9FC287:
	lda.w $0B05,x
	bit.w #$0001
	bne .1
	and.w #$0002
	bne CODE_9FC298
.1:
	jml.l doplayeracc
