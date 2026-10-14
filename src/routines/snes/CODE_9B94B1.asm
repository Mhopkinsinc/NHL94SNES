; Unidentified routine.
CODE_9B94B1:
	bit.w #$0800
	bne CODE_9B9514
	bit.w #DMA_OAM
	bne CODE_9B94C1
CODE_9B94BB:
	jsl.l WaitFrame
	bra CODE_9B94A5
