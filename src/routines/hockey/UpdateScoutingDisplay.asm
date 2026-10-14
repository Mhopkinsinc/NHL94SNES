; Every frame of the scouting report: print the next word when its timer runs out
UpdateScoutingDisplay:
	lda.w ScoutingReportTimer
	sec
	sbc.w #$1000
	beq CODE_9EC96D
	bmi .t1
	bvs CODE_9EC96D
	bra CODE_9EC9B0

.t1:
	bvs CODE_9EC9B0
CODE_9EC96D:
	lda.w $1D5E
	bmi .1
	dec.w ScoutingReportTimer
	bpl CODE_9EC9B0
.1:
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
