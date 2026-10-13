; Unidentified routine.
ClearTeamStats:
	lda.w tmgoalie
	pha
	lda.w $17AC
	pha
	ldx.w #$0000
CODE_9FC6BD:
	stz.w $1742,x
	inx
	inx
	cpx.w #$01AC
	bne CODE_9FC6BD
	pla
	sta.w $17AC
	pla
	sta.w tmgoalie
	lda.w #$FFFF
	sta.w tmboxlist
	sta.w $18D4
setteams:
	stz.w tmsort
	lda.w #$000C
	sta.w $1768
	lda.w HomeTeam
	sta.w $1CE0
	asl a
	asl a
	tax
	lda.l TeamList,x
	sta.w tmdata
	lda.w VisTeam
	sta.w $1CE2
	asl a
	asl a
	tax
	lda.l TeamList,x
	sta.w $1CDE
	rtl
