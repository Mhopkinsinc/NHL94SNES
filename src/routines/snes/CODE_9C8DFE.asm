; Unidentified routine.
CODE_9C8DFE:
	jsl.l WaitFrame
	jsl.l CODE_9B851F
	lda.b d3
	bit.w #$1000
	beq .t1
	jmp.w CODE_9C8E9B

.t1:
	bit.w #$0800
	beq .t2
.1:
	jmp.w CODE_9C8E9C

.t2:
	bit.w #DMA_OAM
	beq .t1x
	jmp.w CODE_9C8EDD

.t1x:
	bra CODE_9C8DFE
