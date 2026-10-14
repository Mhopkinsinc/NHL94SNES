; Unidentified routine.
CODE_9FD5D0:
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	sta.b d5
	tay
	sep #$20
	lda.b [a1],y
	ldy.b d4
	sta.b [a4],y
	lda.b d5
	beq CODE_9FD5F1
	lda.w $1E9B
	beq CODE_9FD5F1
	lda.w $1E8F
	inc a
	sta.b [a4],y
CODE_9FD5F1:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b d5
	sta.b [a4],y
	rep #$20
	lda.b d5
	bne CODE_9FD61C
	ldy.b a2
	lda.w tmgoalie,y
	inc a
	sta.b d3
	bne CODE_9FD612
	lda.w $1E9B
	beq CODE_9FD612
	inc.b d3
CODE_9FD612:
	ldy.b d4
	sep #$20
	lda.b d3
	sta.b [a4],y
	rep #$20
CODE_9FD61C:
	dec.b d4
	bpl CODE_9FD5D0
	lda.w #$0005
	sta.b d4
CODE_9FD625:
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d3
	bne CODE_9FD633
	jmp.w CODE_9FD6B8
