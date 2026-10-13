; Unidentified routine.
CODE_9FEBC2:
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C90,y
	beq CODE_9FEBD9
	lda.w #$009F
	sta.b $9B
	lda.w #$EC42
	sta.b $99
	bra CODE_9FEBE3
