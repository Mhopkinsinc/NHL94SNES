; Unidentified routine.
SetPlList:
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
	lda.w #$0000
	sta.b [$99]
	ldy.w #$0002
	sta.b [$99],y
	ldy.w #$0004
	sta.b [$99],y
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	lda.w $1E9B
	beq CODE_9FD59A
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B7
	sta.b $89
	lda.b $91
	cmp.w $1E91
	bne CODE_9FD5A3
	inc.b $89
	bra CODE_9FD5A3
