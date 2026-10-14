; Unidentified routine.
CODE_9FD99D:
	lda.w $1563,x
	bne CODE_9FD96D
	lda.w pflags,x
	bit.w #$4008
	bne CODE_9FD96D
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l skateto
