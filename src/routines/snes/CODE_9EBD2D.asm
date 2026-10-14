; Unidentified routine.
CODE_9EBD2D:
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jml.l CODE_9EA5A4
