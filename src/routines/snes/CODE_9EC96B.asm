; Unidentified routine.
CODE_9EC96B:
	bvs CODE_9EC9B0
CODE_9EC96D:
	lda.w $1D5E
	bmi CODE_9EC977
	dec.w ScoutingReportTimer
	bpl CODE_9EC9B0
CODE_9EC977:
	lda.w #$0097
	sta.b $8F
	lda.w #PregameText
	sta.b a1
	lda.w PlayerScrollCtr
	sta.b d0
	bpl CODE_9EC9E2
	stz.w $0D47
	ldy.w SelectedPlayerIdx
	inc.w SelectedPlayerIdx
	inc.w SelectedPlayerIdx
	lda.w #$007E
	sta.b $8B
	lda.w #$347C
	sta.b a0
	lda.b [a0],y
	sta.b d0
	bpl CODE_9EC9B1
	lda.w #$7FFF
	sta.w ScoutingReportTimer
	lda.w #$01E0
	sta.w $0D41
CODE_9EC9B0:
	rtl
