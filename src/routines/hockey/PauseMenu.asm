; Pick which pause menu is up, then read the pad and run the selected item.
PauseMenu:
	lda.w #$FFFF
	sta.l $7E3476
	lda.w $1D81
	beq .t4
	lda.w $1EBB
	bne .t5
	bra .t6

.t4:
	lda.w gsp
	cmp.w #$0004
	beq .t2
	lda.w $1EBB
	bne .t3
	bra .t1

.t1:
	jsl.l ChoosePauseMenu
	bra .t7

.t2:
	lda.w #$000F
	sta.w $1EB9
	lda.w #$0001
	sta.w $1EB7
	bra .t7

.t3:
	lda.w #$0009
	sta.w $1EB9
	lda.w #$0002
	sta.w $1EB7
	bra .t7

.t5:
	lda.w #$0006
	sta.w $1EB9
	lda.w #$0003
	sta.w $1EB7
	bra .t7

.t6:
	lda.w #$0006
	sta.w $1EB9
	lda.w #$0004
	sta.w $1EB7
	bra .t7

.t7:
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$0002
	sta.w $0ADB
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
PauseMenuPoll:
	jsl.l CODE_9FEA24
	jsl.l SelectPauseController
	lda.b d3
	bit.w #$1000
	beq .t3
	jmp.w CODE_9FE73D

.t3:
	lda.b d1
	bit.w #$8080
	bne .t7
	bit.w #$0400
	beq .t2
	inc.w $0D15
	lda.w $1EB9
	cmp.w $0D15
	beq .t1
	lda.w $0D15
	sec
	sbc.w #$0005
	cmp.w $0D13
	bmi PauseMenuPoll
	inc.w $0D13
	bra PauseMenuPoll

.t1:
	dec.w $0D15
	bra PauseMenuPoll

.t2:
	bit.w #$0800
	beq .t7
	dec.w $0D15
	lda.w $0D15
	cmp.w $0D13
	bpl PauseMenuPoll
	dec.w $0D13
	bpl PauseMenuPoll
	stz.w $0D13
	stz.w $0D15
	bra PauseMenuPoll

.t7:
	lda.w $0D15
	asl a
	asl a
	sta.b d0
	tay
	lda.w $1EB7
	beq .t1x
	cmp.w #$0001
	beq .t3x
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t5
	cmp.w #$0004
	beq .t6
	bra .t2x

.t1x:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FE504
	sta.b a0
	bra .1

.t2x:
	lda.w #$009F
	sta.b $8B
	lda.w #$E544
	sta.b a0
	bra .1

.t3x:
	lda.w #$009F
	sta.b $8B
	lda.w #$E588
	sta.b a0
	bra .1

.t4:
	lda.w #$009F
	sta.b $8B
	lda.w #$E5C4
	sta.b a0
	bra .1

.t5:
	lda.w #$009F
	sta.b $8B
	lda.w #$E5E8
	sta.b a0
	bra .1

.t6:
	lda.w #$009F
	sta.b $8B
	lda.w #$E600
	sta.b a0
.1:
	lda.b [a0],y
	sta.w jmlvector+1
	iny
	lda.b [a0],y
	sta.w jmlvector+2
	jml.l jmlvector
