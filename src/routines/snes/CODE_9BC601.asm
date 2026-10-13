; Unidentified routine.
CODE_9BC601:
	jsl.l CODE_9BC5AB
	lda.w #$0007
	sta.w printx
	jsl.l CODE_9EC894
	lda.w #$0014
	sta.w printx
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	rts
