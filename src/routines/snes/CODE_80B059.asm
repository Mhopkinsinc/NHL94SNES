; Unidentified routine.
CODE_80B059:
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B05F:
	lda.w $07C2
	sta.w $2D40,x
	lda.w $2E40,x
	rts
