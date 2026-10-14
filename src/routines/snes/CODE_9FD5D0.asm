; Unidentified routine.
CODE_9FD5D0:
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	sta.b $B9
	tay
	sep #$20
	lda.b [$8D],y
	ldy.b $B5
	sta.b [$99],y
	lda.b $B9
	beq CODE_9FD5F1
	lda.w $1E9B
	beq CODE_9FD5F1
	lda.w $1E8F
	inc a
	sta.b [$99],y
CODE_9FD5F1:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $B9
	sta.b [$99],y
	rep #$20
	lda.b $B9
	bne CODE_9FD61C
	ldy.b $91
	lda.w tmgoalie,y
	inc a
	sta.b $B1
	bne CODE_9FD612
	lda.w $1E9B
	beq CODE_9FD612
	inc.b $B1
CODE_9FD612:
	ldy.b $B5
	sep #$20
	lda.b $B1
	sta.b [$99],y
	rep #$20
CODE_9FD61C:
	dec.b $B5
	bpl CODE_9FD5D0
	lda.w #$0005
	sta.b $B5
CODE_9FD625:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B1
	bne CODE_9FD633
	jmp.w CODE_9FD6B8
