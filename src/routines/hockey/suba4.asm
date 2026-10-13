; Unidentified routine.
suba4:
	lda.b $99
	cmp.w #$577E
	bne CODE_9BB0E5
	lda.b $9B
	cmp.w #$007E
	bne CODE_9BB0E5
	lda.w sflags
	bit.w #$0010
	beq CODE_9BB12F
	lda.w #$007E
	sta.b $9B
	lda.w #$E676
	sta.b $99
CODE_9BB0E5:
	lda.b $99
	sec
	sbc.w #$007A
	sta.b $99
	lda.b $9B
	sbc.w #$0000
	sta.b $9B
	lda.b $99
	cmp.w ReplayBufferPtr
	beq CODE_9BB0FF
	jml.l CODE_9BB19D
