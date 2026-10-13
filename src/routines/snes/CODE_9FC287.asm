; Unidentified routine.
CODE_9FC287:
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9FC294
	and.w #$0002
	bne CODE_9FC298
CODE_9FC294:
	jml.l doplayeracc
