; End the penalty shot or shootout attempt in progress ($163A and $1E9B): clear it, no shooter, ShootoutWonBy 10, put back the saved scores
EndPenaltyShot:
	lda.w $163A
	beq .rtl
	lda.w $1E9B
	beq .rtl
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
.rtl:
	rtl
