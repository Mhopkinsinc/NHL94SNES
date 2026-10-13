; Unidentified routine.
adda4:
	stz.b $C1
	lda.w sflags
	bit.w #$0400
	beq CODE_9BB167
	lda.b $9B
	pha
	lda.b $99
	pha
	jsl.l adda43
	lda.b $9B
	sta.b $C7
	lda.b $99
	sta.b $C5
	pla
	sta.b $99
	pla
	sta.b $9B
	lda.b $C5
	cmp.w ReplayBufferPtr
	bne CODE_9BB167
	lda.b $C7
	cmp.w $0D21
	bne CODE_9BB167
	rtl
