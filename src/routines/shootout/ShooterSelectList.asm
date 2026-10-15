; Shootout shooters: the select-player list
ShooterSelectList:
	jsl.l SpriteFrameStart
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #ShooterSelectListPos>>16
	sta.b a1+2
	lda.w #ShooterSelectListPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
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
	jsl.l PasteMap
	jsl.l SendTextMapRows
	jsl.l SendTextMap2Rows
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.w $1DA3
	sec
	sbc.b d0
	sta.w $1DA3
	lda.b d0
	sta.w $1DAB
	lda.b d0
	sta.w $1DA7
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .list
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
.list:
	lda.b a3
	clc
	adc.w $1DB9
	sta.b a3
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.w $1D9B
	lda.w #$0008
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl .t1
	lda.w $1D9B
	sec
	sbc.w #$0008
	sec
	sbc.w $1DA7
	bmi .zero
	clc
	adc.w $1DA7
	sta.w $1DA7
.zero:
	lda.w #$0000
	bra .1

.t1:
	lda.w $1DA7
	clc
	adc.w #$0008
	sec
	sbc.w $1D9B
.1:
	sta.w $1D9B
	jsl.l PrintShooterList
.2:
	jsl.l SendTextMap
	jsl.l SendTextMap2
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne .1x
	bit.w #$0800
	bne .t4
	bit.w #$0400
	bne .t3
	bit.w #$0100
	bne .t1x
	bit.w #$0200
	bne .t2
	bit.w #$8080
	beq .2
	jsl.l SetShooter
.1x:
	lda.w #$0001
	sta.l $7E3468
	rtl

.t1x:
	lda.w DispAttribCtr
	inc a
	cmp.w #$0010
	bpl .2
	sta.w DispAttribCtr
	jsl.l PrintShooterList
	bra .2

.t2:
	lda.w DispAttribCtr
	dec a
	bmi .2
	sta.w DispAttribCtr
	jsl.l PrintShooterList
	jmp.w .2

.t3:
	lda.w $1D9B
	dec a
	bmi .t5
	sta.w $1D9B
	jsl.l PrintShooterList
	jmp.w .2

.t4:
	lda.w $1D9B
	inc a
	cmp.w #$0009
	bpl .t6
	sta.w $1D9B
	jsl.l PrintShooterList
	jmp.w .2

.t5:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w #$0009
	cmp.w $1DA3
	bmi .t1xx
	jmp.w .2

.t1xx:
	inc.w $1DA7
	jsl.l PrintShooterList
	jmp.w .2

.t6:
	lda.w $1DA7
	dec a
	cmp.w $1DAB
	bpl .t1x2
	jmp.w .2

.t1x2:
	dec.w $1DA7
	jsl.l PrintShooterList
org $80D001
	jmp.w .2
