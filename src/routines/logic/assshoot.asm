; Unidentified routine.
assshoot:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE156
	and.w #$FFFD
	sta.w pflags,x
	bra SetShotMode
