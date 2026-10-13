; Unidentified routine.
CODE_9B9818:
	bit.w #$0800
	bne CODE_9B987B
	bit.w #$0400
	bne CODE_9B9828
CODE_9B9822:
	jsl.l WaitFrame
	bra CODE_9B9808
