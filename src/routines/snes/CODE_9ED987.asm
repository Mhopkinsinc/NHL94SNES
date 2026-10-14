; Unidentified routine.
CODE_9ED987:
	lda.b $A5
	clc
	adc.w #$0006
	sta.b $A5
	jmp.w CODE_9EDA04
