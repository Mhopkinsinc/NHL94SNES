; Make the list of the players team a2 wants on the ice now
SetPlList:
	lda.w #PlList>>16
	sta.b a4+2
	lda.w #PlList
	sta.b a4
	lda.w #$0000
	sta.b [a4]
	ldy.w #$0002
	sta.b [a4],y
	ldy.w #$0004
	sta.b [a4],y
	lda.w #priolist>>16
	sta.b a0+2
	lda.w #priolist
	sta.b a0
	lda.w $1E9B
	beq .t1
	lda.w #priolist>>16
	sta.b a0+2
	lda.w #priolist+7
	sta.b a0
	lda.b a2
	cmp.w $1E91
	bne CODE_9FD5A3
	inc.b a0
	bra CODE_9FD5A3

.t1:
	ldy.b a2
	lda.w tmgoalie,y
	bpl CODE_9FD5A3
	inc.b a0
CODE_9FD5A3:
	lda.b $97
	pha
	lda.b a3
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b $97
	ldy.b a2
	lda.w tmline,y
	asl a
	asl a
	asl a
	sta.b d0
	adc.b a1
	sta.b a1
	lda.w tmap,y
	sta.b d4
	bra CODE_9FD61C
