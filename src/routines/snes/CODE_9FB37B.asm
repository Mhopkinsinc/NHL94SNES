; Unidentified routine.
CODE_9FB37B:
	and.w #$FFFD
	sta.w pflags,x
	lda.w gameclock
	bne CODE_9FB38A
CODE_9FB386:
	jml.l CODE_9F8CB1
