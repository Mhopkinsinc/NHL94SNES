; Edit Lines menu: Return to Game and Restore default lines
EditLinesMenu:
	jsr.w CODE_9B89E6
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF00A
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF01D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	jsl.l WaitButtonRelease
	lda.w #$0000
	sta.w $1D97
.1:
	lda.w #$0000
	cmp.w $1D97
	bne .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF037
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF03C
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
	lda.w #$009C
	sta.b $8F
	lda.w #ReturnToGame
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	cmp.w $1D97
	bne .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF051
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF056
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
	lda.w #$009C
	sta.b $8F
	lda.w #RestoreDefaultLines
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l CODE_9B851F
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
	sta.w $1D97
	bra .4
.6:
	lda.w #$0001
	sta.w $1D97
	bra .4
.7:
	lda.w $1D97
	cmp.w #$0000
	beq .t1xx
	bra .t2

.t1xx:
	lda.w #$FFFF
	bra .1x

.t2:
	jsl.l CODE_9B9334
	jsr.w CODE_9B89E6
	jsl.l CODE_9B890F
	lda.w #$0000
.1x:
	rts
