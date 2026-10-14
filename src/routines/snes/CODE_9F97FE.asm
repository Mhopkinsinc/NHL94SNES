; Unidentified routine.
CODE_9F97FE:
	lda.w #$0003
	sta.b d0
CODE_9F9803:
	lda.w #$009F
	sta.b $8F
	lda.w #StatusTextTbl
	sta.b a1
	jml.l CODE_9ECFC6
