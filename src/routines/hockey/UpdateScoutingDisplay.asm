; Every frame of the scouting report: print the next word when its timer runs out
UpdateScoutingDisplay:
	lda.w ScoutingReportTimer
	sec
	sbc.w #$1000
	beq .2
	bmi .t1
	bvs .2
	bra CODE_9EC9B0

.t1:
	bvs CODE_9EC9B0
.2:
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
CODE_9EC9B1:
	lda.w VertLineScrolling
	cmp.w #$0001
	bmi .1
	jsl.l ScrollDisplayUp
.1:
	jsl.l ScrollDisplayUp
	lda.b $8F
	sta.b $93
	lda.b a1
	sta.b a2
	bra CODE_9EC9D7
