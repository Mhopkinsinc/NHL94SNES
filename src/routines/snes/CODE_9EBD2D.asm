; Unidentified routine.
CODE_9EBD2D:
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	jml.l CODE_9EA5A4
