; Move the replay one frame forward
adda4:
	stz.b d7
	lda.w sflags
	bit.w #sf2drec
	beq CODE_9BB167
	lda.b a4+2
	pha
	lda.b a4
	pha
	jsl.l adda43
	lda.b a4+2
	sta.b tmp1
	lda.b a4
	sta.b tmp0
	pla
	sta.b a4
	pla
	sta.b a4+2
	lda.b tmp0
	cmp.w ReplayBufferPtr
	bne CODE_9BB167
	lda.b tmp1
	cmp.w ReplayBufferPtr+2
	bne CODE_9BB167
	rtl
