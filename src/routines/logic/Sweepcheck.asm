; Start a sweep check by player X (SPAsweepchk, held in $1543)
Sweepcheck:
	lda.w #SPAsweepchk
	sta.w $1543,x
	jml.l SetSPAFromA
