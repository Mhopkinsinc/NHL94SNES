; Unidentified routine.
CODE_9D8372:
	lda.b $B1
	sta.b $A9
	lda.b $A5
	sta.b $08
	cmp.w $1E61,y
	beq CODE_9D8381
	bpl CODE_9D8391
CODE_9D8381:
	cmp.w $1E65,y
	beq CODE_9D8388
	bpl CODE_9D83AD
CODE_9D8388:
	cmp.w $1E69,y
	beq CODE_9D83D3
	bpl CODE_9D83C9
	bra CODE_9D83D3
