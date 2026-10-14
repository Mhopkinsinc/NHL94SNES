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
	beq CODE_9FD59A
	lda.w #priolist>>16
	sta.b a0+2
	lda.w #priolist+7
	sta.b a0
	lda.b a2
	cmp.w $1E91
	bne CODE_9FD5A3
	inc.b a0
	bra CODE_9FD5A3
