; Unidentified routine.
CODE_9FC5A6:
	jsl.l CODE_9ECDE1
	lda.w #$000B
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jml.l eraser
