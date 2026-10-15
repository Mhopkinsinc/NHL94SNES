; Edit Lines menu: Return to Game and Restore default lines
EditLinesMenu:
	jsr.w ClearEditLinesMenu
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ReturnToGameTxt>>16
	sta.b $8F
	lda.w #ReturnToGameTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #RestoreDefaultLinesTxt>>16
	sta.b $8F
	lda.w #RestoreDefaultLinesTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SendTextMap
	jsl.l WaitButtonRelease
	lda.w #$0000
	sta.w linemenuitem
.1:
	lda.w #$0000
	cmp.w linemenuitem
	bne .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #EditLinesMenuPos>>16
	sta.b $8F
	lda.w #EditLinesMenuPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #EditLinesMenuPos2>>16
	sta.b $8F
	lda.w #EditLinesMenuPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ReturnToGame>>16
	sta.b $8F
	lda.w #ReturnToGame
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	cmp.w linemenuitem
	bne .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #EditLinesMenuPos3>>16
	sta.b $8F
	lda.w #EditLinesMenuPos3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .3

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #EditLinesMenuPos4>>16
	sta.b $8F
	lda.w #EditLinesMenuPos4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.3:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #RestoreDefaultLines>>16
	sta.b $8F
	lda.w #RestoreDefaultLines
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$9080
	bne .7
	bit.w #$0400
	bne .6
	bit.w #$0800
	bne .5
.4:
	jmp.w .1
.5:
	lda.w #$0000
	sta.w linemenuitem
	bra .4
.6:
	lda.w #$0001
	sta.w linemenuitem
	bra .4
.7:
	lda.w linemenuitem
	cmp.w #$0000
	beq .t1xx
	bra .t2

.t1xx:
	lda.w #$FFFF
	bra .1x

.t2:
	jsl.l LoadTeamLines
	jsr.w ClearEditLinesMenu
	jsl.l DrawEditLinesTop
	lda.w #$0000
.1x:
	rts
