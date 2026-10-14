; Unidentified routine.
CODE_9FDA34:
	lda.w #$0004
	sta.w facedir,x
	lda.w pflags,x
	and.w #$6FFF
	sta.w pflags,x
	stz.w $1563,x
	stz.w SPA,x
	lda.w #$1000
	sta.w $0EC3,x
	jml.l CODE_9E8BE6
