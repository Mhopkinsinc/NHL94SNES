; Pick which pause menu is up, then read the pad and run the selected item.
PauseMenu:
	lda.w #$FFFF
	sta.l pausemenuon
	lda.w shootoutmode
	beq .t4
	lda.w pregamepause
	bne .t5
	bra .t6

.t4:
	lda.w gsp
	cmp.w #$0004
	beq .t2
	lda.w pregamepause
	bne .t3
	bra .t1

.t1:
	jsl.l ChoosePauseMenu
	bra .t7

.t2:
	lda.w #$000F
	sta.w pmenucount
	lda.w #$0001
	sta.w pmenulist
	bra .t7

.t3:
	lda.w #$0009
	sta.w pmenucount
	lda.w #$0002
	sta.w pmenulist
	bra .t7

.t5:
	lda.w #$0006
	sta.w pmenucount
	lda.w #$0003
	sta.w pmenulist
	bra .t7

.t6:
	lda.w #$0006
	sta.w pmenucount
	lda.w #$0004
	sta.w pmenulist
	bra .t7

.t7:
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$0002
	sta.w timestep
	lda.w #$FFFF
	sta.l colourbuf+$1DE
	sta.l colourbuf+$1FE
PauseMenuPoll:
	jsl.l Pmenu
	jsl.l SelectPauseController
	lda.b d3
	bit.w #$1000
	beq .t3
	jmp.w PauseResumeRtl

.t3:
	lda.b d1
	bit.w #$8080
	bne .t7
	bit.w #$0400
	beq .t2
	inc.w psitem
	lda.w pmenucount
	cmp.w psitem
	beq .t1
	lda.w psitem
	sec
	sbc.w #$0005
	cmp.w psfirst
	bmi PauseMenuPoll
	inc.w psfirst
	bra PauseMenuPoll

.t1:
	dec.w psitem
	bra PauseMenuPoll

.t2:
	bit.w #$0800
	beq .t7
	dec.w psitem
	lda.w psitem
	cmp.w psfirst
	bpl PauseMenuPoll
	dec.w psfirst
	bpl PauseMenuPoll
	stz.w psfirst
	stz.w psitem
	bra PauseMenuPoll

.t7:
	lda.w psitem
	asl a
	asl a
	sta.b d0
	tay
	lda.w pmenulist
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
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers
	sta.b a0
	bra .1

.t2x:
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers+64
	sta.b a0
	bra .1

.t3x:
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers+132
	sta.b a0
	bra .1

.t4:
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers+192
	sta.b a0
	bra .1

.t5:
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers+228
	sta.b a0
	bra .1

.t6:
	lda.w #PauseMenuHandlers>>16
	sta.b a0+2
	lda.w #PauseMenuHandlers+252
	sta.b a0
.1:
	lda.b [a0],y
	sta.w jmlvector+1
	iny
	lda.b [a0],y
	sta.w jmlvector+2
	jml.l jmlvector
