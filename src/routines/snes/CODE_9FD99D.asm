; Unidentified routine.
CODE_9FD99D:
	lda.w pfnc,x
	bne CODE_9FD96D
	lda.w pflags,x
	bit.w #$4008
	bne CODE_9FD96D
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	jml.l CODE_9EA5A4
