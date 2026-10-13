; Unidentified routine.
CODE_9F97FE:
	lda.w #$0003
	sta.b $A5
CODE_9F9803:
	lda.w #$009F
	sta.b $8F
	lda.w #StatusTextTbl
	sta.b $8D
	jml.l CODE_9ECFC6
