; Unidentified routine.
CODE_9E90B6:
	ldy.w $0AD9
	bmi CODE_9E90C0
	lda.w position,y
	beq CODE_9E9116
CODE_9E90C0:
	lda.w $0DF9
	cmp.w #$000D
	bpl CODE_9E9116
	ldy.b $91
	lda.b $AD
	sec
	sbc.w Xpos,y
	sta.b $AD
	cmp.w #$0017
	bpl CODE_9E9116
	lda.b $AD
	cmp.w #$FFEA
	bmi CODE_9E9116
	lda.w #$0009
	sta.b $B9
	lda.b $B1
	sec
	sbc.w Ypos,y
	sta.b $B1
	cmp.w #$000A
	bpl CODE_9E9116
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
	lda.b $B1
	cmp.w #$FFF7
	bmi CODE_9E9116
	lda.w #$FFFF
	sta.w $0CDB
	lda.w $0DFF
	cmp.w #$000D
	bmi CODE_9E9117
	lda.w $0DFF
	sta.w $0DF9
	jmp.w $92AE
