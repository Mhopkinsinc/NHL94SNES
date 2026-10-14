; Erase the scouting report name line
EraseScoutName:
	jsl.l ScoutNamePos
	lda.w #$000B
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jml.l eraser
