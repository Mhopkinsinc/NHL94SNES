; Unidentified routine.
CODE_9FE259:
	lda.w #$009F
	sta.b $8B
	lda.w #$E600
	sta.b $89
CODE_9FE263:
	lda.b [$89],y
	sta.w $1D5A
	iny
	lda.b [$89],y
	sta.w $1D5B
	jml.l $001D59
