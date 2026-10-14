; Unidentified routine.
CODE_9FDC8F:
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w $1563,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w position
	sta.b $A5
	jmp.w Setplass
