; Unidentified routine.
CODE_9FEC07:
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C94,y
	beq CODE_9FEC1E
	lda.w #$009F
	sta.b $9B
	lda.w #$EC57
	sta.b a4
	bra CODE_9FEC28
