; Unidentified routine.
CODE_9FA586:
	lda.b $04,s
	sta.w printx
	inc.w printy
	lda.b $A5
	jsl.l CODE_9BC5AB
	jsl.l CODE_9EC7BE
	lda.b $04,s
	clc
	adc.w #$0017
	sta.w printx
	lda.b $A9
	sta.b $A5
	jsl.l PushNumber
	jml.l CODE_9EC7BE
