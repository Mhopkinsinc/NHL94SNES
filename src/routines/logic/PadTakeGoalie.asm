; Pad d4 takes its team's goalie (PadTakePosition with position 0)
PadTakeGoalie:
	lda.w #$0000
	bra PadTakePosition
