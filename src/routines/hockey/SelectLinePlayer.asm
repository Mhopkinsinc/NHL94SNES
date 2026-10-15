; Line editor: pick a player for the cursor slot from the list (attribute pages, up / down); A = the player, negative when cancelled
SelectLinePlayer:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #SelectLinePlayerPos>>16
	sta.b $8F
	lda.w #SelectLinePlayerPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SpriteFrameStart
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.w #PlayerListMap>>16
	sta.b $0E
	lda.w #PlayerListMap
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	ldx.w #$0001
	ldy.w #$0001
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l WaitFrame
	jsl.l PasteMap
	jsl.l SendTextMapRows
	jsl.l SendTextMap2Rows
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0003
	bpl .t1
	jsl.l GetDefenseCount
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DAB
	jsl.l GetForwardCount
	lda.w $1DAB
	clc
	adc.b d0
	sta.w $1DAB
	bra .3

.t1:
	jsl.l GetForwardCount
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DAB
.3:
	sta.w $1DA7
	lda.w #$0009
	cmp.w $1DA3
	beq .1
	bmi .1
	lda.w $1DA3
.1:
	sta.w $1DAF
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l GetTeamLines
	lda.b a3
	clc
	adc.b d0
	clc
	adc.w $1D9F
	sec
	sbc.w $1D8B
	sta.b a3
	jsr.w ReadLineSlot
	sta.w $1D9B
	lda.w $1DAF
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl .t1x
	lda.w $1D9B
	sec
	sbc.w $1DAF
	sec
	sbc.w $1DA7
	bmi .2
	clc
	adc.w $1DA7
	sta.w $1DA7
.2:
	lda.w #$0000
	bra .4

.t1x:
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
.4:
	sta.w $1D9B
	jsl.l .10
.5:
	jsl.l SendTextMap
	jsl.l SendTextMap2
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t2
	lda.w #$FFFF
	jmp.w SelectLinePlayerRtl

.t2:
	bit.w #$8080
	beq .t1xx
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
	jmp.w SelectLinePlayerRtl

.t1xx:
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne .7
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne .7
	bit.w #$0400
	bne .1x
	inc.b d0
	inc.b d0
	bit.w #$0800
	beq .6
.1x:
	lda.b d0
	clc
	adc.w $1D9B
	bmi .8
	cmp.w $1DAF
	bpl .9
	sta.w $1D9B
	jsl.l .10
.6:
	jmp.w .5
.7:
	lda.b d0
	clc
	adc.w DispAttribCtr
	sta.b d0
	bmi .6
	sta.w DispAttribCtr
	jsl.l .10
	bra .6
.8:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl .6
	inc.w $1DA7
	jsl.l .10
	lda.w #$FFFF
	sta.w BG3VScroll
	bra .6
.9:
	lda.w $1DA7
	cmp.w $1DAB
	beq .6
	dec.w $1DA7
	jsl.l .10
	lda.w #$FFFF
	sta.w BG3VScroll
	lda.w #$FFFF
	sta.w BG1VScroll
	jmp.w .6
.10:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #SelectLinePlayerPos2>>16
	sta.b $8F
	lda.w #SelectLinePlayerPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
.1xx:
	lda.w #SkaterAttribColumns
	sta.b a1
	lda.w #$009B
	sta.b $8F
	lda.w DispAttribCtr
	sta.b d0
	lda.w SelectedPlayerIdx
	bne .3x
	lda.w #AttribMenuGoalie
	sta.b a1
	lda.w #AttribMenuGoalie>>16
	sta.b $8F
	bra .3x
.2x:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
.3x:
	lda.b [a1]
	bmi .1xxx
	dec.b d0
	bpl .2x
.1xxx:
	lda.b [a1]
	bpl .t1xxx
	dec.w DispAttribCtr
	bra .1xx

.t1xxx:
	lda.w #$3800
	sta.w printa
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
org $9B9001
	lda.b [a1],y
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PlayerTxt>>16
	sta.b $8F
	lda.w #PlayerTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DA7
	cmp.w $1DAB
	beq .1xxxx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #LeftArrowTxt>>16
	sta.b $8F
	lda.w #LeftArrowTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.1xxxx:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl .2xx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #RightArrowTxt>>16
	sta.b $8F
	lda.w #RightArrowTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2xx:
	jsr.w PrintLinePlayerList
	rtl
