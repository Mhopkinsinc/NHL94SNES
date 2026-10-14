; Move the replay one frame back
suba4:
	lda.b a4
	cmp.w #ReplayBufferStart
	bne .a4ne
	lda.b a4+2
	cmp.w #ReplayBufferStart>>16
	bne .a4ne
	lda.w sflags
	bit.w #sfwrap
	beq CODE_9BB12F
	lda.w #ReplayBufferEnd>>16
	sta.b a4+2
	lda.w #ReplayBufferEnd
	sta.b a4
.a4ne:
	lda.b a4
	sec
	sbc.w #replaysize
	sta.b a4
	lda.b a4+2
	sbc.w #$0000
	sta.b a4+2
	lda.b a4
	cmp.w ReplayBufferPtr
	beq CODE_9BB0FF
	jml.l CODE_9BB19D
