; Unidentified routine.
CODE_9EC791:
	lda.w $163A
	beq CODE_9EC7BD
	lda.w $1E9B
	beq CODE_9EC7BD
	phx
	stz.w $1E9B
	lda.w #$FFFF
	sta.w $1E8D
	lda.w #$000A
	sta.b d0
	jsl.l ShootoutWonBy
	lda.w $1E97
	sta.l $7E30F8
	lda.w $1E99
	sta.l $7E30FA
	plx
CODE_9EC7BD:
	rtl
