; Step object X's sprite animation, looping or ending it
updateanim:
	lda.w SPA,x
	bne CODE_9EA442
	stz.w $1543,x
	stz.w pfalock,x
	rtl
