; Unidentified routine.
CODE_9FCD0A:
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$000C
.1:
	lda.w $19D4,y
	bpl .2
	lda.w position,y
	bpl .t1
.2:
	iny
	iny
	bra .1

.t1:
	phx
	jsl.l PadTakePosition
	plx
	rtl
