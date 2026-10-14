; Read the pads with key repeat. A held button repeats after a delay
ProcessInputWithRepeat:
	lda.b d3
	beq CODE_9B8543
	lda.b d2
	bne CODE_9B8544
	dec.w $0AC4
	bpl CODE_9B8543
	lda.w #$0006
	sta.w $0AC4
	lda.b d3
	sta.b d1
CODE_9B8543:
	rtl
