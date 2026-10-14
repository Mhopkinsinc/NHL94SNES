; Unidentified routine.
CODE_9EBD2D:
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jml.l CODE_9EA5A4
