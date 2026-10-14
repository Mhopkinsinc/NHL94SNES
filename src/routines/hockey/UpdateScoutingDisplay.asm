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
CODE_9EC9CB:
	lda.b [a2]
	inc.b a2
	and.w #$00FF
	cmp.w #$000D
	bne CODE_9EC9CB
CODE_9EC9D7:
	dec.b d0
	bpl CODE_9EC9CB
	lda.b a2
	sec
	sbc.b a1
	sta.b d0
CODE_9EC9E2:
	lda.b a1
	clc
	adc.b d0
	sta.b a2
	lda.b $8F
	sta.b $93
	lda.w #$000A
	sta.w ScoutingReportTimer
	lda.w $0D47
	sta.b d0
	lda.b [a2]
	and.w #$00FF
	cmp.w #$0025
	beq .t1
	jmp.w ScoutPlainWord

.t1:
	inc.b a2
	lda.b [a2]
	inc.w PlayerScrollCtr
	and.w #$00FF
	cmp.w #$0072
	bne .t3
	jmp.w ScoutHomeArena

.t3:
	cmp.w #$0076
	bne .t1x
	jmp.w ScoutVisCity

.t1x:
	cmp.w #$0068
	bne .t2
	jmp.w ScoutHomeCity

.t2:
	cmp.w #$0056
	bne .t1xx
	jmp.w ScoutVisName

.t1xx:
	cmp.w #$0048
	bne .t5
	jmp.w ScoutHomeName

.t5:
	cmp.w #$006D
	bne .t1x2
	jmp.w ScoutVisNick

.t1x2:
	cmp.w #$006E
	bne .t2x
	jmp.w ScoutHomeNick

.t2x:
	cmp.w #$0074
	bne .t1xx2
	jmp.w ScoutHotTeam

.t1xx2:
	cmp.w #$0065
	bne .t3x
	jmp.w ScoutExtremely

.t3x:
	cmp.w #$0030
	bne .t1x2x
	jmp.w ScoutHomeHot1

.t1x2x:
	cmp.w #$0031
	bne .t2xx
	jmp.w ScoutHomeHot2

.t2xx:
	cmp.w #$0032
	bne .t1xxx
	jmp.w ScoutHomeHot3

.t1xxx:
	cmp.w #$0033
	bne .t4
	jmp.w ScoutHomeCold1

.t4:
	cmp.w #$0034
	bne .t1x3
	jmp.w ScoutHomeCold2

.t1x3:
	cmp.w #$0035
	bne .t2x2
	jmp.w ScoutHomeCold3

.t2x2:
	cmp.w #$0036
	bne .t1xx2x
	jmp.w ScoutVisHot1

.t1xx2x:
	cmp.w #$0037
	bne .t3xx
	jmp.w ScoutVisHot2

.t3xx:
	cmp.w #$0038
	bne .t1x2xx
	jmp.w ScoutVisHot3

.t1x2xx:
	cmp.w #$0039
	bne .t2xxx
	jmp.w ScoutVisCold1

.t2xxx:
	cmp.w #$0061
	bne .t1xxxx
	jmp.w ScoutVisCold2

.t1xxxx:
	cmp.w #$0062
	bne ScoutPlainWord
	jmp.w ScoutVisCold3
