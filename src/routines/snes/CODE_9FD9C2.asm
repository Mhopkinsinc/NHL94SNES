; Unidentified routine.
CODE_9FD9C2:
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
CODE_9FD9CB:
	lda.w newpos,x
	sta.b d0
	sta.w position,x
	jsl.l Setplass
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	rtl
